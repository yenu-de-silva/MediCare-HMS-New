package org.example.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Appoinment {
    @Id
    @GeneratedValue
    Long id;
    private String patientName;
    private String doctorName;
    private LocalDate date;
    private LocalTime time;
    private String status;

}
