# frozen_string_literal: true

module Playground
  module Views
    module Grammars
      class Index < Playground::View
        include Deps["repos.grammar_repo"]

        expose :grammars do
          grammar_repo.all
        end
      end
    end
  end
end
