package org.example.Repository;

import jakarta.transaction.Transactional;
import org.example.Entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

    // ✔ Update status for an appointment
    @Transactional
    @Modifying
    @Query(value = "UPDATE appointment SET status = ?2 WHERE id = ?1", nativeQuery = true)
    void updateAppointmentStatus(Long id, String status);

    // ✔ Find all appointments for a given doctor
    List<AppointmentRepository> findByDoctorId(Long doctorId);

    // ✔ Find all appointments for a given patient
    List<Appointment> findByPatientId(Long patientId);

    // ✔ Find appointments by specific date
    List<Appointment> findByAppointmentDate(LocalDate date);

    // ✔ Find appointments by status (e.g., "Scheduled", "Cancelled")
    List<Appointment> findByStatus(String status);
}
