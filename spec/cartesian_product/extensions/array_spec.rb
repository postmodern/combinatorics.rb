require 'spec_helper'
require 'combinatorics/cartesian_product/extensions/array'

describe 'combinatorics/cartesian_product/extensions/array' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','cartesian_product','core_ext', 'array.rb') }

  it "must require 'combinatorics/cartesian_product/core_ext/array'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
