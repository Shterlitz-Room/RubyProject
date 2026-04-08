import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  toggle() {
    const el = this.inputTarget
    el.type = el.type === "password" ? "text" : "password"
  }
}
