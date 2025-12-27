# frozen_string_literal: true

Bundler.require(:tools)

require 'pathname'
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV['HANAMI_ENV'] ||= 'test'
require 'hanami/prepare'

SPEC_ROOT.glob('support/**/*.rb').each { |f| require f }
