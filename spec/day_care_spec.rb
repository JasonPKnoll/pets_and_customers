require './lib/pet'
require './lib/customer'
require './lib/groomer'
require './lib/day_care'

describe DayCare do
  before(:each) do
    @fosters = DayCare.new("Fosters")
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

  it "exists" do
    expect(@fosters).to be_a(DayCare)
  end

  it 'has attributes' do
    expect(@fosters.name).to eq("Fosters")
    expect(@fosters.customers).to eq([])
  end

  it 'can add customers' do
    @fosters.add_customer(@joel)
    @fosters.add_customer(@jen)
    expect(@fosters.customers).to eq([@joel, @jen])
  end

  it 'Can find customers by ID' do
    @fosters.add_customer(@joel)
    @fosters.add_customer(@jen)
    expect(@fosters.find_customer_id(3)).to eq([@jen])
  end

  it 'Can return all unfeed pets' do
    @fosters.add_customer(@joel)
    @fosters.add_customer(@jen)
    @charley.feed
    @mini.feed
    expect(@fosters.fed_pets).to eq([@samson, @lucy])
  end

end
