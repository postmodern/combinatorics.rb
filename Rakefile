require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.4.0'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name = 'combinatorics'
    gem.summary = %Q{Bringing (more) Combinatorics to Ruby}
    gem.description = %Q{A collection of modules and methods for performing Combinatoric calculations.}
    gem.email = 'postmodern.mod3@gmail.com'
    gem.homepage = 'http://github.com/postmodern/combinatorics'
    gem.authors = ['Postmodern']
    gem.add_development_dependency 'rspec', '~> 2.0.0'
    gem.add_development_dependency 'yard', '~> 0.6.0'
    gem.add_development_dependency 'jeweler', '~> 1.4.0'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

begin
  require 'yard'

  YARD::Rake::YardocTask.new
rescue LoadError
  task :yard do
    abort 'YARD is not available. In order to run yard, you must: gem install yard'
  end
end
