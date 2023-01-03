import { Controller } from "@hotwired/stimulus"
import debounce from 'debounce';

// Connects to data-controller="form"
export default class extends Controller {
  initialize() {
    // wait 300 ms since last time submit was called
    this.submit = debounce(this.submit.bind(this), 300)
  }

  submit(_event) {
    this.element.requestSubmit()
  }
}
