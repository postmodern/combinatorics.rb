#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/cartesian_product'

Benchmark.bm(13) do |b|
  [100, 200, 400, 800].each do |i|
    n = (1..i).to_a

    b.report("{#{i}} x {#{i}}") do
      n.cartesian_product(n).to_a
    end
  end
end
