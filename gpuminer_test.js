var web3utils =  require('web3-utils');

//import C++ GPU miner code --  /cpp/gpuminer.cc

const GPUMiner = require('./build/Release/gpuminer_addon');

var difficultyTarget = 5841053340;
var challengeNumber = 2000000;
var ethAddress = '0x1888fc11c23dcca6fe5749c2f0b59e9ed860e181';

//send data to the miner
 console.log('diff target' ,GPUMiner.setDifficultyTarget(difficultyTarget));
 console.log('challenge number',GPUMiner.setChallengeNumber(challengeNumber));
 console.log('eth address',GPUMiner.setEthAddress(ethAddress));
 console.log('random number',GPUMiner.getRandomNumber());

//start the mining loop which is in c++
setInterval(function(){
//  console.log('asking GPU process for solutions...')
  var gpu_solutions = GPUMiner.getSolutionsBuffer()
//  console.log(gpu_solutions);

  var gpu_solutions = GPUMiner.clearSolutionsBuffer()
},2000)

setTimeout(function(){
  var response = GPUMiner.startMining()
 // console.log(response)

},0)
