exports.handler = async function(event) {
  const { numberA, numberB} = event;
  
  function wait(){
        return new Promise((resolve, reject) => {
            setTimeout(() => resolve("Hello FD, Test zip file. Test 25-07-23-22-36"), 1000)
        });
    }
    
    console.log(await wait());
  
  return { 
    "sumResult": numberA + numberB 
  };
}