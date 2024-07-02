document.addEventListener("DOMContentLoaded", function() {
  const cardContainer = document.getElementById("card-container");
  const cardFront = document.getElementById("card-front");
  const cardBack = document.getElementById("card-back");
  const actionButton = document.getElementById("next-card");

  cardContainer.addEventListener("click", function() {
    if (cardFront.style.display === "none") {
      cardFront.style.display = "block";
      cardBack.style.display = "none";
      actionButton.style.display = "none";
    } else {
      cardFront.style.display = "none";
      cardBack.style.display = "block";
      actionButton.style.display = "block";
    }
  });
});
