const AWS = require('aws-sdk');
AWS.config.update({ region: 'us-east-1' });

const functionName = process.env.AWS_LAMBDA_FUNCTION_NAME;
let password;
let userName;
let connectionString;

function processEvent(event) {
}

exports.handler = async (event) => {

    const kms = new AWS.KMS();
    try {
      password = process.env['Password'];
      userName = process.env['UserName'];
      connectionString = process.env['Mysql_Connection_String'];
      let req = {
        CiphertextBlob: Buffer.from(password, 'base64'),
        EncryptionContext: { LambdaFunctionName: functionName },
      };
      let data = await kms.decrypt(req).promise();
      password= data.Plaintext.toString('ascii');

      req = {
        CiphertextBlob: Buffer.from(connectionString, 'base64'),
        EncryptionContext: { LambdaFunctionName: functionName },
      };
      data = await kms.decrypt(req).promise();
      connectionString = data.Plaintext.toString('ascii');
    } catch (err) {
      console.log('Decrypt error:', err);
      throw err;
    }
  
  processEvent(event);
   const response = {
        UserName: userName,
        Password: password,
        ConnectionString: connectionString
    };
    return response;
};