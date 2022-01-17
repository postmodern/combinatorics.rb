# Combinatorics

[![CI](https://github.com/postmodern/combinatorics/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/combinatorics/actions/workflows/ruby.yml)
[![Code Climate](https://codeclimate.com/github/postmodern/combinatorics.svg)](https://codeclimate.com/github/postmodern/combinatorics)

* [Source](https://github.com/postmodern/combinatorics)
* [Issues](https://github.com/postmodern/combinatorics/issues)
* [Documentation](http://rubydoc.info/gems/combinatorics)

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

* Adds Haskell/Python style list comprehensions via [Array#comprehension].
* Provides reusable Combinatorics Mixins:
  * [Combinatorics::CartesianProduct]
  * [Combinatorics::Choose]
  * [Combinatorics::Derange]
  * [Combinatorics::Permute]
  * [Combinatorics::PowerSet]
* Adds Combinatorics core extension methods to {Array} and {Set}:
  * [cartesian_product]
  * [choose]
  * [derange]
  * [permute]
  * [powerset]
* Adds additional core extension methods:
  * [Range#&]
  * [Range#upto]
  * [Range#downto]
  * [Math.sigma]
  * [Math.pi]
  * [Math.factorial]
  * [Math.subfactorial]

[Array#comprehension]: https://rubydoc.info/gems/combinatorics/Array#comprehension-instance_method
[Combinatorics::CartesianProduct]: https://rubydoc.info/gems/combinatorics/Combinatorics/CartesianProduct
[Combinatorics::Choose]: https://rubydoc.info/gems/combinatorics/Combinatorics/Choose
[Combinatorics::Derange]: https://rubydoc.info/gems/combinatorics/Combinatorics/Derange
[Combinatorics::Permute]: https://rubydoc.info/gems/combinatorics/Combinatorics/Permute
[Combinatorics::PowerSet]: https://rubydoc.info/gems/combinatorics/Combinatorics/PowerSet
[cartesian_product]: https://rubydoc.info/gems/combinatorics/Combinatorics/CartesianProduct/Mixin#cartesian_product-instance_method
[choose]: https://rubydoc.info/gems/combinatorics/Combinatorics/Choose/Mixin#choose-instance_method
[derange]: https://rubydoc.info/gems/combinatorics/Combinatorics/Derange/Mixin#derange-instance_method
[permute]: https://rubydoc.info/gems/combinatorics/Combinatorics/Permute/Mixin#permute-instance_method
[powerset]: https://rubydoc.info/gems/combinatorics/Combinatorics/PowerSet/Mixin#powerset-instance_method
[Range#&]: https://rubydoc.info/gems/combinatorics/Range#&-instance_method
[Range#upto]: https://rubydoc.info/gems/combinatorics/Range#upto-instance_method
[Range#downto]: https://rubydoc.info/gems/combinatorics/Range#downto-instance_method
[Math.sigma]: https://rubydoc.info/gems/combinatorics/Math#sigma-class_method
[Math.pi]: https://rubydoc.info/gems/combinatorics/Math#pi-class_method
[Math.factorial]: https://rubydoc.info/gems/combinatorics/Math#factorial-class_method
[Math.subfactorial]: https://rubydoc.info/gems/combinatorics/Math#subfactorial-class_method

## Examples

Power-set:

```ruby
Set['ab', 'cd', 'ef'].powerset
# => [#<Set: {}>,
      #<Set: {"ef"}>,
      #<Set: {"cd"}>,
      #<Set: {"cd", "ef"}>,
      #<Set: {"ab"}>,
      #<Set: {"ab", "ef"}>,
      #<Set: {"ab", "cd"}>,
      #<Set: {"ab", "cd", "ef"}>]
```

Cartesian products:

```ruby
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
```

k-combinations:

```ruby
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
```

Derangements:

```ruby
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
```

Permutation cardinality:

```ruby
require 'combinatorics/permutation'

Combinatorics::Permute.cardinality(128)
# => 8256
```

List comprehensions:

```ruby
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
```

Find the intersecting sub-range between two ranges:

```ruby
(1..50) & (20..100)
# => (20..50)
```

Enumerate over every sub-range between two ranges:

```ruby
(1..5).upto(2..10).to_a
# => [1..5, 1..6, 1..7, 1..8, 1..9, 1..10,
      2..5, 2..6, 2..7, 2..8, 2..9, 2..10]
```

## Requirements

* [ruby](http://www.ruby-lang.org/) >= 1.8.7

## Install

```shell
$ gem install combinatorics
```

## Copyright

Copyright (c) 2010-2022 Hal Brodigan

See {file:LICENSE.txt} for license information.
