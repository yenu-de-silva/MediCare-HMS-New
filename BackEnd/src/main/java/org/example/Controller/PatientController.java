package org.example.Controller;

import lombok.RequiredArgsConstructor;
import org.example.Dto.PatientDTO;
import org.example.Service.PatientService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/patient")
@CrossOrigin
@RequiredArgsConstructor
public class PatientController {

    private final PatientService patientService;

    // Register new patient
    @PostMapping("/register")
    public ResponseEntity<String> registerPatient(@RequestBody PatientDTO patientDTO) {
        patientService.createPatient(patientDTO);
        return ResponseEntity.ok("Patient registered successfully!");
    }

    // Get all patients
    @GetMapping("/all")
    public ResponseEntity<List<PatientDTO>> getAllPatients() {
        return ResponseEntity.ok(patientService.getAllPatients());
    }

    // Get patient by ID
    @GetMapping("/{id}")
    public ResponseEntity<PatientDTO> getPatientById(@PathVariable Long id) {
        return ResponseEntity.ok(patientService.getPatientById(id));
    }

    // Update patient info
    @PutMapping("/update/{id}")
    public ResponseEntity<String> updatePatient(@PathVariable Long id, @RequestBody PatientDTO patientDTO) {
        patientService.updatePatient(id, patientDTO);
        return ResponseEntity.ok("Patient updated successfully!");
    }

    // Delete patient
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deletePatient(@PathVariable Long id) {
        patientService.deletePatient(id);
        return ResponseEntity.ok("Patient deleted successfully!");
    }
}
