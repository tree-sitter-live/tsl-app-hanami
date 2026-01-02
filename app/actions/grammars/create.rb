# frozen_string_literal: true

module TreeSitterLive
  module Actions
    module Grammars
      class Create < TreeSitterLive::Action
        include Deps[
          repo: 'repos.grammar_repo',
          index_view: 'views.grammars.index'
        ]

        params do
          required(:name).filled(:string)
          optional(:description).filled(:string)
          required(:repository_url).filled(::TreeSitterLive::Types::Url)
        end

        def handle(request, response)
          if request.params.valid?
            repo.create(request.params)
            response.redirect(routes.path(:grammars))
          else
            response.status = :unprocessable_entity
            response.render(view, errors: request.params.errors.to_h)
          end
        end
      end
    end
  end
end
