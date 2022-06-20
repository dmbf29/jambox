import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "form",
    "artist_name",
    "album_name",
    "spotify_id",
    "release_date",
    "photo_url",
    "card",
  ];

  connect() {
    console.log("connected");
  }

  fillForm(event) {
    this.cardTargets.forEach((card) => {
      card.classList.remove("border-orange");
    });
    event.currentTarget.classList.add("border-orange");
    this.formTarget.classList.remove("d-none");
    this.album_nameTarget.value = event.currentTarget.dataset.albumName;
    this.artist_nameTarget.value = event.currentTarget.dataset.artistName;
    this.spotify_idTarget.value = event.currentTarget.dataset.spotifyId;
    this.photo_urlTarget.value = event.currentTarget.dataset.photoUrl;
    this.release_dateTarget.value = event.currentTarget.dataset.releaseDate;
  }
}
