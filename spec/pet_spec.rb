require './lib/pet'

describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end
  it 'Exists' do
    expect(@samson).to be_a(Pet)
  end

  it "Has attributes" do
    expect(@samson.name).to eq("Samson")
    expect(@samson.type).to eq(:dog)
    expect(@samson.age).to eq(3)
  end

  it "Has the ability to eat" do
    expect(@samson.fed).to eq(false)
    @samson.feed
    expect(@samson.fed).to eq(true)
  end
end
