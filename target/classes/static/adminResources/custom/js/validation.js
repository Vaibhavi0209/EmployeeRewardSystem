function isInputNumber(event) {
    var ch = String.fromCharCode(event.which);
    if (!(/[0-9]/.test(ch))) {
        event.preventDefault();
    }
}