# frozen_string_literal: true

module TreeSitterLive
  class Settings < Hanami::Settings
    setting :sidekiq_redis_url, constructor: Types::Params::String.constrained(filled: true)
  end
end
