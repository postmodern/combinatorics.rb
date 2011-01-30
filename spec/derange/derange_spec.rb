require 'spec_helper'
require 'combinatorics/derange'

include Combinatorics

describe 'Derange' do
  describe 'derange' do
    it 'should return [[]] for derange([]).to_a' do
      derange([]).to_a == [[]]
    end

    it 'should return [[]] for derange([1]).to_a' do
      derange([1]).to_a == [[]]
    end

    it 'should return [[2, 1]] for derange([1, 2]).to_a' do
      derange([1, 2]).to_a == [[2, 1]]
    end

    it 'should return [[2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1]] for derange([1, 2, 3, 4]).to_a' do
      derange([1, 2, 3, 4]).to_a == [[2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1]]
    end
  end
end
