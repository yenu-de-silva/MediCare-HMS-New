package org.example.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Doctor {
    private Long doctorId;
    private String fullName;
    private String specialty;
    private String contactNumber;
    private String email;
    private String availability;    // e.g., "Mon-Fri 9AM–5PM"
    private Long departmentId;      // FK to Department
}