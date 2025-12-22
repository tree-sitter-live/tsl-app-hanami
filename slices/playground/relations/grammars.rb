# frozen_string_literal: true

module Playground
  module Relations
    class Grammars < Playground::DB::Relation
      schema :grammars, infer: true
    end
  end
end
