#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/list_comprehension'

Benchmark.bm(12) do |b|
  b.report('singleton:') do
    list = ([1] * 500)

    list.comprehension.each { |list| }
  end

  b.report('single-enum:') do
    list = [1..200, 1]
    list.comprehension.each { |list| }
  end

  (1..3).each do |n|
    b.report("depth #{n}:") do
      list = ([1..200] * n)
      list.comprehension.each { |list| }
    end
  end
end
