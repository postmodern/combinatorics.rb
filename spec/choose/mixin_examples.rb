require 'spec_helper'
require 'combinatorics/choose'

shared_examples_for 'Choose::Mixin' do
  it 'should return [[]] for [].choose(0).to_a' do
    set = subject[[]]

    set.choose(0).to_a == [[]]
  end

  it 'should return [[]] for [1].choose(0).to_a' do
    set = subject[[1]]

    set.choose(0).to_a == [[]]
  end

  it 'should return [[1]] for [1].choose(1).to_a' do
    set = subject[1]

    set.choose(1).to_a == [[1]]
  end

  it 'should return [[1], [2]] for [1, 2].choose(1).to_a' do
    set = subject[[1, 2]]

    set.choose(1).to_a == [[1], [2]]
  end

  it 'should return [[1, 2]] for [1, 2].choose(2).to_a' do
    set = subject[[1, 2]]

    set.choose(2).to_a == [[1, 2]]
  end

  it 'should alias choose to combos' do
    set = subject[1]

    set.should respond_to(:combos) 
  end
end
