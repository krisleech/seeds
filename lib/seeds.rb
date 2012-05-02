require "seeds/version"

module Seeds
  def self.sow
    seeds = Array.new
    ActiveRecord::Base.connection.tables.collect do |t|
      t = t.underscore.singularize.camelize
      t.constantize.all.each do |r| 
            attrs_hash_string = r.attributes.collect{ |attr| ":#{attr[0]} => \"#{attr[1]}\"" }.join(", ")
            seed << "#{t}.create(#{attrs_hash_string})"
      end
    end
  end
end
