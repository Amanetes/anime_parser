# frozen_string_literal: true

require "csv"

module AnimeParser
  module Formatters
    class TxtFormatter
      attr_reader :list

      def initialize(list)
        @list = list
      end

      def generate_output
        File.open("anime_list.txt", "w") do |file|
          list.each do |item|
            file.write("#{item[:name]}\n")
            file.write("#{item[:url]}\n")
            file.write("#{item[:rating]}\n")
          end
        end
      end
    end
  end
end
