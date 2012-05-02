# Seeds

A feature filled way to generate your db/seeds.rb file from your existing database tables.
I will be adding many more features and updating the way that the current features work very soon.
But for now, this should be a nice and easy way to generate a seeds.rb file!

## Installation

Add this line to your application's Gemfile:

    gem 'seeds'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seeds

## Usage

First you will need to fire up your rails console using the command

    $ rails c

To create a seeds.rb file that includes data from all of your Models

    $ Seeds.sow
    
To only include certain Models

    $ Seeds.sow :include => "ModelName,ModelName"

To only exclude certain Models

    $ Seeds.sow :exclude => "Modelname,ModelName"
    
To drop specific fields from all Model dumps

    $ Seeds.sow :drop_fields => "Field1,Field2"
    
To drop a predefined "common" set of fields (id,created_at,updated_at)

    $ Seeds.sow :drop_common_fields
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
