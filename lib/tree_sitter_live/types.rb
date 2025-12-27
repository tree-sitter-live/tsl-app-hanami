# frozen_string_literal: true

require 'dry/types'

module TreeSitterLive
  Types = Dry.Types(default: :strict)

  module Types
    Url = String.constrained(format: URI::DEFAULT_PARSER.make_regexp(%w[http https]))
  end
end
