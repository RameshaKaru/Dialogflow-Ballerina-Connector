#### Running module_dialogflow tests
In order to run the tests, the user will need to have a Dialogflow project and configure the `ballerina.conf` configuration
file with the obtained client access token.

###### ballerina.conf
```ballerina.conf
//Give the credentials and tokens for the authorized user
ACCESS_TOKEN="Your access token"


```
Run tests :
```

ballerina init
ballerina test module_dialogflow --config module_dialogflow/tests/ballerina.conf
