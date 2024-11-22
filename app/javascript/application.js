// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

// JM - Reinitialize the carousel on each page load with Turbo
document.addEventListener("turbo:load", function() {
  // Select all carousel elements
  const carousels = document.querySelectorAll('.carousel');
  carousels.forEach(function(carousel) {
    new bootstrap.Carousel(carousel); // Initialize each carousel
  });
});
