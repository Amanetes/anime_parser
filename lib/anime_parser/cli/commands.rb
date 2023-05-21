# frozen_string_literal: true

module AnimeParser
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register "version", Version, aliases: %w[v -v --version]
      register "parse", Parse, aliases: %w[p -p --parse]
    end
  end
end
