package org.example.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DoctorDTO {
    private Long doctorId;
    private String fullName;
    private String specialty;
    private String contactNumber;
    private String email;
    private String availability; // e.g., "Mon-Fri 9:00AM - 5:00PM"
}