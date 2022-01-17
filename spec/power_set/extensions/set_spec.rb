require 'spec_helper'
require 'combinatorics/power_set/extensions/set'

describe 'combinatorics/power_set/extensions/set' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','power_set','core_ext', 'set.rb') }

  it "must require 'combinatorics/power_set/core_ext/set'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
