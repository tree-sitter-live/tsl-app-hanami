# frozen_string_literal: true

module TreeSitterLive
  class Routes < Hanami::Routes
    slice :playground, at: '/' do
      root to: 'home.show'

      resources :grammars
    end
  end
end
