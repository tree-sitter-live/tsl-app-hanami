# frozen_string_literal: true

require 'pathname'
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV['HANAMI_ENV'] ||= 'test'
require 'hanami/prepare'
require 'rom/factory'
require 'sidekiq/testing'

Bundler.require(:tools)

Factory = ROM::Factory.configure do |config|
  config.rom = Hanami.app['db.rom']
end

Sidekiq::Testing.inline!

Dir["#{File.dirname(__FILE__)}/support/factories/*.rb"].each { |file| require file }

SPEC_ROOT.glob('support/**/*.rb').each { |f| require f }
