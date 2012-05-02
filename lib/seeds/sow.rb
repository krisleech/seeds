module Seeds
  class Sow
    def self.sow options = {}
      models_to_dump = {}
      models_to_dump.each do |model_name, truefalse|
        seeds = []
        seeds << "#Dumping model [#{model_name}]"
        begin
          model_name.constantize.all.each do |r|
            unless r.to_s == 'SchemaMigrations'
                attributes_hash = []
                r.attributes.collect do |attr|
                  unless drop_fields.size > 0 && drop_fields.include?(attr[0])
                    attributes_hash << ":#{attr[0]} => %q[#{attr[1]}]"
                  end
                end
                seeds << "#{model_name}.create(#{attributes_hash.join(", ")})"
            end 
          end  
        rescue Exception => e
          puts e
        end
        seeds << "#Finished dumping model [#{model_name}] Records:#{seeds.size - 1}"
        File.open("#{Rails.root}/db/seeds.rb", "a"){ |f| seeds.each{ |s| f.puts s} }
      end
    end
  end
end
