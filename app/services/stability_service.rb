# @note: This service is used to call the Stability AI API to generate a response to a message
# @note: The API key is stored in the credentials file
# @param message [String] The message to generate a response for
# @param model [String] The model identifier for Stability AI (model name can be found on their platform)
# @return [String] The generated response
# @example
#   ChatgptService.call('What is your name?', 'your_stability_ai_model_id')
#   => "\n\nI am an AI language model, so I don't have a name. You can call me Bard."

class StabilityService
  include HTTParty

  attr_reader :api_url, :options, :model, :message

  def initialize(model = 'stable-diffusion-xl-1024-v1-0')
    api_key = 'sk-1V5Znm53yP4s9QH4fdskxW5h5lFg1MX4IeZHyVZdOMN5kbmE'
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'image/png',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.stability.ai/v1/generation/' + model + '/text-to-image' # Replace with Stability AI's generation endpoint
    @model = model
    @message = message
  end

  def call(message)
    body = {
      "text_prompts": [
        {
          "text": message + ' in anime style.'
        }
      ],
      "cfg_scale": 7,
      "height": 768,
      "width": 1344,
      "samples": 1,
      "steps": 30
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 60)
    # raise response['error']['message'] unless response.code == 200

    save_file(response)
    # upload the image to Cloudinary
    blob = Cloudinary::Uploader.upload('temp.png')
    # delete the temp file
    `rm 'temp.png'`

    blob['public_id']
  end

  private

  def save_file(response)
    File.open('temp.png', 'wb') do |f|
      f.write(response.body)
    end
  end
end
