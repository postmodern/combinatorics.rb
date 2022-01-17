require 'spec_helper'
require 'combinatorics/power_set/extensions/array'

describe 'combinatorics/power_set/extensions/array' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','power_set','core_ext', 'array.rb') }

  it "must require 'combinatorics/power_set/core_ext/array'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
