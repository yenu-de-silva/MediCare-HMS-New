package org.example.Service;

import org.example.Dto.AppoinmentDTO;
import java.util.List;

public interface AppointmentService {
    void saveAppointment(AppointmentDTO appointmentDTO);
    List<AppointmentDTO> getAllAppointments();
    AppointmentDTO getAppointmentById(Integer id);
    void updateAppointmentStatus(Integer id, String status);
    void deleteAppointment(Integer id);
}
