package org.example.Controller;

import lombok.RequiredArgsConstructor;
import org.example.Dto.DoctorDTO;
import org.example.Service.DoctorService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/doctor")
@CrossOrigin
@RequiredArgsConstructor
public class DoctorController {

    private final DoctorService doctorService;

    // Register a new doctor
    @PostMapping("/register")
    public ResponseEntity<String> registerDoctor(@RequestBody DoctorDTO doctorDTO) {
        doctorService.createDoctor(doctorDTO);
        return ResponseEntity.ok("Doctor registered successfully!");
    }

    // Get all doctors
    @GetMapping("/all")
    public ResponseEntity<List<DoctorDTO>> getAllDoctors() {
        return ResponseEntity.ok(doctorService.getAllDoctors());
    }

    // Get doctor by ID
    @GetMapping("/{id}")
    public ResponseEntity<DoctorDTO> getDoctorById(@PathVariable Long id) {
        return ResponseEntity.ok(doctorService.getDoctorById(id));
    }

    // Update doctor
    @PutMapping("/update/{id}")
    public ResponseEntity<String> updateDoctor(@PathVariable Long id, @RequestBody DoctorDTO doctorDTO) {
        doctorService.updateDoctor(id, doctorDTO);
        return ResponseEntity.ok("Doctor updated successfully!");
    }

    // Delete doctor
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteDoctor(@PathVariable Long id) {
        doctorService.deleteDoctor(id);
        return ResponseEntity.ok("Doctor deleted successfully!");
    }
}
