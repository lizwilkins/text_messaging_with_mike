require './ui_helper'

txt = Message.new(:message => "sample message")
phones = [Phone.new(:phone_number => "19167044022"), Phone.new(:phone_number => "19166714289")]
# phones = [Phone.new(:phone_number => "13124504610")]
client = Client.new

client.send_text(txt, phones)