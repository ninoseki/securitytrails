# SecurityTrails

[![Build Status](https://travis-ci.org/ninoseki/securitytrails.svg?branch=master)](https://travis-ci.org/ninoseki/securitytrails)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/797d576993224ddb9fdd54280417812b)](https://www.codacy.com/app/ninoseki/securitytrails?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ninoseki/securitytrails&amp;utm_campaign=Badge_Grade)
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
api.history.get_dns_history("github.com", "a")
api.history.get_all_dns_history("github.com", "a")
api.history.get_whois_history("github.com")


# IPs
# https://docs.securitytrails.com/v1.0/reference#ips
api.ips.explore("8.8.8.8")
api.ips.search("ptr_part = 'ns1'")
api.ips.stats("ptr_part = 'amazon.com'")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/securitytrails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
