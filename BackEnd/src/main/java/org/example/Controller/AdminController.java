package org.example.Controller;

import lombok.RequiredArgsConstructor;
import org.example.Dto.AdminDTO;
import org.example.Service.AdminService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/admin")
@CrossOrigin
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    // Create new admin
    @PostMapping("/register")
    public ResponseEntity<String> registerAdmin(@RequestBody AdminDTO adminDTO) {
        adminService.createAdmin(adminDTO);
        return ResponseEntity.ok("Admin registered successfully!");
    }

    // Admin login
    @PostMapping("/login")
    public ResponseEntity<String> loginAdmin(@RequestBody AdminDTO adminDTO) {
        boolean isAuthenticated = adminService.authenticate(adminDTO);
        if (isAuthenticated) {
            return ResponseEntity.ok("Login successful!");
        } else {
            return ResponseEntity.status(401).body("Invalid credentials");
        }
    }

    // Get all admins
    @GetMapping("/all")
    public ResponseEntity<List<AdminDTO>> getAllAdmins() {
        return ResponseEntity.ok(adminService.getAllAdmins());
    }

    // Get admin by ID
    @GetMapping("/{id}")
    public ResponseEntity<AdminDTO> getAdminById(@PathVariable Long id) {
        return ResponseEntity.ok(adminService.getAdminById(id));
    }

    // Delete admin
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteAdmin(@PathVariable Long id) {
        adminService.deleteAdmin(id);
        return ResponseEntity.ok("Admin deleted successfully");
    }
}
