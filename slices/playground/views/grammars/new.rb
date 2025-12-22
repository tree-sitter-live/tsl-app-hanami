# frozen_string_literal: true

module Playground
  module Views
    module Grammars
      class New < Playground::View
        expose :errors, default: Dry::Core::EMPTY_HASH
      end
    end
  end
end
