Gem::Specification.new do |s|
  s.name = 'vat_number_validator'
  s.version = '0.0.4'
  s.authors = 'Marek Lipka'
  s.summary = 'Vat number validator'
  s.description = 'Vat number validator for Rails 3+ using vatlayer.com API'
  s.email = 'mlipka@artegence.com'
  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/efigence/vat_number_validator'
  s.license = 'MIT'

  s.require_paths = %w(lib)

  s.add_dependency('activemodel', '>= 3')
  s.add_dependency('confiture', '~> 0.1.4')
  s.add_dependency('httparty', '~> 0.13.5')
end
