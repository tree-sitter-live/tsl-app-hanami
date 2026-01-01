# frozen_string_literal: true

require 'hanami'

module TreeSitterLive
  class App < Hanami::App
    config.actions.sessions = :cookie, { secret: ENV.fetch('SESSION_SECRET', nil) }
  end
end
