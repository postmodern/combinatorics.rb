require 'spec_helper'
require 'combinatorics/extensions'

describe 'combinatorics/extensions' do
  let(:root) { File.expand_path('..',__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','core_ext.rb') }

  it "must require 'combinatorics/core_ext'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
