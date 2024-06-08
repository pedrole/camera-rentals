import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin  from "rangePlugin";


// Connects to data-controller="datepicker"
export default class extends Controller {

  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      altInput: true,
      plugins: [new rangePlugin({ input: "#end_time"})]



    })
    flatpickr(this.endDateTarget, {
      altInput: true
    })
  }
}
