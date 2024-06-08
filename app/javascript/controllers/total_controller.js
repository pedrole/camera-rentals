import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static values = { pricePerDay: Number}
  static targets = ["total", ]

  initialize() {
    //this.calculateTotal();
  }

  calculateTotal(event) {

    this.totalTarget.textContent = total;
    let dates = event.target.value.split('to');
    let start_date =  Date.parse(dates[0]);
    let end_date =  Date.parse(dates[1]);
    let diff = end_date - start_date;
    let days = diff / (1000 * 60 * 60 * 24);
    if (days > 1) {
      this.totalTarget.textContent = '€ '  +days * this.pricePerDayValue;
    }
    else {
      this.totalTarget.textContent = '€ 0';
    }
  }
  connect() {

  }
}
