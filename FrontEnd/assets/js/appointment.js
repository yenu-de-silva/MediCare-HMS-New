// appointment.js

let appointments = [
    {
        id: 1,
        doctor: "Dr. Samantha Perera",
        date: "2025-08-10",
        time: "09:00",
        status: "Upcoming",
    },
    {
        id: 2,
        doctor: "Dr. Nimal Silva",
        date: "2025-07-01",
        time: "11:00",
        status: "Completed",
    },
];

// Render appointments to table
function renderAppointments() {
    const tbody = document.getElementById("appointments-table-body");
    if (!tbody) return;
    tbody.innerHTML = "";
    appointments.forEach((appt, index) => {
        tbody.innerHTML += `
      <tr>
        <td>${index + 1}</td>
        <td>${appt.doctor}</td>
        <td>${appt.date}</td>
        <td>${appt.time}</td>
        <td>${appt.status}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="viewAppointment(${appt.id})">View</button>
          ${appt.status === "Upcoming" ? `<button class="btn btn-sm btn-danger" onclick="cancelAppointment(${appt.id})">Cancel</button>` : ""}
        </td>
      </tr>
    `;
    });
}

function viewAppointment(id) {
    const appt = appointments.find(a => a.id === id);
    if (appt) {
        alert(`Appointment Details:\nDoctor: ${appt.doctor}\nDate: ${appt.date}\nTime: ${appt.time}\nStatus: ${appt.status}`);
    }
}

function cancelAppointment(id) {
    if (confirm("Are you sure you want to cancel this appointment?")) {
        appointments = appointments.filter(a => a.id !== id);
        renderAppointments();
    }
}

// Initialize render on page load
document.addEventListener("DOMContentLoaded", () => {
    renderAppointments();
});
