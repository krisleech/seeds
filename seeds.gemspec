# -*- encoding: utf-8 -*-
require File.expand_path('../lib/seeds/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Corey Daley"]
  gem.email         = ["cdaley1981@gmail.com"]
  gem.description   = %q{Generate seeds.rb file from existing database tables}
  gem.summary       = %q{Seeds allows you to quickly and easily generate your 
                        db/seeds.rb file using your existing database tables
                        in your Rails project.}
  gem.homepage      = "http://github.com/coreydaley/seeds"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "seeds"
  gem.require_paths = ["lib"]
  gem.version       = Seeds::VERSION
end
