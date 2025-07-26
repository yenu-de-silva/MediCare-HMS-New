// doctor.js

let doctors = [
    { id: 1, name: "Dr. Samantha Perera", specialization: "Cardiologist", department: "Cardiology", contact: "+94 77 123 4567" },
    { id: 2, name: "Dr. Nimal Silva", specialization: "Neurologist", department: "Neurology", contact: "+94 71 765 4321" },
];

// Render doctors list
function renderDoctors() {
    const tbody = document.getElementById("doctors-table-body");
    if (!tbody) return;
    tbody.innerHTML = "";
    doctors.forEach((doc, index) => {
        tbody.innerHTML += `
      <tr>
        <td>${index + 1}</td>
        <td>${doc.name}</td>
        <td>${doc.specialization}</td>
        <td>${doc.department}</td>
        <td>${doc.contact}</td>
        <td>
          <button class="btn btn-sm btn-warning me-2" onclick="editDoctor(${doc.id})">Edit</button>
          <button class="btn btn-sm btn-danger" onclick="deleteDoctor(${doc.id})">Delete</button>
        </td>
      </tr>
    `;
    });
}

// Add or update doctor
function saveDoctor(event) {
    event.preventDefault();
    const id = parseInt(document.getElementById("doctor-id").value);
    const name = document.getElementById("doctor-name").value.trim();
    const specialization = document.getElementById("doctor-specialization").value.trim();
    const department = document.getElementById("doctor-department").value;
    const contact = document.getElementById("doctor-contact").value.trim();

    if (!name || !department) {
        alert("Please fill in all required fields");
        return;
    }

    if (id) {
        // Update existing
        const docIndex = doctors.findIndex(d => d.id === id);
        if (docIndex !== -1) {
            doctors[docIndex] = { id, name, specialization, department, contact };
        }
    } else {
        // Add new
        const newId = doctors.length > 0 ? doctors[doctors.length - 1].id + 1 : 1;
        doctors.push({ id: newId, name, specialization, department, contact });
    }

    clearDoctorForm();
    renderDoctors();
}

function editDoctor(id) {
    const doc = doctors.find(d => d.id === id);
    if (!doc) return;

    document.getElementById("doctor-id").value = doc.id;
    document.getElementById("doctor-name").value = doc.name;
    document.getElementById("doctor-specialization").value = doc.specialization;
    document.getElementById("doctor-department").value = doc.department;
    document.getElementById("doctor-contact").value = doc.contact;
    document.getElementById("form-title").textContent = "Edit Doctor";
}

function deleteDoctor(id) {
    if (confirm("Are you sure you want to delete this doctor?")) {
        doctors = doctors.filter(d => d.id !== id);
        renderDoctors();
    }
}

function clearDoctorForm() {
    document.getElementById("doctor-form").reset();
    document.getElementById("doctor-id").value = "";
    document.getElementById("form-title").textContent = "Add New Doctor";
}

// Attach event listeners
document.addEventListener("DOMContentLoaded", () => {
    renderDoctors();
    const form = document.getElementById("doctor-form");
    if (form) form.addEventListener("submit", saveDoctor);
    const resetBtn = document.querySelector("#doctor-form button[type='reset']");
    if (resetBtn) resetBtn.addEventListener("click", clearDoctorForm);
});
