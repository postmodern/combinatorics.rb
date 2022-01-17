require 'spec_helper'
require 'combinatorics/extensions/range'

describe 'combinatorics/extensions/range' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','core_ext', 'range.rb') }

  it "must require 'combinatorics/core_ext/range'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
