pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract Clinic {
    struct Patient{
        uint id;
        string name;
        
    }
    uint public id ;
    string public name;
    uint public patientNum;
    mapping(uint=>Patient) public patients;

    constructor(uint id_,string memory name_)public {
        patientNum=0;
        id=id_;
        name=name_;
        console.log(name);
        console.log(id_);
        console.log(msg.sender);
        
    }

    function changeName(string memory name_) public{
        name=name_;
    }
    function addPatient(uint id_,string memory name_) public {
        patientNum++;
        patients[patientNum]=Patient(id_,name_);
    }
     function readPatient(uint id_) external view returns (Patient memory) {
        return patients[id_];
    }

    
}

