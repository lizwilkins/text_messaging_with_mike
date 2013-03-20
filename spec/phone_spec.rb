require 'spec_helper'

describe Phone do
  
  context '#initialize' do
    it 'initializes with a phone hash' do
      Phone.new(:phone_number => "19165551212").should be_an_instance_of Phone
    end 
  end

  context 'readers' do
    it 'should return the phone number' do
      Phone.new(:phone_number => "19165551212").phone_number.should eq "19165551212"
    end
  end

end