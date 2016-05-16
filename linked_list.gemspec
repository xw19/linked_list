Gem::Specification.new do |s|
  s.name        = 'linked_list_sourav'
  s.version     = '0.0.14'
  s.date        = '2015-03-14'
  s.required_ruby_version = '>= 2.1.5'
  s.summary     = "Linked list library for ruby"
  s.description = "A simple linked list gem"
  s.authors     = ["Sourav Moitra"]
  s.email       = 'sourav.moitr@gmail.con'
  s.homepage    = 'https://github.com/xw19/linked_list'
  s.license     = 'MIT'
  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.add_development_dependency('rspec')
end
