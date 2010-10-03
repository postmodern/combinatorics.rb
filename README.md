# Combinatorics

* [github.com/postmodern/combinatorics](http://github.com/postmodern/combinatorics)
* [github.com/postmodern/combinatorics/issues](http://github.com/postmodern/combinatorics/issues)
* Postmodern (postmodern.mod3 at gmail.com)

## Description

A collection of modules and methods for performing
[Combinatoric](http://en.wikipedia.org/wiki/Combinatoric) calculations.

## Features

* Adds `powerset` to {Array} and {Set}.
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

## License

See {file:LICENSE.txt} for license information.

