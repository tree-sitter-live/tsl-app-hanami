# frozen_string_literal: true

module TreeSitterLive
  module Views
    module Grammars
      class Show < TreeSitterLive::View
        include Deps['repos.grammar_repo']

        expose :grammar do |id:|
          grammar_repo.find(id)
        end
      end
    end
  end
end
