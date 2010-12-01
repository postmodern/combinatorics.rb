require 'enumerator'

module Combinatorics
  # auto-detects the `Generator` class.
  Generator = if defined?(::Enumerator::Generator) # 1.9
                ::Enumerator::Generator
              elsif defined?(::Generator) # 1.8.7
                ::Generator
              end
end
