class Pet
  attr_reader :name, :type, :age, :hunger

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @age = info[:age]
    @hunger = 0
  end

  def fed
    hunger > 0
  end

  def feed
    @hunger += 1
  end

end
