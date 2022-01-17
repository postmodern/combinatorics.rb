require 'spec_helper'
require 'combinatorics/cartesian_product/extensions'

describe 'combinatorics/cartesian_product/extensions' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','cartesian_product','core_ext.rb') }

  it "must require 'combinatorics/cartesian_product/core_ext'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
