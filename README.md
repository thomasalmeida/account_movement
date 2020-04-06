# AccountMovement

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/account_movement`. To experiment with that code, run `bin/console` for an interactive prompt.

AccoutMovement provides a account balance report through account file CSV and transaction file CSV.

## Installation

Like so:

```bash
$ git clone https://github.com/thomasalmeida/account_movement
$ cd account_movement
$ rake build
$ gem install pkg/account_movement-0.1.0.gem
```

## Usage

```bash
$ account_movement {path/to/file/account.csv} {path/to/file/transaction.csv}
```
## Test

```bash
$ rake test
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thomasalmeida/account_movement. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/thomasalmeida/account_movement/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AccountMovement project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/thomasalmeida/account_movement/blob/master/CODE_OF_CONDUCT.md).
