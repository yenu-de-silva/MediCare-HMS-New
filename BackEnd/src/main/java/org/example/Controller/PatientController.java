//
//package org.example.controller;
//
//import lombok.RequiredArgsConstructor;
//import org.medicare.dto.PatientDTO;
//import org.medicare.service.PatientService;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestControllera
//@RequestMapping("/api/v1/patient")
//@00000
//@CrossOrigin
//public class PatientController {
//
//    private final PatientService patientService;
//
//    @PostMapping("/create")
//    public ResponseEntity<PatientDTO> createPatient(@RequestBody PatientDTO patientDTO) {
//        return ResponseEntity.ok(patientService.createPatient(patientDTO));
//    }
//
//    @GetMapping("/all")
//    public ResponseEntity<List<PatientDTO>> getAllPatients() {
//        return ResponseEntity.ok(patientService.getAllPatients());
//    }
//
//    @GetMapping("/{id}")
//    public ResponseEntity<PatientDTO> getPatientById(@PathVariable Long id) {
//        return ResponseEntity.ok(patientService.getPatientById(id));
//    }
//
//    @PutMapping("/update/{id}")
//    public ResponseEntity<PatientDTO> updatePatient(@PathVariable Long id, @RequestBody PatientDTO patientDTO) {
//        return ResponseEntity.ok(patientService.updatePatient(id, patientDTO));
//    }
//
//    @DeleteMapping("/delete/{id}")
//    public ResponseEntity<String> deletePatient(@PathVariable Long id) {
//        patientService.deletePatient(id);
//        return ResponseEntity.ok("Patient deleted successfully");
//    }
//}
