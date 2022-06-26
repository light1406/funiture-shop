
const inputs = $$(".form-control");
var confirm =  document.querySelector("#confirm-password");
var password = document.querySelectorAll("#password");

document.querySelector(".form-submit").onclick = function (e) {
  if (password.value.length < 8) {
    password.nextElementSibling.classList.add("active");
    e.preventDefault();
  } else {
    password.nextElementSibling.classList.remove("active");
    if (confirm.value !== password.value) {
      confirm.nextElementSibling.classList.add("active");
      e.preventDefault();
    } else {
      confirm.nextElementSibling.classList.remove("active");
    }
  }
};
