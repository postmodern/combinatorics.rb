#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/choose'

Benchmark.bm do |b|
  n     = 20
  array = (1..n).to_a

  (1..n).each do |i|
    b.report("n=#{n} k=#{i}") do
      array.choose(i) { |s| }
    end
  end
end
