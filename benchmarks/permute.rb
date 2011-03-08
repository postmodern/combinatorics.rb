#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/permute'

Benchmark.bm do |b|
  array = (1..10).to_a

  (1..10).each do |n|
    b.report("r=#{n}") do
      array.permute(n) { |s| }
    end
  end
end
