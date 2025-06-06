/**
 * 
 */
// alert-handler.js
function showAlert(alertType, alertMessage) {
  if (alertType && alertMessage) {
    Swal.fire({
      icon: alertType,  // "success" or "error"
      title: alertMessage,
      draggable: true
    });
  }
}
