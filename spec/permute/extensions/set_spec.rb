require 'spec_helper'
require 'combinatorics/permute/extensions/set'

describe 'combinatorics/permute/extensions/set' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','permute','core_ext', 'set.rb') }

  it "must require 'combinatorics/permute/core_ext/set'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
