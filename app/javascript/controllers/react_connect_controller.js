import { Controller } from "stimulus";
import { initReact } from "../front_end/index";

export default class extends Controller {
  connect() {
    initReact();
  }
}
