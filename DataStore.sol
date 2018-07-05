pragma solidity ^0.4.24;

contract DataStore {
    mapping(string => int) dataMapping;
    
    function addData(string key, int value) public {
        if(dataMapping[key] > 0) {
            revert();
        } else {
            dataMapping[key] = value;
        }
    }
    
    function getData(string key) public view returns (int) {
        return dataMapping[key];
    }
}
