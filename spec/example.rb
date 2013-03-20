require 'rubygems'
require 'twilio-ruby'
 
account_sid = "AC6055eefe86966f23efbaa4f27767b45a"
auth_token = "9befaf55e55e7cab4eadb3049bcf5cc0"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+15305641758" # Your Twilio number
 
friends = {
"+14153024672" => "Thomas",
"+19165959543" => "Michael",
"+13124504610" => "Pete"
}
friends.each do |key, value|
  client.account.sms.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  ) 
  puts "Sent message to #{value}"
end