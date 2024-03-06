OUTPUT_FILE=client_certs/apicapi-gateway-qa.appsptqa.ath.com.co.pem
KEY_FILE=rb-stg-pb.avaldigitallabs.com.key
CERT_FILE=bavv.cer
openssl rsa -in $KEY_FILE -passin file:noPass.txt -out decrypted_private_key.pem
openssl rsa -in decrypted_private_key.pem -passin file:noPass.txt -out rsa_private_key.pem
cp rsa_private_key.pem $OUTPUT_FILE
cat $CERT_FILE >> $OUTPUT_FILE
