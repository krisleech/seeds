module Seeds
  class Sow
    def self.sow options = {}
      models_to_dump = {}
      if options.has_key?(:include)
        include_models = options[:include].split(",")
        include_models.each_with_index do |item,index|
          include_models[index] = item.underscore.singularize.camelize
        end
      end
      if options.has_key?(:exclude)
        exclude_models = options[:exclude].split(",")
        exclude_models.each_with_index do |item,index|
          exclude_models[index] = item.underscore.singularize.camelize
        end
      end
      
      if !options.has_key?(:include) && !options.has_key?(:exclude)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
            models_to_dump[model_name] = true 
        end
      elsif options.has_key?(:include) && !options.has_key?(:exclude)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
          if include_models.include?(model_name)
            models_to_dump[model_name] = true
          end 
        end
      elsif options.has_key?(:exclude) && !options.has_key?(:include)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
          if !exclude_models.include?(model_name)
            models_to_dump[model_name] = true
          end
        end
      elsif options.has_key?(:include) && options.has_key?(:exclude)
        #Complicated! I will implement this soon!
      end
      drop_fields = []
      if options.has_key?(:drop_fields)
        fields_to_drop = options[:drop_fields].split(",")
        fields_to_drop.each do |item|
          drop_fields<< item
        end
      end
      if options.has_key?(:drop_fields_common)
        drop_fields<< "id"
        drop_fields<< "created_at"
        drop_fields<< "updated_at"
      end
      
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
