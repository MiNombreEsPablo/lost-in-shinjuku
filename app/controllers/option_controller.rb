class OptionController < ApplicationController
    skip_before_action :verify_authenticity_token # Skip CSRF protection for API endpoint

    def openai_call
        input_text = params[:input_text]

        # Call the OpenapiService with the provided input_text and model
        response = OpenapiService.call(input_text, 'gpt-3.5-turbo')

        render json: response
    end
    
    def stability_call
        input_text = params[:input_text]

        # Call the StabilityService with the provided input_text and model
        response = StabilityService.new.call(input_text)

        render json: response
    end
end
