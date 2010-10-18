#!/usr/bin/env ruby

root_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
lib_dir = File.join(root_dir,'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'benchmark'
require 'combinatorics/list_comprehension'

Benchmark.bm(12) do |b|
  singleton_list = ([1] * 500)
  single_enum_list = [1..200, 1]
  depth_list = [1..200]

  b.report('singleton:') do
    singleton_list.comprehension.each { |list| list.last }
  end


  b.report('single-enum:') do
    single_enum_list.comprehension.each { |list| list.last }
  end

  (1..3).each do |n|
    list = (depth_list * n)

    b.report("depth #{n}:") do
      list.comprehension.each { |list| list.last }
    end
  end
end
