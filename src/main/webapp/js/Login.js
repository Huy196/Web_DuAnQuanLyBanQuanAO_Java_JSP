function showTemporaryMessage(input, message) {
    input.setCustomValidity(message);
    setTimeout(() => {
        input.setCustomValidity('');
    }, 5000);
}

