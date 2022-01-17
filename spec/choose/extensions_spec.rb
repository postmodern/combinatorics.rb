require 'spec_helper'
require 'combinatorics/choose/extensions'

describe 'combinatorics/choose/extensions' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','choose','core_ext.rb') }

  it "must require 'combinatorics/choose/core_ext'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
