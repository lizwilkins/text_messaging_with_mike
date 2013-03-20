class Phone
  attr_reader :phone_number

  def initialize (attributes)
    @phone_number = attributes[:phone_number]
  end
end