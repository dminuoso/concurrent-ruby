require_relative 'lib/concurrent/version'
require_relative 'lib/concurrent/utility/engine'
require_relative 'support/file_map'

Gem::Specification.new do |s|
  s.name             = 'concurrent-ruby'
  s.version          = Concurrent::VERSION
  s.platform         = Concurrent.on_jruby? ? Gem::Platform::JAVA : Gem::Platform::RUBY
  s.authors          = ["Jerry D'Antonio", 'Petr Chalupa', 'The Ruby Concurrency Team']
  s.email            = 'concurrent-ruby@googlegroups.com'
  s.homepage         = 'http://www.concurrent-ruby.com'
  s.summary          = 'Modern concurrency tools for Ruby. Inspired by Erlang, Clojure, Scala, Haskell, F#, C#, Java, and classic concurrency patterns.'
  s.license          = 'MIT'
  s.date             = Time.now.strftime('%Y-%m-%d')
  s.files            = [*FileMap::MAP.fetch(:core),
                        *FileMap::MAP.fetch(:spec),
                        *(Dir['lib/**/*.jar'] if Concurrent.on_jruby?)]
  s.extra_rdoc_files = Dir['README*', 'LICENSE*', 'CHANGELOG*']
  s.require_paths    = ['lib']
  s.description      = <<-TXT.gsub(/^ +/, '')
    Modern concurrency tools including agents, futures, promises, thread pools, actors, supervisors, and more.
    Inspired by Erlang, Clojure, Go, JavaScript, actors, and classic concurrency patterns.
  TXT

  s.required_ruby_version = '>= 1.9.3'
end
