class DayCare
  attr_reader :name, :customers

  def initialize(name)
  @name = name
  @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_customer_id(id)
    customer = @customers.find_all do |customer|
      customer.id == id
    end
  end

  def fed_pets
    @customers.flat_map do |person|
      person.pets.select do |pet|
        pet if pet.hunger == 0
      end
    end

    # hungry_pets = []
    # @customers.each do |person|
    #   person.pets.select do |pet|
    #     hungry_pets << pet if pet.hunger == 1
    #   end
    # end
    # hungry_pets
  end

end
