class Client

  def initialize
  end
  # def initialize(attributes = nil)
  #   @accounts_id = attributes['accounts_id']
  #   @token_authorization = attributes['token_authorization']
  #   @test_id = attributes['test_id']
  #   @test_token = attributes['test_token']
  #   @phone_number = attributes['phone_number']

  # end

  def send_text(sms, phones)
    phones.each do |phone|
      post_response = Faraday.post do |request|
        request.url "https://api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json"
        request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{ACCOUNT_SID}:#{AUTH_TOKEN}")
        request.body = URI.encode_www_form({'From' => PHONE_NUMBER, 'To' => phone.phone_number, 'Body' => sms.message})
      end
    end
  end
end

