require 'enumerator'

module Combinatorics
  Enumerator = if defined?(::Enumerator) # 1.9
                 ::Enumerator
               elsif defined?(::Enumerable::Enumerator) # 1.8.7
                 ::Enumerable::Enumerator
               end
end
