# Combinatorics

[![CI](https://github.com/postmodern/combinatorics/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/combinatorics/actions/workflows/ruby.yml)

* [Source](https://github.com/postmodern/combinatorics)
* [Issues](https://github.com/postmodern/combinatorics/issues)
* [Documentation](http://rubydoc.info/gems/combinatorics)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

A collection of modules and methods for performing
[Combinatoric](http://en.wikipedia.org/wiki/Combinatoric) calculations.
Methods are defined to compute power sets, cartesian products, permutations, 
combinations, and derangements.

Note: this includes k-combinations and k-permutations, i.e. only generating
resultant sets of a given size. Each set theory operation method supports block 
arguments to allow continuous code execution during the combinatoric set
generation process. Each combinatoric operation implementation also supports a
`cardinality` method which determines the total number of subsets that will be
created beforehand (to aid in the avoidance of starting an operation which will 
never complete due to exponential computational complexity.)

## Features

* Adds Haskell/Python style list comprehensions via {Array#comprehension}.
* Provides reusable Combinatorics Mixins:
  * {Combinatorics::CartesianProduct}
  * {Combinatorics::Choose}
  * {Combinatorics::Derange}
  * {Combinatorics::Permute}
  * {Combinatorics::PowerSet}
* Adds Combinatorics conveniance methods to {Array} and {Set}:
  * `cartesian_product`
  * `choose`
  * `derange`
  * `permute`
  * `powerset`
* Adds conveniance methods:
  * {Range#&}
  * {Range#upto}
  * {Range#downto}
  * {Math.sigma}
  * {Math.pi}
  * {Math.factorial}
  * {Math.subfactorial}

## Examples

Power-set:

    Set['ab', 'cd', 'ef'].powerset
    # => [#<Set: {}>,
          #<Set: {"ef"}>,
          #<Set: {"cd"}>,
          #<Set: {"cd", "ef"}>,
          #<Set: {"ab"}>,
          #<Set: {"ab", "ef"}>,
          #<Set: {"ab", "cd"}>,
          #<Set: {"ab", "cd", "ef"}>]

Cartesian products:

    require 'combinatorics/cartesian_product'
    
    ['a', 'b', 'c'].cartesian_product([0, 1, 2]).to_a
    # => [["a", 0], 
          ["b", 0], 
          ["c", 0], 
          ["a", 1], 
          ["b", 1], 
          ["c", 1], 
          ["a", 2], 
          ["b", 2], 
          ["c", 2]]

k-combinations:

    require 'combinatorics/choose'

    ('a'..'f').to_a.choose(2).to_a
    # => [["a", "b"], 
          ["a", "c"], 
          ["a", "d"], 
          ["a", "e"], 
          ["a", "f"], 
          ["b", "c"], 
          ["b", "d"], 
          ["b", "e"], 
          ["b", "f"], 
          ["c", "d"], 
          ["c", "e"], 
          ["c", "f"], 
          ["d", "e"], 
          ["d", "f"], 
          ["e", "f"]]

Derangements:

    require 'combinatorics/derange'
    
    [:_, :q, :z, :x].derange.to_a
    # => [[:q, :_, :x, :z], 
          [:q, :z, :x, :_], 
          [:q, :x, :_, :z], 
          [:z, :_, :x, :q], 
          [:z, :x, :_, :q], 
          [:z, :x, :q, :_], 
          [:x, :_, :q, :z], 
          [:x, :z, :_, :q], 
          [:x, :z, :q, :_]]

Permutation cardinality:

    require 'combinatorics/permutation'
    
    Combinatorics::Permute.cardinality(128)
    # => 8256

List comprehensions:

    require 'combinatorics/list_comprehension'

    [(0..10).step(2),('a'..'c')].comprehension.to_a
    # => [[0, "a"],
          [0, "b"],
          [0, "c"],
          [2, "a"],
          [2, "b"],
          [2, "c"],
          [4, "a"],
          [4, "b"],
          [4, "c"],
          [6, "a"],
          [6, "b"],
          [6, "c"],
          [8, "a"],
          [8, "b"],
          [8, "c"],
          [10, "a"],
          [10, "b"],
          [10, "c"]]

Find the intersecting sub-range between two ranges:

    (1..50) & (20..100)
    # => (20..50)

Enumerate over every sub-range between two ranges:

    (1..5).upto(2..10).to_a
    # => [1..5, 1..6, 1..7, 1..8, 1..9, 1..10,
          2..5, 2..6, 2..7, 2..8, 2..9, 2..10]

## Requirements

* [ruby](http://www.ruby-lang.org/) >= 1.8.7

## Install

    $ gem install combinatorics

## Copyright

Copyright (c) 2010-2012 Hal Brodigan

See {file:LICENSE.txt} for license information.
