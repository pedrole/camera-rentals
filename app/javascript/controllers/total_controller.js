import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static values = { camera: Object, reservation: Object}
  static targets = ["total", ]

  initialize() {
    //this.calculateTotal();
  }

  calculateTotal() {
    // Your logic to calculate the total based on the camera value
   // console.log(this.cameraValue);
   // console.log(this.reservationValue);
   console.log(event.target.value);

    const total = 23/* your calculation here */
    this.totalTarget.textContent = total;
    Date.parse('20')
  }
  connect() {

  }
}
