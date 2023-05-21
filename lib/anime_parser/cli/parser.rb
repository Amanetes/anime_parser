# frozen_string_literal: true

require "nokogiri"
require "net/http"

module AnimeParser
  module CLI
    class Parser
      attr_reader :url

      def initialize(url = AnimeParser::Constants::ONGOING_ANIME_LIST)
        @url = URI(url)
      end

      def call
        anime_list = parse_anime_list
        add_ratings(anime_list)
        sort_anime_list(anime_list)
      end

      private

      def parse_anime_list
        origin = url.origin
        path = File.dirname(url.path)
        raw_list = doc.xpath('//a[contains(concat(" ", @href, " "), " animation.php?") and contains(concat(" ", @class, " "), "review")]')

        raw_list.each_with_object([]) do |item, memo|
          memo << { name: item.text, url: "#{origin}#{path}/#{item["href"]}" }
        end.reject { |item| item[:name].empty? }
      end

      def add_ratings(anime_list)
        rating = doc.css('td[bgcolor="#eaeaea"] font[size="14"]').map(&:text)

        anime_list.each do |item|
          item[:rating] = rating[anime_list.index(item)] || "0%"
        end
      end

      def sort_anime_list(anime_list)
        anime_list.sort_by { |item| -item[:rating].delete("%").to_i }
      end

      def html
        @html = response.body
      end

      def response
        @response = Net::HTTP.get_response(url)
      end

      def doc
        @doc = Nokogiri::HTML(html)
      end
    end
  end
end
