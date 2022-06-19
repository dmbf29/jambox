import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "name", "spotify_id", "release_date", "card"];

  connect() {
    console.log("connected");
  }

  fillForm(event) {
    this.cardTargets.forEach((card) => {
      card.classList.remove("border-orange");
    });
    event.currentTarget.classList.add("border-orange");
    this.formTarget.classList.remove("d-none");
    this.nameTarget.value = event.currentTarget.dataset.name;
    this.spotify_idTarget.value = event.currentTarget.dataset.spotifyId;
    this.release_dateTarget.value = event.currentTarget.dataset.releaseDate;
  }
}
