import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  static values = {
    show: Boolean
  }

  connect() {
    if (this.showValue) {
      this.modal = new bootstrap.Modal(this.element)
      this.modal.show()
    }
  }

  disconnect() {
    if (this.modal) {
      this.modal.hide()
    }
  }
}
