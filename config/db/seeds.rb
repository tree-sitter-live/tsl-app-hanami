# frozen_string_literal: true

# This seeds file should create the database records required to run the app.
#
# The code should be idempotent so that it can be executed at any time.
#
# To load the seeds, run `hanami db seed`. Seeds are also loaded as part of `hanami db prepare`.

grammar_repo = Playground::Slice['repos.grammar_repo']
grammar_repo.create([
                      {
                        name: 'Ruby',
                        repository_url: 'https://github.com/tree-sitter/tree-sitter-ruby',
                        description: 'Ruby grammar for tree-sitter'
                      },
                      {
                        name: 'JavaScript',
                        repository_url: 'https://github.com/tree-sitter/tree-sitter-javascript',
                        description: 'JavaScript grammar for tree-sitter'
                      }
                    ])
