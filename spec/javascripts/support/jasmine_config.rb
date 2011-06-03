require 'barista'
require 'logger'

require File.join(Rails.root, 'config/initializers/barista_config')
Barista.configure do |c|
  c.env = 'test'
  c.logger = Logger.new(STDOUT)
  c.logger.level = Logger::INFO
  c.before_compilation do |path|
    relative_path = Pathname(path).relative_path_from(Rails.root)
    c.logger.info "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] Barista: Compiling #{relative_path}"
  end
end
Barista.setup_defaults

module Jasmine
  def self.app(config)
    Barista::Framework.register 'jasmine', File.expand_path('../coffeescripts', config.spec_dir)
    Barista::Framework['jasmine'].instance_variable_set('@output_root', Pathname(config.spec_dir).join('compiled'))

    Rack::Builder.app do
      use Rack::Head

      map('/run.html')         { run Jasmine::Redirect.new('/') }
      map('/__suite__')        { run Barista::Filter.new(Jasmine::FocusedSuite.new(config)) }

      map('/__JASMINE_ROOT__') { run Rack::File.new(Jasmine.root) }
      map(config.spec_path)    { run Rack::File.new(config.spec_dir) }
      map(config.root_path)    { run Rack::File.new(config.project_root) }

      map('/favicon.ico')      { run Rack::File.new(File.join(Rails.root, 'public', 'favicon.ico')) }

      map('/') do
        run Rack::Cascade.new([
          Rack::URLMap.new('/' => Rack::File.new(config.src_dir)),
          Barista::Filter.new(Jasmine::RunAdapter.new(config))
        ])
      end
    end
  end
end
