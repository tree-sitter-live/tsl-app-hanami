# frozen_string_literal: true

module TreeSitterLive
  module Relations
    class Grammars < TreeSitterLive::DB::Relation
      schema :grammars, infer: true
    end
  end
end
