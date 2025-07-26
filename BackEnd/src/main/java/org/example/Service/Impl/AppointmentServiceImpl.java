package org.example.Service.Impl;

import lombok.RequiredArgsConstructor;
import org.example.Repository.AppointmentRepository;
import org.example.Service.AppointmentService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AppointmentServiceImpl implements AppointmentService {

    private final AppointmentRepository appointmentRepository;
    private final ModelMapper modelMapper;

    @Override
    public void saveAppointment(AppointmentDTO appointmentDTO) {
        Appointment appointment = modelMapper.map(appointmentDTO, Appointment.class);
        Appointment saved = appointmentRepository.save(appointment);
        return modelMapper.map(saved, AppointmentDTO.class);
    }

    @Override
    public List<AppointmentDTO> getAllAppointments() {
        List<Appointment> list = appointmentRepository.findAll();
        return list.stream()
                .map(a -> modelMapper.map(a, AppointmentDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public AppointmentDTO getAppointmentById(Integer id) {
        Optional<Appointment> optional = appointmentRepository.findById(id);
        return optional.map(appointment -> modelMapper.map(appointment, AppointmentDTO.class)).orElse(null);
    }

    @Override
    public void updateAppointmentStatus(Integer id, String status) {
        appointmentRepository.updateAppointmentStatus(id, status);
    }

    @Override
    public void deleteAppointment(Integer id) {
        appointmentRepository.deleteById(id);
    }
}
