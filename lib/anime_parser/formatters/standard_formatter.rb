# frozen_string_literal: true

module AnimeParser
  module Formatters
    class StandardFormatter
      attr_reader :list

      def initialize(list)
        @list = list
      end

      def generate_output
        list.each do |item|
          puts "#{item[:name]} - #{item[:url]} - #{item[:rating]}"
        end
      end
    end
  end
end
