# frozen_string_literal: true

module TreeSitterLive
  module Actions
    module Grammars
      class Update < TreeSitterLive::Action
        include Deps[
          repo: 'repos.grammar_repo',
          show_view: 'views.grammars.show'
        ]

        params do
          required(:id).filled(:integer)

          required(:grammar).hash do
            required(:name).filled(:string)
            optional(:description).filled(:string)
            required(:repository_url).filled(::TreeSitterLive::Types::Url)
          end
        end

        def handle(request, response)
          grammar = repo.find(request.params[:id])

          halt :unprocessable_entity unless grammar

          if request.params.valid?
            repo.update(grammar.id, **request.params[:grammar])
            response.render(show_view, id: grammar.id)
          else
            response.status = :unprocessable_entity
            response.render(view, id: grammar.id, errors: request.params.errors.to_h)
          end
        end
      end
    end
  end
end
