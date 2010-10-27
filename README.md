# Combinatorics

* [github.com/postmodern/combinatorics](http://github.com/postmodern/combinatorics)
* [github.com/postmodern/combinatorics/issues](http://github.com/postmodern/combinatorics/issues)
* Postmodern (postmodern.mod3 at gmail.com)

## Description

A collection of modules and methods for performing
[Combinatoric](http://en.wikipedia.org/wiki/Combinatoric) calculations.

## Features

* Adds `powerset` to {Array} and {Set}.
* Added {Range#&}, {Range#upto} and {Range#downto}.
* Adds Haskell/Python style list comprehensions via {Array#comprehension}.

## Examples

Power-set of an {Array}:

    require 'combinatorics/power_set'

    [1,2,3,4].powerset
    # => [[],
          [4],
          [3],
          [3, 4],
          [2],
          [2, 4],
          [2, 3],
          [2, 3, 4],
          [1],
          [1, 4],
          [1, 3],
          [1, 3, 4],
          [1, 2],
          [1, 2, 4],
          [1, 2, 3],
          [1, 2, 3, 4]]

Power-set of a {Set}:

    Set['ab', 'cd', 'ef'].powerset
    # => [#<Set: {}>,
          #<Set: {"ef"}>,
          #<Set: {"cd"}>,
          #<Set: {"cd", "ef"}>,
          #<Set: {"ab"}>,
          #<Set: {"ab", "ef"}>,
          #<Set: {"ab", "cd"}>,
          #<Set: {"ab", "cd", "ef"}>]

Find the intersecting sub-range between two ranges:

    (1..50) & (20..100)
    # => (20..50)

Enumerate over every sub-range between two ranges:

    (1..5).upto(2..10).to_a
    # => [1..5, 1..6, 1..7, 1..8, 1..9, 1..10,
          2..5, 2..6, 2..7, 2..8, 2..9, 2..10]

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

## Install

    $ sudo gem install combinatorics

## Copyright

Copyright (c) 2010 Hal Brodigan

See {file:LICENSE.txt} for license information.

