const AWS = require('aws-sdk');
AWS.config.update({ region: 'us-east-1' });

const functionName = process.env.AWS_LAMBDA_FUNCTION_NAME;
const encrypted = process.env['Password'];
const userName = process.env['UserName'];
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
      console.log('Decrypted value of password:',decrypted );
    } catch (err) {
      console.log('Decrypt error:', err);
      throw err;
    }
  }
  processEvent(event);
   const response = {
        UserName: userName,
        Password: decrypted
    };
    return response;
};
