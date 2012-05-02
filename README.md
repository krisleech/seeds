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

No need to fire up the rails console anymore, this baby runs as a rake task!
The syntax is a little goofy because of the way rake takes in arguments,
you are basically passing the entire hash as an argument, then it gets
eval'd before being passed on to the Seeds Module.


To create a seeds.rb file that includes data from all of your Models

    $ rake seeds:sow
    
To only include certain Models (this should work using table names also, but it's not tested yet)

    $ seeds:sow['{:include => "ModelName,ModelName"}']

To only exclude certain Models (this should work using table names also, but it's not tested yet)

    $ seeds:sow['{:exclude => "Modelname,ModelName"}']
    
To drop specific fields from all Model dumps

    $ seeds:sow['{:drop_fields => "Field1,Field2"}']
    
To drop a predefined "common" set of fields (id,created_at,updated_at)

    $ seeds:sow['{:drop_fields_common => true}']
    
Example sending multiple options

  $ seeds:sow['{:drop_fields_common => true, :drop_fields => "Field1,Field2", :include => "ModelName,ModelName"}']
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
