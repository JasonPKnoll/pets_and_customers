class Groomer
    attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customers(customer)
    @customers << customer
  end

  def all_outstanding_balances
    @customers.find_all do |customer|
      customer.outstanding_balance > 0
    end
  end

  def number_of_pets(type)
    pets = @customers.map do |customer|
      customer.pets
    end.flatten
    pets.count do |pet|
      pet.type == type
    end
  end
end
