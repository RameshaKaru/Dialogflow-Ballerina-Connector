
#Encodes the url string values
# + str - The string to be encoded
# + return - The encoded string
function encodeUrl(string str) returns (string){
    string encoded_str = str.replaceAll(" ","%2B");
    return encoded_str;
}