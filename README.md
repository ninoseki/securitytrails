# SecurityTrails

[![Gem Version](https://badge.fury.io/rb/securitytrails.svg)](https://badge.fury.io/rb/securitytrails)
[![Build Status](https://travis-ci.org/ninoseki/securitytrails.svg?branch=master)](https://travis-ci.org/ninoseki/securitytrails)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/9637f5ed2b8943c28d9d61db778330fb)](https://www.codacy.com/app/ninoseki/securitytrails)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/securitytrails/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/securitytrails?branch=master)

[SecurityTrails](https://securitytrails.com) API wrapper for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'securitytrails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install securitytrails

## Usage

```ruby
require "securitytrails"

# When given nothing, it tries to load your API key from ENV["SECURITYTRAILS_API_KEY"]
api = SecurityTrails::API.new
# or you can pass your API key as an argument
api = SecurityTrails::API.new(YOUR_API_KEY)

# General
# https://docs.securitytrails.com/reference#general
api.ping
api.usage

# Domain details
# https://docs.securitytrails.com/v1.0/reference#domains
api.domain.get_by_hostname("github.com")
api.domain.get_subdomains("github.com")
api.domain.get_tags("github.com")
api.domain.get_associated_domains("github.com")
api.domain.get_whois("github.com")

# Domain search
# https://docs.securitytrails.com/v1.0/reference#domain-search
api.domains.search(
    filter: {
        ipv4: "1.1.1.1"
})
api.domains.stats(
    filter: {
        ipv4: "1.1.1.1"
    }
)

# History
# https://docs.securitytrails.com/v1.0/reference#history
api.history.get_dns_history("github.com", type: "a")
api.history.get_all_dns_history("github.com", type: "a")
api.history.get_whois_history("github.com")

# IPs
# https://docs.securitytrails.com/v1.0/reference#ips
api.ips.explore("8.8.8.8")
api.ips.search("ptr_part = 'ns1'")
api.ips.stats("ptr_part = 'amazon.com'")

# Feeds
# https://docs.securitytrails.com/v1.0/reference#feeds
api.feeds.domains("new")
api.feeds.domains("new", tld: "jp")
```

All the API response (JSON / Hash) is wrapped by [OpenStruct](https://github.com/ruby/ostruct).

It means you can access to a response through a property-like syntax.

```ruby
res = api.domain.get_by_hostname("github.com")
puts res.hostname # => "github.com"
puts res.current_dns.a.first_seen # => "2018-09-12"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ninoseki/securitytrails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
