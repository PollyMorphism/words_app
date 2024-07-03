// app/javascript/controllers/quiz_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cardFront", "cardBack", "actions"]

  flipCard() {
    if (this.cardFrontTarget.style.display === "none") {
      this.cardFrontTarget.style.display = "block";
      this.cardBackTarget.style.display = "none";
      this.actionsTarget.style.display = "none";
    } else {
      this.cardFrontTarget.style.display = "none";
      this.cardBackTarget.style.display = "block";
      this.actionsTarget.style.display = "";
    }
  }
}
