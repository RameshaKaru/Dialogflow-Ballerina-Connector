Connects Ballerina to Google Dialogflow API

# Ballerina Connector for [Google Dialogflow API](https://dialogflow.com)


* Access your customized chatbot model of Dialogflow directly from Ballerina

## Compatibility
|                    |    Version     |  
|:------------------:|:--------------:|
| Ballerina Language | 0.990.2        |
| Dialogflow APIs    | v1             |

## Sample

First, import `ramesha/module_dialogflow`

Instantiate the connector by giving authentication details in the HTTP client config, which has built-in support for OAuth 2.0. This uses OAuth 2.0 to authenticate and authorize requests. The connector can be minimally instantiated in the HTTP client config using the access token.

**Obtaining Access Tokens **

1. Visit [Dialogflow API Console](https://console.dialogflow.com),and sign in with your google account. For further details visit [Dialogflow documentation](https://dialogflow.com/docs/getting-started/create-account)
2. Create an agent for your chatbot.
3. Create intents of your chatbot and give training phrases. Visit [Quick start](https://dialogflow.com/docs/getting-started/first-agent) for clarifications.
4. Go to **Settings** and select the API version as V1.
5. Copy the client access token from the Settings page.

You can now enter the credentials in the HTTP client config.
```ballerina
module_dialogflow: DialogflowConfig dialogflowConfig = {
    clientConfig:{
        auth:{
            scheme: http:OAUTH2,
            accessToken: config:getAsString("ACCESS_TOKEN")
        }

    }
};

module_dialogflow: Client dialogflowClient = new(dialogflowConfig);
```

## Example 1

```ballerina
    import ballerina/http;
    import ballerina/io;
    import module_dialogflow;

    public function main(){
        module_dialogflow: DialogflowConfig dialogflowConfig = {
            clientConfig:{
                auth:{
                    scheme: http:OAUTH2,
                    accessToken: config:getAsString("ACCESS_TOKEN")
                }

            }
        };

        callb(dialogflowConfig);

    }

    function callb(module_dialogflow: DialogflowConfig dialogflowConfig){
        module_dialogflow: Client dialogflowClient = new(dialogflowConfig);

        string query11= "What are the main products of WSO2";

        var res= dialogflowClient->getResponse(query11);
        io:println(res);

    }
```

Output:
```
    Main products are APIM, IAM and EI
```

## Example 2

```ballerina
    import ballerina/http;
    import ballerina/io;
    import module_dialogflow;

    public function main(){
        module_dialogflow: DialogflowConfig dialogflowConfig = {
            clientConfig:{
                auth:{
                    scheme: http:OAUTH2,
                    accessToken: "6f2514f88ae84325acadd3a228027059"
                }

            }
        };

        callb(dialogflowConfig);

    }

    function callb(module_dialogflow: DialogflowConfig dialogflowConfig){
        module_dialogflow: Client dialogflowClient = new(dialogflowConfig);

        string query11= "What are the main products of WSO2";

        var res= dialogflowClient->getJsonResponse(query11);
        io:println(res);

    }
```

Output:

```json
{
    "id":"4a788f57-7e48-4ad3-acf3-21e27a054044",
    "timestamp":"2019-02-12T10:07:19.217Z",
    "lang":"en",
    "result":{
        "source":"agent",
        "resolvedQuery":"What are the main products of WSO2",
        "action":"",
        "actionIncomplete":false,
        "parameters":{},
        "contexts":[],
        "metadata":{
            "intentId":"3931b5b1-941d-403f-a4ec-ee814e1914e9",
            "webhookUsed":"false",
            "webhookForSlotFillingUsed":"false",
            "isFallbackIntent":"false",
            "intentName":"products"
         },
        "fulfillment":{
            "speech":"Main products are APIM, IAM and EI",
            "messages":[{"type":0, "speech":"Main products are APIM, IAM and EI"}]
        },
        "score":1.0
    },
    "status":{
        "code":200,
        "errorType":"success"
    },
    "sessionId":"12345"
}
```




