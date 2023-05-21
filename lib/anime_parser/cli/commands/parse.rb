# frozen_string_literal: true

module AnimeParser
  module CLI
    module Commands
      class Parse < Dry::CLI::Command
        desc "Generate parsed output in specified format"
        option :mode,
               default: "standard",
               values: %w[standard json yaml txt csv],
               desc: "Generates output in specified format"

        def call(**options)
          case options[:mode]
          when "standard"
            AnimeParser::Formatters::StandardFormatter.new(anime_list).generate_output
          when "yaml"
            AnimeParser::Formatters::YamlFormatter.new(anime_list).generate_output
          when "json"
            AnimeParser::Formatters::JsonFormatter.new(anime_list).generate_output
          when "csv"
            AnimeParser::Formatters::CsvFormatter.new(anime_list).generate_output
          when "txt"
            AnimeParser::Formatters::TxtFormatter.new(anime_list).generate_output
          else
            raise "Unknown format"
          end
        end

        private

        def anime_list
          @anime_list ||= AnimeParser::CLI::Parser.new.call
        end
      end
    end
  end
end
