import ballerina/http;
import ballerina/log;
import ballerina/io;
import ballerina/test;
import ballerina/config;


DialogflowConfig dialogflowConfig = {
    clientConfig:{
        auth:{
            scheme: http:OAUTH2,
            accessToken: config:getAsString("ACCESS_TOKEN")
        }

    }
};

Client dialogflowClient = new(dialogflowConfig);

@test:Config
function testgetJsonResponse(){

    string query11= "what are the main products of WSO2";

    var res= dialogflowClient->getJsonResponse(query11);

    if(res is json){
        io:println(res);
    }
    else{
        test:assertFail(msg = "Test failed");
    }
}

@test:Config{
    dependsOn: ["testgetJsonResponse"]
}
function testGetResponse(){

    string query11= "what are the main products of WSO2";

    var res= dialogflowClient->getResponse(query11);

    if(res is json){
        io:println(res);
    }
    else{
        test:assertFail(msg = "Test failed");
    }
}
