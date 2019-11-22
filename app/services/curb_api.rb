module CurbApi
  class << self
    def bet
      begin
        response = RestClient::Request.execute(
          method: :get,
          url: ENV['curbrock_api_url'],
          timeout: ENV['curb_timeout'].to_i || 2
        )
        response = JSON.parse(response)
        api_logger.info(response)
        prepare_response(response)
      rescue RestClient::ExceptionWithResponse => e
        api_logger.error(e.response)
        generate_bet
      rescue Errno::ECONNREFUSED
        generate_bet
      end
    end

    def generate_bet
      api_bet = %i[rock paper scissors]
      api_bet.sample
    end

    def api_logger
      @api_logger ||= Logger.new("#{Rails.root}/log/curb-api.log")
    end

    def prepare_response(response)
      body = response['body'].delete('"')
      if ENV['valid_bets']&.split(',')&.include?(body)
        body.to_sym
      else
        generate_bet
      end
    end
  end
end
