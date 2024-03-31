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

function callOpenaiService(inputText, modelName) {
  fetch('/api/openai_call', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': Rails.csrfToken() // Include CSRF token for Rails applications
    },
    body: JSON.stringify({
      input_text: inputText
    })
  })
  .then(response => response.json())
  .then(data => {
    // Handle response data
    console.log(data);
  })
  .catch(error => {
    // Handle error
    console.error('Error calling OpenAI service:', error);
  });
}


function callStabilityService(inputText, modelName) {
  fetch('/api/stability_call', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': Rails.csrfToken() // Include CSRF token for Rails applications
    },
    body: JSON.stringify({
      input_text: inputText
    })
  })
  .then(response => response.json())
  .then(data => {
    // Handle response data
    console.log(data);
  })
  .catch(error => {
    // Handle error
    console.error('Error calling Stability service:', error);
  });
}
