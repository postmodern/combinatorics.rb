require 'spec_helper'
require 'combinatorics/choose/extensions/set'

describe 'combinatorics/choose/extensions/set' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','choose','core_ext', 'set.rb') }

  it "must require 'combinatorics/choose/core_ext/set'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
