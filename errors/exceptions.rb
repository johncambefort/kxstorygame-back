# frozen_string_literal: true

class Exceptions
  class GenericError < RuntimeError
    attr_reader :code, :message

    def initialize(message = 'Error')
      @message = message

      to_error.to_json
    end

    def to_error
      { code: @code, message: @message }
    end

    def to_s
      @message
    end
  end

  class ApiError < GenericError; end

  class NotFound < ApiError
    def initialize
      @code = 400
      @message = 'Resource not found'
    end
  end
end
