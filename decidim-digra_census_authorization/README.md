# Decidim::DigraCensusAuthorization

A decidim package to provice user authorizations agains the Diputación of Granada census API


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-digra_census_authorization'
```

And then execute:

```bash
bundle install
```

## Configuration

Once installed, the following env variables can be configured:

- **DIGRA_CENSUS_URL**: URL to the DIGRA census web service
- **DIGRA_CENSUS_PUBLIC_KEY**: Public Key used in the DIGRA web service authentication
- **DIGRA_CENSUS_USERNAME**: Username for DIGRA web service authentication
- **DIGRA_CENSUS_PASSWORD**: Password for DIGRA web service authentication

### Run tests

Create a dummy app in your application (if not present):

```bash
bin/rails decidim:generate_external_test_app
```

And run tests:

```bash
bundle exec rspec spec
```

## License

AGPLv3 (same as Decidim)
