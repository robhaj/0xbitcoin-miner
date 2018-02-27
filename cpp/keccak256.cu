/*
 * Keccak 256
 *
 */

#include "sph/sph_shavite.h"
#include "sph/sph_simd.h"
#include "sph/sph_keccak.h"
#include "cuda.cu"
#include "cuda_keccak256.cu"
#include "keccak256.h"
#include <cstring>

static uint32_t h_nounce[MAX_GPUS][2];

// CPU Hash
void keccak256_hash(void *state, const void *input)
{
	sph_keccak_context ctx_keccak;

	uint32_t hash[16];

	sph_keccak256_init(&ctx_keccak);
	sph_keccak256 (&ctx_keccak, input, 80);
	sph_keccak256_close(&ctx_keccak, (void*) hash);

	memcpy(state, hash, 32);
}

static bool init[MAX_GPUS] = { 0 };

int scanhash_keccak256(int thr_id, uint32_t *pdata,
	const uint32_t *ptarget, uint32_t max_nonce,
	unsigned long *hashes_done)
{
	const uint32_t first_nonce = pdata[19];
	uint32_t intensity = (device_sm[device_map[thr_id]] > 500) ? 1 << 28 : 1 << 27;;
	uint32_t throughput = device_intensity(device_map[thr_id], __func__, intensity); // 256*4096
	throughput = min(throughput, max_nonce - first_nonce);

//	printf ("intensity: %u throughput %u \n", intensity, throughput);
//	printf ("first %i max %i \n", first_nonce, max_nonce);

	if (!init[thr_id]) {
		cudaSetDevice(device_map[thr_id]);
		//if (!opt_cpumining) cudaSetDeviceFlags(cudaDeviceScheduleBlockingSync);
		//if (opt_n_gputhreads == 1)
		//{
		//	cudaDeviceSetCacheConfig(cudaFuncCachePreferL1);
		//}
		keccak256_cpu_init(thr_id, (int)throughput);
		init[thr_id] = true;
	}

	uint32_t endiandata[20];
	for (int k=0; k < 20; k++) {
		be32enc(&endiandata[k], ((uint32_t*)pdata)[k]);
	}

	keccak256_setBlock_80((void*)endiandata, (uint64_t *)ptarget);
	do {

		keccak256_cpu_hash_80(thr_id, (int) throughput, pdata[19], h_nounce[thr_id]);
		if (h_nounce[thr_id][0] != UINT32_MAX)
		{
			uint32_t Htarg = ptarget[7];
			uint32_t vhash64[8];
			be32enc(&endiandata[19], h_nounce[thr_id][0]);
			keccak256_hash(vhash64, endiandata);

			if (vhash64[7] <= Htarg && fulltest(vhash64, ptarget))
			{
				int res = 1;
				// check if there was some other ones...
				*hashes_done = pdata[19] - first_nonce + throughput;
				if (h_nounce[thr_id][1] != 0xffffffff)
				{
					pdata[21] = h_nounce[thr_id][1];
					res++;
				}
				pdata[19] = h_nounce[thr_id][0];
				return res;
			}
		}

		pdata[19] += throughput;
	} while (((uint64_t)max_nonce > ((uint64_t)(pdata[19]) + (uint64_t)throughput)));
	*hashes_done = pdata[19] - first_nonce;
	return 0;
}
