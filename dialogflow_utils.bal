function encodeUrl(string str) returns (string){
    string encoded_str = str.replaceAll(" ","%2B");
    return encoded_str;
}