require 'spec_helper'
require 'combinatorics/extensions/math'

describe 'combinatorics/extensions/math' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','combinatorics','core_ext', 'math.rb') }

  it "must require 'combinatorics/core_ext/math'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
