require 'enumerator'
require 'generator' if RUBY_VERSION < '1.9'

module Combinatorics
  # auto-detects the `Generator` class.
  Generator = if defined?(::Generator) # 1.8.7
                ::Generator
              elsif defined?(::Enumerator::Generator) # 1.9
                ::Enumerator::Generator
              else
                raise(NameError,"unable to find the Generator class")
              end
end
