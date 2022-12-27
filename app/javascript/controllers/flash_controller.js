import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    // set timer when flash enters the DOM
    setTimeout(() => { this.element.remove() }, 4000);
  }
}
