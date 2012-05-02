require "seeds/version"
require "seeds/sow.rb"
module Seeds
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :seeds do
        desc "Generate the seeds.rb file"
        task :sow, [:options] => [:environment] do |t,args|
          Seeds::Sow.sow eval(args[:options])
        end # task
      end # namespace
    end # rake_tasks
  end # Railtie
end # Module
