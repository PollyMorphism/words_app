// app/javascript/controllers/quiz_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cardContainer", "cardFront", "cardBack", "actionButton"]

  connect() {
    if (this.hasCardContainerTarget) {
      this.cardContainerTarget.addEventListener("click", this.flipCard.bind(this));
    } else {
      console.error("Card container target is missing");
    }
  }

  disconnect() {
    if (this.hasCardContainerTarget) {
      this.cardContainerTarget.removeEventListener("click", this.flipCard.bind(this));
    }
  }

  flipCard() {
    if (this.cardFrontTarget.style.display === "none") {
      this.cardFrontTarget.style.display = "block";
      this.cardBackTarget.style.display = "none";
      this.actionButtonTarget.style.display = "none";
    } else {
      this.cardFrontTarget.style.display = "none";
      this.cardBackTarget.style.display = "block";
      this.actionButtonTarget.style.display = "block";
    }
  }
}
