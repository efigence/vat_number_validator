# vat_number_validator
Validate vat number format with vatlayer.com API

## Usage
Add to your Gemfile:
```Ruby
gem 'vat_number_validator'
```
Run:
```Ruby
bundle install
```
In your `config/initializers/vat_number_validator.rb`:
```Ruby
yaml_path = 'config/vat_number_validator.yml'
VatNumberValidator::Configuration.configure yaml: yaml_path
```
In your `config/vat_number_validator.yml`:
```YAML
access_key: your_vatlayer_access_key
use_https: true # use this if your vatlayer plan allows secure connection
```
Then add the following to your model:
```Ruby
validates :my_vat_number_attribute, vat_number: true
```
