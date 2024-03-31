# frozen_string_literal: true

# @note: This service is used to call the Firework API to generate a response to a message
# @note: The API key is stored in the env file
# @param message [String] The message to generate a response for
# @param model [String] The model to use for the response [accounts/fireworks/models/llama-v2-7b-chat]
# @return [String] The generated response
# @example
#   FireworkService.call('What is your name?', 'accounts/fireworks/models/llama-v2-7b-chat')
# API Docs: https://readme.fireworks.ai/docs/querying-text-models
class FireworkService
  include HTTParty

  attr_reader :api_url, :options, :model, :message

  def initialize(message, model = 'accounts/fireworks/models/llama-v2-7b-chat')
    api_key = ENV['FIREWORK_API_KEY']
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.fireworks.ai/inference/v1/chat/completions'
    @model = model
    @message = message
  end

  def call
    body = {
      model:,
      messages: [{ role: 'user', content: message }]
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 60)
    raise response['error']['message'] unless response.code == 200

    response['choices'][0]['message']['content']
  end

  class << self
    def call(message, model = 'accounts/fireworks/models/llama-v2-7b-chat')
      new(message, model).call
    end
  end
end
