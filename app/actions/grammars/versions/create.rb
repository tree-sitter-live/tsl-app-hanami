# frozen_string_literal: true

module TreeSitterLive
  module Actions
    module Grammars
      module Versions
        class Create < TreeSitterLive::Action
          include Deps[
            repo: 'repos.version_repo',
            index_view: 'views.grammars.versions.index'
          ]

          params do
            required(:grammar_id).filled(:integer)
            required(:identifier).filled(:string)
          end

          def handle(request, response)
            if request.params.valid?
              repo.create(request.params)
              response.redirect(routes.path(:grammar_versions, grammar_id: request.params[:grammar_id]))
            else
              response.status = :unprocessable_entity
              response.render(view, errors: request.params.errors.to_h)
            end
          end
        end
      end
    end
  end
end
