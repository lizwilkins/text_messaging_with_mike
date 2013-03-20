require 'spec_helper'

describe Message do
  
  context 'initialize' do
    it 'initializes with a hash of options' do
      Message.new(:message => "sample message").should be_an_instance_of Message
    end 
  end 

  context 'readers' do
    it 'should return the message' do
      Message.new(:message => "sample message").message.should eq "sample message"
    end
  end

  context 'validations' do 
    it 'wont allow more than 140 characters' do 
      a = Array.new(141, 'a').join("")
      p message = Message.new(:message => a)
      message.should_not be_an_instance_of Message
    end
  end

end