// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails";
import "controllers";
import * as bootstrap from "bootstrap";


$("#location-form").on("submit", function(event) {
  event.preventDefault();
  const location = $("#location").val();
  const url = `/dashboard/show_city_aqi`;
  $ajax({
    url: url,
    type: "GET",
    dataType: 'json',
    contentType: 'application/json',
    FormData: $(this).serialize(),
    success: function(data) {
      console.log(data);
      $("#location-chart").html = response;
    }
  });
});
