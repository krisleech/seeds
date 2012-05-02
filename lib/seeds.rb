require "seeds/version"
require "seeds/seeds.rb"
module Seeds
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :seeds do
        desc "Generate the seeds.rb file"
        task :sow do
          puts "doing some cool stuff"
        end # task
      end #namespace
    end # rake_tasks
  end # Railtie
end
