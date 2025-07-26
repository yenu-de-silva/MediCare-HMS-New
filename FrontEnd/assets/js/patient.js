// patient.js

let patients = [
    { id: 1, name: "John Doe", email: "john.doe@example.com", contact: "+94 77 123 4567", address: "No 123, Main Street", dob: "1985-05-15" },
    { id: 2, name: "Jane Smith", email: "jane.smith@example.com", contact: "+94 71 765 4321", address: "45, Park Road", dob: "1990-08-25" },
];

// Render patients
function renderPatients() {
    const tbody = document.getElementById("patients-table-body");
    if (!tbody) return;
    tbody.innerHTML = "";
    patients.forEach((pat, index) => {
        tbody.innerHTML += `
      <tr>
        <td>${index + 1}</td>
        <td>${pat.name}</td>
        <td>${pat.email}</td>
        <td>${pat.contact}</td>
        <td>${pat.address}</td>
        <td>${pat.dob}</td>
        <td>
          <button class="btn btn-sm btn-warning me-2" onclick="editPatient(${pat.id})">Edit</button>
          <button class="btn btn-sm btn-danger" onclick="deletePatient(${pat.id})">Delete</button>
        </td>
      </tr>
    `;
    });
}

// Add or update patient
function savePatient(event) {
    event.preventDefault();
    const id = parseInt(document.getElementById("patient-id").value);
    const name = document.getElementById("patient-name").value.trim();
    const email = document.getElementById("patient-email").value.trim();
    const contact = document.getElementById("patient-contact").value.trim();
    const address = document.getElementById("patient-address").value.trim();
    const dob = document.getElementById("patient-dob").value;

    if (!name || !email) {
        alert("Please fill in all required fields");
        return;
    }

    if (id) {
        // Update existing
        const patIndex = patients.findIndex(p => p.id === id);
        if (patIndex !== -1) {
            patients[patIndex] = { id, name, email, contact, address, dob };
        }
    } else {
        // Add new
        const newId = patients.length > 0 ? patients[patients.length - 1].id + 1 : 1;
        patients.push({ id: newId, name, email, contact, address, dob });
    }

    clearPatientForm();
    renderPatients();
}

function editPatient(id) {
    const pat = patients.find(p => p.id === id);
    if (!pat) return;

    document.getElementById("patient-id").value = pat.id;
    document.getElementById("patient-name").value = pat.name;
    document.getElementById("patient-email").value = pat.email;
    document.getElementById("patient-contact").value = pat.contact;
    document.getElementById("patient-address").value = pat.address;
    document.getElementById("patient-dob").value = pat.dob;
    document.getElementById("form-title").textContent = "Edit Patient";
}

function deletePatient(id) {
    if (confirm("Are you sure you want to delete this patient?")) {
        patients = patients.filter(p => p.id !== id);
        renderPatients();
    }
}

function clearPatientForm() {
    document.getElementById("patient-form").reset();
    document.getElementById("patient-id").value = "";
    document.getElementById("form-title").textContent = "Add New Patient";
}

// Attach event listeners
document.addEventListener("DOMContentLoaded", () => {
    renderPatients();
    const form = document.getElementById("patient-form");
    if (form) form.addEventListener("submit", savePatient);
    const resetBtn = document.querySelector("#patient-form button[type='reset']");
    if (resetBtn) resetBtn.addEventListener("click", clearPatientForm);
});
