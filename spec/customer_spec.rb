require './lib/customer'
require './lib/pet'

describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 7})
  end

  it 'Exists' do
    expect(@joel).to be_a(Customer)
  end

  it "Has attributes" do
    expect(@joel.name).to eq("Joel")
    expect(@joel.id).to eq(2)
    expect(@joel.pets).to eq([])
  end

  it "Can adot pets" do
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    expect(@joel.pets).to eq([@samson, @lucy])
  end

  it "Has outstanding balances" do
    expect(@joel.outstanding_balance).to eq(0)
    @joel.charge(15)
    @joel.charge(7)
    expect(@joel.outstanding_balance).to eq(22)
  end
end
