require './lib/pet'
require './lib/customer'
require './lib/groomer'

describe Groomer do
  before(:each) do
    @billy = Groomer.new("Billy")
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 7})
    @jen = Customer.new("Jen", 3)
    @charley = Pet.new({name: "Charley", type: :dog, age: 8})
    @mini = Pet.new({name: "Mini", type: :cat, age: 2})
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @jen.adopt(@charley)
    @jen.adopt(@mini)
  end
  it 'Exists' do
    expect(@billy).to be_a(Groomer)
  end

  it 'Has attributes' do
    expect(@billy.name).to eq("Billy")
    expect(@billy.customers).to eq([])
  end

  it 'Can have multiple customers' do
    @billy.add_customers(@joel)
    @billy.add_customers(@jen)

    expect(@billy.customers).to eq([@joel, @jen])
  end

  it 'Can gather all out standing balances' do
    @billy.add_customers(@joel)
    @billy.add_customers(@jen)
    @joel.charge(15)

    expect(@billy.all_outstanding_balances).to eq([@joel])
  end

  it 'Can count the number of any specified type of pet' do
    @billy.add_customers(@joel)
    @billy.add_customers(@jen)
    expect(@billy.number_of_pets(:dog)).to eq(2)
  end
end
