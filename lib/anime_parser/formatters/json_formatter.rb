# frozen_string_literal: true

require "json"

module AnimeParser
  module Formatters
    class JsonFormatter
      attr_reader :list

      def initialize(list)
        @list = list
      end

      def generate_output
        File.write("anime_list.json",
                   JSON.pretty_generate(list, indent: "  ", space: " ", object_nl: "\n", array_nl: "\n"))
      end
    end
  end
end
