import ballerina/http;
import ballerina/log;
import ballerina/io;


public type Client client object {
    public http:Client dialogflowClient;

    public function __init(DialogflowConfig dialogflowConfig) {

        self.dialogflowClient = new(BASE_URL, config= dialogflowConfig.clientConfig);

    }

    public function init(DialogflowConfig dialogflowConfig);

    public remote function getJsonResponse(string question) returns json|error;

    public remote function getResponse(string question) returns json|error;
};

remote function Client.getJsonResponse(string question) returns json|error{
    string encodedQuestion = encodeUrl(question);
    string query_url = QUERY_URL1 + encodedQuestion + QUERY_URL2;

    http:Response|error response = self.dialogflowClient->get(query_url);

    if (response is error){
        log:printError("Failed to call the endpoint.", err = response);
        io:println();
        return response;
    }
    else{
        json|error json1= response.getJsonPayload();
        return json1;
    }
}

remote function Client.getResponse(string question) returns json|error{
    var jsonAnswer = self->getJsonResponse(question);

    if(jsonAnswer is json){
        json answer= jsonAnswer.result.fulfillment.speech;
        return answer;

    }
    else{
        return jsonAnswer;
    }

}

function Client.init(DialogflowConfig dialogflowConfig){
    http:AuthConfig? authConfig = dialogflowConfig.clientConfig.auth;
    if(authConfig is http:AuthConfig){
        authConfig.scheme = http:OAUTH2;
    }

}

public type DialogflowConfig record {
    http:ClientEndpointConfig clientConfig;
};


