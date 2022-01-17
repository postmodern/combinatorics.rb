require 'spec_helper'
require 'combinatorics/cartesian_product/extensions/set'

describe 'combinatorics/cartesian_product/extensions/set' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','cartesian_product','core_ext', 'set.rb') }

  it "must require 'combinatorics/cartesian_product/core_ext/set'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
