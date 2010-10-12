Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-translations'
  s.version           = '0.3'
  
  s.authors = ['season', 'Victor Castell']
  s.email = 'victorcoder@gmail.com'
  s.homepage = 'http://github.com/seasonlabs/refinerycms-translations'
    
  s.description       = 'Ruby on Rails Translations engine for Refinery CMS'
  s.date              = '2010-10-05'
  s.summary           = 'Ruby on Rails Translations engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
