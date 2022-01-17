### 0.4.4 / 2022-01-16

* Fixed a bug in {Combinatorics::Choose.cardinality} for when `0`
  is given and `0` was returned instead of `1`.

### 0.4.3 / 2012-05-28

* Fixed a typo in the gemspec, which incorrectly set
  `required_rubygems_version` to the same value as `required_ruby_version`.

### 0.4.2 / 2012-05-27

* Avoid warnings on JRuby by checking for `::Generator` before
  `::Enumerator::Generator` in `combinatorics/generator`.
* Raise a `NameError` when the `Generator` class cannot be found in
  `combinatorics/generator`.
* Replaced ore-tasks with
  [rubygems-tasks](https://github.com/postmodern/rubygems-tasks#readme).

### 0.4.1 / 2011-10-15

* Fixed a typo in the gemspec.

### 0.4.0 / 2011-10-15

* Added {Math.sigma}.
* Added {Math.pi}.
* Added {Math.factorial}.
* Added {Math.subfactorial}.
* Added {Combinatorics::CartesianProduct}.
* Added {Combinatorics::Choose}.
* Added {Combinatorics::Derange}.
* Added {Combinatorics::Permute}.
* Added {Combinatorics::PowerSet}.

### 0.3.1 / 2010-10-26

* Do not call `enum_for` on `Enumerator` objects passed to
  {Array#comprehension}.
* Improved {Array#comprehension} benchmarks.
* Added [benchmark results] (see {file:Benchmarks.md}).

### 0.3.0 / 2010-10-17

* Added {Combinatorics::Generator} which auto-detects the `Generator`
  class.
* Added {Combinatorics::Enumerator} which auto-detects the `Enumerator`
  class.
* Better detection of when enumerable values passed to
  {Array#comprehension} reach their last value. This allows using
  `Generator` objects that yield different values for each cycle:

      multiplier = 0
      gen = Generator.new { |g|
        multiplier += 1
        5.times { |i| g.yield (i * multiplier) }
      }
  
      [[1,2], gen].comprehension.to_a
      # => [[1,0],[1,1],[1,2],[1,3],[1,4],[2,0],[2,2],[2,4],[2,6],[2,8]]

* Added a benchmark for {Array#comprehension} (see the
  [benchmarks](http://github.com/postmodern/combinatorics/tree/master/benchmarks) directory).

### 0.2.0 / 2010-10-03

* Added {Range#&}.
* Added {Range#upto}.
* Added {Range#downto}.

### 0.1.0 / 2010-10-02

* Initial release:
  * Adds `powerset` to {Array} and {Set}.
  * Adds Haskell/Python style list comprehensions via {Array#comprehension}.

