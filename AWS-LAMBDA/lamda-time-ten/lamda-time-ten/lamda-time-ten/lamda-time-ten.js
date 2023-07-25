exports.handler = async function(event) {
  const { numberA, numberB} = event;
  
  function wait(){
        return new Promise((resolve, reject) => {
            setTimeout(() => resolve("Hello FD, Code to check s3-trigger option."), 5000)
        });
    }
    
    console.log(await wait());
  
  return { 
    "sumResult": numberA + numberB 
  };
}