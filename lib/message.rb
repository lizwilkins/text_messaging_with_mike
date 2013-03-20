require 'active_model'

class Message
  include ActiveModel::Validations
  
  validates :message, :length => { :maximum => 140 }

  attr_reader :message


  def initialize (attributes)
    @message = attributes[:message]
  end

end