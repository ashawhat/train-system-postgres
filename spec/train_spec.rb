require 'spec_helper'

describe Train do
  it 'is initialized with a name' do
    train = Train.new('G-line')
    train.should be_an_instance_of Train
  end
  it 'returns the name of the train' do
    train = Train.new('G-line')
    train.name.should eq 'G-line'
  end
  it 'saves and returns all the trains in the database' do
    train = Train.new('Betsy Locomotive')
    train.save
    Train.all.should eq [train]
  end
end
