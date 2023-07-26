const AWS = require('aws-sdk');
AWS.config.update({ region: 'us-east-1' });

const functionName = process.env.AWS_LAMBDA_FUNCTION_NAME;
const encrypted = process.env['Password'];
const userName = process.env['UserName'];
const description = process.env['Description'];
let decrypted;


function processEvent(event) {
}

exports.handler = async (event) => {
  if (!decrypted) {
    const kms = new AWS.KMS();
    try {
      const req = {
        CiphertextBlob: Buffer.from(encrypted, 'base64'),
        EncryptionContext: { LambdaFunctionName: functionName },
      };
      const data = await kms.decrypt(req).promise();
      decrypted = data.Plaintext.toString('ascii');
    } catch (err) {
      console.log('Decrypt error:', err);
      throw err;
    }
  }
  processEvent(event);
   const response = {
        UserName: userName,
        Password: decrypted,
        Description: description
    };
    return response;
};