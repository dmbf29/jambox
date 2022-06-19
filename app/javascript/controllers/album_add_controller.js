import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("connected");
  }

  fillForm(event) {
    this.formTarget.classList.remove("d-none");
  }
}
