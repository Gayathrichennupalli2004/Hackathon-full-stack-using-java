document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('jobApplicationForm');
    const employedCheckbox = document.getElementById('employed');
    const employmentDetails = document.getElementById('employmentDetails');
    const phoneInput = document.getElementById('phone');
    const zipInput = document.getElementById('zip');

    employedCheckbox.addEventListener('change', function() {
        employmentDetails.style.display = employedCheckbox.checked ? 'block' : 'none';
    });

    form.addEventListener('submit', function(event) {
        let valid = true;

        // Validate required fields
        const requiredFields = document.querySelectorAll('.input-field[required]');
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                alert(`The field ${field.previousElementSibling.innerText} is required.`);
                field.focus();
                valid = false;
                event.preventDefault();
                return false;
            }
        });

        // Validate phone number
        const phonePattern = /^\d{10}$/;
        if (!phonePattern.test(phoneInput.value)) {
            alert('Please enter a valid phone number (10 digits).');
            phoneInput.focus();
            valid = false;
            event.preventDefault();
            return false;
        }

        // Validate ZIP code
        const zipPattern = /^\d+$/;
        if (!zipPattern.test(zipInput.value)) {
            alert('Please enter a valid ZIP code (numeric values only).');
            zipInput.focus();
            valid = false;
            event.preventDefault();
            return false;
        }

        // Validate email
        const emailInput = document.getElementById('email');
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailInput.value)) {
            alert('Please enter a valid email address.');
            emailInput.focus();
            valid = false;
            event.preventDefault();
            return false;
        }

        if (!valid) {
            event.preventDefault();
        }
    });
});
