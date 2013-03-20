require 'spec_helper'

describe Client do

  # context "initialize" do
  #   it 'initialize with a client hash' do
  #     Client.new.should be_an_instance_of Client
  #   end 
  # end

  context '#send_text' do 
    it 'sends a text using POST to Twilio' do
      stub = stub_request(:post, "https://#{ACCOUNT_SID}:#{AUTH_TOKEN}@api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json").
         with(:body => {"Body" => "sample message", "From" => PHONE_NUMBER, "To" => "+14155551212"})
      client = Client.new
      txt = Message.new(:message => "sample message")
      phones = [Phone.new(:phone_number => '+14155551212')]
      client.send_text(txt, phones)
      stub.should have_been_requested
    end

    it 'sends a text to two Twilio users using POST to Twilio' do
      stub = stub_request(:post, "https://#{ACCOUNT_SID}:#{AUTH_TOKEN}@api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json").
         with(:body => {"Body" => "sample message", "From" => PHONE_NUMBER, "To" => /[+]1{1}\d{10}/})
      client = Client.new
      txt = Message.new(:message => "sample message")
      phones = (1..3).inject([]) { |phones, number| phones << Phone.new(:phone_number => "+1916554444#{number}") }
      client.send_text(txt, phones)
      stub.should have_been_requested.times(3)
    end
  end
end

     