import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("connected");
  }

  fillForm(event) {
    console.los(this.formTarget);
  }
}
