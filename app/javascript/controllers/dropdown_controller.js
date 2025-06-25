import { Controller } from "@hotwired/stimulus"
import { Dropdown } from "bootstrap"

export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    this.dropdown = new Dropdown(this.toggleTarget)
  }

  toggle() {
    event.preventDefault()
    this.dropdown.toggle()
  }
}
