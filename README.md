# ActiveBrainz

![Continuous Integration](https://github.com/floriandejonckheere/active_brainz/workflows/Continuous%20Integration/badge.svg)
![Release](https://img.shields.io/github/v/release/floriandejonckheere/active_brainz?label=Latest%20release)

ActiveRecord integrations for the [MusicBrainz database](https://musicbrainz.org/doc/MusicBrainz_Database).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "active_brainz"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_brainz

## Configuration

Configure your `database.yml` with the MusicBrainz database:

```yaml
musicbrainz:
  adapter: postgresql
  host: postgres
  port: 5432
  database: musicbrainz
  user: musicbrainz
  password: musicbrainz
```

## Usage

TODO: Write usage instructions here

## Documentation

The SQL scripts used to create the MusicBrainz database schema can be found on their [Github repository](https://github.com/metabrainz/musicbrainz-server/tree/master/admin/sql).

## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake spec` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.
Modify `config/database.rb` or use environment variables to connect to a non-localhost server.

The following rake tasks are available:

```
rake active_brainz:models:annotate  # Annotate models
rake active_brainz:models:generate  # Generates models based on db/schema.rb file
rake active_brainz:models:render    # Generate and annotate models
rake db:create                      # Creates the database
rake db:drop                        # Drops the database
rake db:schema:dump                 # Dumps the database structure to db/schema.rb
rake db:schema:load                 # Recreates the databases from the schema.rb file
rake spec                           # Run RSpec code examples

```

To release a new version, update the version number in `lib/active_brainz/version.rb`, commit it and create a git tag starting with `v`, and push it to the repository.
Github Actions will automatically run the test suite, build the `.gem` file and push it to [rubygems.org](https://rubygems.org).

If MusicBrainz' database schema version gets bumped, don't forget to bump the schema version in `lib/active_brainz/version.rb` as well.

### Implementing a new model

1. Uncomment the table in `lib/active_brainz/database.rb`
1. Run `rake active_brainz:models:render`
1. Review the generated models, specs and factories
1. Uncomment associations to new models in existing models

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/floriandejonckheere/active_brainz](https://github.com/floriandejonckheere/active_brainz). 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/floriandejonckheere/active_brainz/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveBrainz project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/floriandejonckheere/active_brainz/blob/master/CODE_OF_CONDUCT.md).
