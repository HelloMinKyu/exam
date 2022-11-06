$(document).ready(function () {
  const toggleMenu = document.querySelector(".toggle_menu ");

  const menu = document.querySelector(".menu_wrap");

  toggleMenu.addEventListener("click", () => {
    toggleMenu.classList.toggle("active");
    menu.classList.toggle("active");
  });
});
