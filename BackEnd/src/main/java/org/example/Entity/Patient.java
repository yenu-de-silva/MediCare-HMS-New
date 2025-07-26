package org.example.Entity;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Patient {
    private Long patientId;
    private String fullName;
    private String gender;
    private LocalDate dateOfBirth;
    private String contactNumber;
    private String email;
    private String address;
}
