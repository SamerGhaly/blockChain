pragma solidity ^0.8.4;
import "hardhat/console.sol";


contract App {
    uint public clinicsCnt;
    mapping(uint => Clinic ) public clinics;

    struct Clinic{
        // uint id;
        address senderAddress;
        string  name;
        uint patientsCnt;
        mapping(uint => Patient) patients;

        
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
        uint patientAddress;
    
    }
    struct Patient{
        // uint id;
        string name;
        uint yearOfBirth;
        uint weight;
        uint height;
        string sex;
        MedicalMeasurement MM;
        uint visitsCnt;
        uint clinicAddress;
        mapping(uint => Visit ) visits;

    
    }
    

    constructor() { 
        clinicsCnt=0;
    }
 

    function createClinic(string memory clinicName_) public{
        Clinic storage clinic= clinics[clinicsCnt] ;
        //=Clinic(1, clinicName_,1);
        clinic.name=clinicName_;
        clinic.senderAddress=msg.sender;
        clinic.patientsCnt=0;    
        clinicsCnt++;    
    }
    function getClinic(uint id) external view returns (string memory ,uint) {
        Clinic storage clinic= clinics[id] ;
        require(msg.sender==clinic.senderAddress,"unauthorized Clinic");
        return (clinic.name,clinic.patientsCnt); 
    }
    // function getAllClinic() external view returns (map memory) {
    //     return clinics;
    // }
    function addPatient(       
        string memory patientName_,
        uint patientYearOfBirth_,
        uint patientWeight_,
        uint patientHeight_,
        string memory patientSex_,
        MedicalMeasurement memory MM_,
        uint clinicAddress) 
        public {
        Clinic storage clinic= clinics[clinicAddress] ;
        require(msg.sender==clinic.senderAddress,"unauthorized Clinic");

        //mapping(uint => Visit ) visits;
        Patient storage patient=clinic.patients[clinic.patientsCnt];
        patient.name=patientName_;
        patient.yearOfBirth=patientYearOfBirth_;
        patient.weight=patientWeight_;
        patient.height=patientHeight_;
        patient.sex=patientSex_;
        patient.MM=MM_;
        patient.visitsCnt=0;
        clinic.patientsCnt++;

    }
     function getPatient(uint id_,uint clinicAddress) external view returns (       
        string memory ,
        uint ,
        uint ,
        uint ,
        string memory ,
        MedicalMeasurement memory ,
        uint )  {
        Clinic storage clinic= clinics[clinicAddress] ;
        require(msg.sender==clinic.senderAddress,"unauthorized Clinic");

        //mapping(uint => Visit ) visits;
        Patient storage patient=clinic.patients[id_];
        return (patient.name,patient.yearOfBirth,patient.weight,patient.height,patient.sex,patient.MM,patient.visitsCnt);
    }

    
}

