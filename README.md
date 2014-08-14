# MacFormat

This is a gem that leverages [MacAddress](https://github.com/uceem/mac_address) for validations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mac_format'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install mac_format
```

## Usage

In order to validate an attribute, use the `validates` keyword:

```ruby
class Device < ActiveRecord::Base

  # ...

  validates :mac, mac_format: true

  # ...

end
```

Now the mac attribute will be validated:

```ruby
Device.new(mac: 'invalidmac').valid?        # => false
Device.new(mac: 'aa:bb:cc:dd:ee:ff').valid? # => true
```

Also, the model in question doesn't need to inherit from ActiveRecord::Base, you only need to `include ActiveModel::Validations` in your class:

```
require 'mac_format'

class Awesome
  include ActiveModel::Validations
  attr_accessor :mac
  validates :mac, mac_format: true
end

awesome = Awesome.new

awesome.mac = "aa-bb-cc-dd-ee-ff"
awesome.valid? # => true

awesome.mac = "invalidmac"
awesome.valid? # => false
```

## Contributing

1. Fork it ( http://github.com/a10networks/mac_format/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
