import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart-update"
export default class extends Controller {
  connect() {
    this.element.addEventListener('submit', this.handleSubmit.bind(this));
  }

  handleSubmit(event) {
    event.preventDefault();

    const formData = new FormData(this.element);
    const searchParams = new URLSearchParams();

    for (const pair of formData) {
      searchParams.append(pair[0], pair[1]);
    }

    const options = {
      method: this.element.method,
      headers: {
        'Accept': 'application/json'
      }
    };

    fetch(`/dashboard/show_city_aqi?${searchParams.toString()}`, options)
      .then((response) => response.json())
      .then((response) => {
        const chart = Chartkick.charts['chart-2'];
        chart.updateData(response.data);
      });
  }

  updateChart(event) {
    event.preventDefault();

    const options = {
      method: this.element.method,
      headers: {
        'Accept': 'application/json'
      }
    };

    fetch(event.target.href, options)
      .then(response => response.json())
      .then((response) => {
        document.getElementById("locationDropdown").innerHTML = response.title;
        const chart = Chartkick.charts['chart-2'];
        chart.updateData(response.data);
      });
  }
}
