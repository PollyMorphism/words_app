// app/javascript/controllers/quiz_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleForm"]

  toggleCards() {
    this.toggleFormTarget.submit();
  }
}
