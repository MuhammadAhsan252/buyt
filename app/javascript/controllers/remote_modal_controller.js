import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  static values = {
    show: Boolean
  }

  connect() {
    this.modal = new bootstrap.Modal(this.element)

    if (this.showValue) {
      this.modal.show()
    }

    this.element.addEventListener("hidden.bs.modal", () => {
      // Optionally remove the modal from the DOM when hidden
      this.element.remove()
    })
  }

  disconnect() {
    if (this.modal) {
      this.modal.hide()
    }
  }
}
