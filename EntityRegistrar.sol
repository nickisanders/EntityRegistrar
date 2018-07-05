pragma solidity ^0.4.24;

interface IDataStore {
    function addData(string key, int value) external;
    
    function getData(string key) external view returns (int);
}

contract EntityRegistrar {
    address public owner;
    IDataStore public dataStore;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }

    function setDataStore(address addr) onlyOwner public returns (address) {
        dataStore = IDataStore(addr);
    }
    
    function addData(string name, int value) onlyOwner public {
        dataStore.addData(name, value);
    }

    function showData(string name) onlyOwner public view returns (int) {
        return dataStore.getData(name);
    }
}
