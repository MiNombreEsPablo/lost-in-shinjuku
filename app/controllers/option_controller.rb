class OptionController < ApplicationController
    skip_before_action :verify_authenticity_token # Skip CSRF protection for API endpoint

    def openai_call
        input_text = params[:input_text]

        # Call the OpenapiService with the provided input_text and model
        response = OpenapiService.call(input_text, 'gpt-4-turbo')

        render json: response
    end
end
