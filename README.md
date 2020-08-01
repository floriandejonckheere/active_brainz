# ActiveBrainz

![CI](https://github.com/floriandejonckheere/active_brainz/workflows/CI/badge.svg)
![Release](https://github.com/floriandejonckheere/active_brainz/workflows/Create%20release/badge.svg)

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
Modify `config/database.yml` to connect to a non-localhost server.
In Rails applications, Rails' database configuration will take precedence.

The following rake tasks are available:

```
rake active_brainz:schema:dump      # Creates a db/schema.rb file that is portable against any DB supported by Active Record
rake active_brainz:models:generate  # Generates models based on db/schema.rb file
```

To install this gem onto your local machine, run `bundle exec rake install`. 
To release a new version, update the version number in `version.rb`, commit it and create a git tag starting with `v`, and push it to the repository.
Github Actions will automatically run the test suite, build the `.gem` file and push it to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/floriandejonckheere/active_brainz](https://github.com/floriandejonckheere/active_brainz). 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/floriandejonckheere/active_brainz/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveBrainz project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/floriandejonckheere/active_brainz/blob/master/CODE_OF_CONDUCT.md).
