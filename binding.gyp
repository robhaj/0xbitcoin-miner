{
'conditions': [
    [ 'OS=="win"', {'variables': {'obj': 'obj'}},
    {'variables': {'obj': 'o'}}]],

"targets": [
{
 "target_name": "gpuminer_addon",
 "sources": [
   "cpp/gpumineralpha.cc",
   "cpp/keccak256.cu",
   "cpp/sph/kecack.c",
  ],

 'rules': [{
     'extension': 'cu',
     'inputs': ['<(RULE_INPUT_PATH)'],
     'outputs':[ '<(INTERMEDIATE_DIR)/<(RULE_INPUT_ROOT).o'],
     'rule_name': 'cuda on linux',
     'message': "compile cuda file on linux",
     'process_outputs_as_sources': 1,
     'action': [
        'nvcc',
	'-Xcompiler',
	'-fpic',
	'-c',
        '-o',
        '<@(_outputs)',
        '<@(_inputs)'
     ],
}],

   'conditions': [
    [ 'OS=="mac"', {
      'libraries': ['-framework CUDA'],
      'include_dirs': ['/usr/local/include'],
      'library_dirs': ['/usr/local/lib'],
    }],
    [ 'OS=="linux"', {
      'libraries': ['-lcuda', '-lcudart'],
      'include_dirs': ['/usr/local/include'],
      'library_dirs': ['/usr/local/lib', '/usr/local/cuda/lib64']
    }],
    [ 'OS=="win"', {
      'conditions': [
        ['target_arch=="x64"',
          {
            'variables': { 'arch': 'x64' }
          }, {
            'variables': { 'arch': 'Win32' }
          }
        ],
      ],
      'variables': {
        'cuda_root%': '$(CUDA_PATH)'
      },
      'libraries': [
        '-l<(cuda_root)/lib64/libcuda.lib',
        '-l<(cuda_root)/lib64/libcudart.lib',
      ],
      "include_dirs": [
        "<(cuda_root)/include",
      ],
    }, {
      "include_dirs": [
        "/usr/local/cuda/include"
      ],
    }]
  ]
}
]
}
