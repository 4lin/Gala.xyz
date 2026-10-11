$(function() {
 var form = document.getElementById('registerForm');
 if (!form) return;
 function matchFields(first, second, label) {
  var original = document.getElementById(first), repeated = document.getElementById(second);
  function validate() { repeated.setCustomValidity(repeated.value && repeated.value !== original.value ? form.getAttribute(label) : ''); }
  original.addEventListener('input', validate); repeated.addEventListener('input', validate);
 }
 matchFields('password', 'passwordReplay', 'data-password-mismatch');
 matchFields('email', 'emailReplay', 'data-email-mismatch');
 $('#refreshCaptcha').on('click', function() {
  var image = document.getElementById('registrationCaptcha');
  image.src = image.getAttribute('data-src') + '&refresh=' + Date.now();
  $('#captchaAnswer').val('').trigger('focus');
 });
});
