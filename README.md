# FayeAudit

Try to audit Faye server

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faye_audit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faye_audit

## Usage

Do this in your config.ru:

```ruby
require 'faye'
require 'faye_audit'

Faye::WebSocket.load_adapter 'thin'
FayeAudit.logger = Thin::Logging.logger # set the logger

faye = Faye::RackAdapter.new(mount: '/faye', timeout: 25) do |bayeux|
  FayeAudit.audit(bayeux) # audit bayeux
end

run faye

```

And you will get something like this:

```
faye: { client_count: 1, channel_count: 0 }
handshake:
client_id: fi5zawstsmsj1kc7wig6n6jz5s3n7rp

faye: { client_count: 1, channel_count: 1 }
subscribe:
client_id: fi5zawstsmsj1kc7wig6n6jz5s3n7rp
channel: /server
```

## TODO

Because I try to inspect into bayeux, so it might have efficiency problem. And logger to file can be slow. I should working on it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/faye_audit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

