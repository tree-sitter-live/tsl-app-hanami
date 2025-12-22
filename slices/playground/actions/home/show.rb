# frozen_string_literal: true

module Playground
  module Actions
    module Home
      class Show < Playground::Action
        def handle(*, response)
          response.render(view)
        end
      end
    end
  end
end
