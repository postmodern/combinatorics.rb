require 'spec_helper'
require 'combinatorics/choose/extensions/array'

describe 'combinatorics/choose/extensions/array' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','choose','core_ext', 'array.rb') }

  it "must require 'combinatorics/choose/core_ext/array'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
