pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract App {
    uint public clinicsSize;
    mapping(uint=>Clinic) public clinics;

    struct Patient{
        uint id;
        string name;
        uint yearOfBirth;
        uint weight;
        uint height;
        string sex;
        MedicalMeasurement MM;
        uint visitsSize;
        mapping(uint=>Visit) visits;


    }
    struct MedicalMeasurement{
        uint bloodPressure;
        uint  pulse;
        uint  oxygen;
        uint  glucose;

    }
    struct Visit {
        string reason;
        MedicalMeasurement MM;
        string prescription;
        string diagnosis;

    }
    // struct prescription{
    //    // array of medication 
    // }

//the reason for the visit (periodic checkup, management of a case such as hypertension
// or diabetes, or patient is complaining about something), the doctor’s diagnosis,
// and the prescription. The prescription may include medications (with doses and intake periods),
// referrals to other doctors/specialists, follow-up appointments, and lab tests
    struct Clinic{
        uint id;
        string name;
        uint patientsSize;
        mapping(uint =>Patient) patients;
        
    }

   


    constructor() { 
        clinicsSize=0;
    }
 

    function createClinic(string memory clinicName_) public{
        clinics[clinicsSize]=Clinic({name:clinicName_});
        clinicsSize++;

    }
    // function addPatient(uint id_,string memory name_) public {
    //     patientNum++;
    //     patients[patientNum]=Patient(id_,name_);
    // }
    //  function readPatient(uint id_) external view returns (Patient memory) {
    //     return patients[id_];
    // }

    
}

