# frozen_string_literal: true

require "zeitwerk"
require "dry/cli"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "cli" => "CLI"
loader.setup

module AnimeParser
  class Error < StandardError; end

  def self.start!
    Dry::CLI.new(AnimeParser::CLI::Commands).call
  end
end

loader.eager_load
