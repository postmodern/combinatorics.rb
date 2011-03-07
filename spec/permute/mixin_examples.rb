require 'spec_helper'
require 'combinatorics/permute'

include Combinatorics::Permute::Mixin

shared_examples_for 'Combinatorics::Permute::Mixin' do
  describe 'permute' do
    it 'should return [[]] for permute(nil, 0).to_a' do
      permute(nil, 0).to_a == [[]]
    end

    it 'should return [[]] for permute([], 0).to_a' do
      permute([], 0).to_a == [[]]
    end

    it 'should return [[]] for permute([1], 0).to_a' do
      permute([1], 0).to_a == [[]]
    end

    it 'should return [[1]] for permute([1], 1).to_a' do
      permute([1], 1).to_a == [[1]]
    end

    it 'should return [[1], [2]] for permute([1, 2], 1).to_a' do
      permute([1, 2], 1).to_a == [[1], [2]]
    end

    it 'should return [[1, 2]] for permute([1, 2], 2).to_a' do
      permute([1, 2], 2).to_a == [[1, 2]]
    end

    it 'should alias permute to permute' do
      should respond_to(:permute)
    end
  end
end
