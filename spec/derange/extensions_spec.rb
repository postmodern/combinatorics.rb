require 'spec_helper'
require 'combinatorics/derange/extensions'

describe 'combinatorics/derange/extensions' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','derange','core_ext.rb') }

  it "must require 'combinatorics/derange/core_ext'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
