# frozen_string_literal: true

require "yaml"

module AnimeParser
  module Formatters
    class YamlFormatter
      attr_reader :list

      def initialize(list)
        @list = list
      end

      def generate_output
        File.write("anime_list.yml", list.to_yaml)
      end
    end
  end
end
