# RoverControl
[![Build Status](https://travis-ci.org/thiago-sydow/rover_control.svg?branch=master)](https://travis-ci.org/thiago-sydow/rover_control)
[![Code Climate](https://codeclimate.com/github/thiago-sydow/rover_control/badges/gpa.svg)](https://codeclimate.com/github/thiago-sydow/rover_control)
[![Test Coverage](https://codeclimate.com/github/thiago-sydow/rover_control/badges/coverage.svg)](https://codeclimate.com/github/thiago-sydow/rover_control/coverage)

## Installation
```
$ git clone git@github.com:thiago-sydow/rover_control.git
$ cd rover_control/
$ bundle install
```

## Usage
```
$ bin/console
```

A console session will start. You just need to call `RoverControl.process_rovers_instructions`

Ex:

```
RoverControl.process_rovers_instructions("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
```

The Result will be:

`"1 3 N\n5 1 E"`

If you want to actually show the response in multiple lines, just `puts` it:

```
puts RoverControl.process_rovers_instructions("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
1 3 N
5 1 E
=> nil
```

If anything goes wrong when processing the commands for a particular rover, his output will be 'error'.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thiago-sydow/rover_control.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
