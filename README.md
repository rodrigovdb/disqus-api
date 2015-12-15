# Disqus' API Client

Just a simple client to access Disqus' API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'disqus', github: 'rodrigovdb/disqus-api'
```

define into your application's .env the DIQUS_API_KEY entry with your key.

```
# .env
DISQUS_API_KEY='ymCYoWaqlCKVWMkke0CeWQfMlUevg1segXPc8wWeLWOamqGHyjyTngDYlz1Ijimc'
```

If you don't have an api-key, you need create an application first. The key will be provided after app creation.
The easy way is go direct [here](https://disqus.com/api/applications/register/)

And then execute:

    $ bundle

And finally require into your code

```
require 'disqus-api-client'
```

## Usage

See doc/ dir


## Contributing

1. Fork it ( https://github.com/[my-github-username]/disqus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
