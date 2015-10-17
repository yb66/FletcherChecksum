# encoding: UTF-8

require 'rspec'
require 'rspec/its'
Spec_dir = File.expand_path( File.dirname __FILE__ )
# require 'pry-byebug'

# code coverage
# require 'simplecov'
# SimpleCov.start do
#   add_filter "/vendor/"
#   add_filter "/vendor.noindex/"
#   add_filter "/bin/"
# end


Dir[ File.join( Spec_dir, "/support/**/*.rb")].each do |f| 
  logger.info "requiring #{f}"
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

