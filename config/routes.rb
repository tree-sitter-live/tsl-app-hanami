# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

module TreeSitterLive
  class Routes < Hanami::Routes
    mount Sidekiq::Web, at: '/sidekiq'

    resources :grammars do
      resources :versions
    end

    root to: 'grammars.index'

    slice :playground, at: '/playground' do
      root to: 'home.show'
    end
  end
end
