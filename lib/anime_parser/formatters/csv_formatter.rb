# frozen_string_literal: true

require "csv"

module AnimeParser
  module Formatters
    class CsvFormatter
      attr_reader :list

      def initialize(list)
        @list = list
      end

      def generate_output
        CSV.open("anime_list.csv", "w") do |csv|
          csv << AnimeParser::Constants::TABLE_HEADERS
          list.each do |item|
            csv << [item[:name], item[:url], item[:rating]]
          end
        end
      end
    end
  end
end
