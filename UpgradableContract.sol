// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
contract UpgradableContract is 
                            UUPSUpgradeable,
                            OwnableUpgradeable 
                            {

    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter private changeId;
    uint public number;
    string public name;  

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}


    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
        number = 10;
    }


     function updateNumber(uint _number) public returns (uint, uint) {
        number = _number;
        changeId.increment();
        uint id = changeId.current();
        return (number, id);
    }

    //update function upgrade contract
    function addName(string memory _name) public returns (string memory){
        name = _name;
        return name;
    }
    
}
      