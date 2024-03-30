import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['option'];

  connect() {
    console.log("Hello from option controller");
  }

  select_option() {
    console.log("click!");
  }
}
