require 'spec_helper'
require 'combinatorics/derange/extensions/array'

describe 'combinatorics/derange/extensions/array' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','derange','core_ext', 'array.rb') }

  it "must require 'combinatorics/derange/core_ext/array'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
