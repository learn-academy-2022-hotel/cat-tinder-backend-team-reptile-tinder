require 'rails_helper'

RSpec.describe Reptile, type: :model do
  it "throws an error for an empty reptile" do
    reptile = Reptile.create
    expect(reptile.errors[:name]).to_not be_empty
  end

  it "throws an error if there is no name" do
    shakespeare = Reptile.create age: 7, enjoys: 'Walks on the beach', image: 'image link here'
    expect(shakespeare.errors[:name]).to_not be_empty
  end

  it "throws an error if there is no age" do
    shakespeare = Reptile.create name: 'Shakespeare', enjoys: 'Walks on the beach', image: 'image link here'
    expect(shakespeare.errors[:age]).to_not be_empty
  end

  it "throws an error if there is no enjoys" do
    shakespeare = Reptile.create name: 'Shakespeare', age: 7, image: 'image link here'
    expect(shakespeare.errors[:enjoys]).to_not be_empty
  end

  it "throws an error if there is no image" do
    shakespeare = Reptile.create name: 'Shakespeare', age: 7, enjoys: 'Walks on the beach'
    expect(shakespeare.errors[:image]).to_not be_empty
  end

  it "throws an error if enjoys is 9 characters or less" do
    shakespeare = Reptile.create name: 'Shakespeare', age: 7, enjoys: 'Walks', image: 'image link here'
    expect(shakespeare.errors[:enjoys]).to_not be_empty
  end
end
