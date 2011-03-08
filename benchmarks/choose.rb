#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/choose'

Benchmark.bm do |b|
  array = (1..25).to_a

  (1..25).each do |n|
    b.report("k=#{n}") do
      array.choose(n) { |s| }
    end
  end
end
