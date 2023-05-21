# AnimeParser

This program parses data from [WorldArt](https://http://www.world-art.ru/animation/translation.php/) and displays current month's anime ongoings.
List of anime is sorted by user rating.
List of anime includes a link to the anime's page on [WorldArt](https://http://www.world-art.ru/animation/translation.php/).
The user can then select format of the output and save it to a file.

To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

- Clone this repository
- Run the following commands in your terminal to install dependencies
```ruby
bundle install
```

## Usage

- Run the following command in your terminal to start the program
```ruby
chmod +x bin/run
exe/anime_parser parse
```
- Type `exe/anime_parser --help` to display help
- To display current version type ```exe/anime_parser --version```
- You can also display help for specific command by typing `exe/anime_parser [COMMAND] --help`

This program generates output in following formats `standard json yaml txt csv`. Standard format is used to display output in STDOUT

```ruby
exe/anime_parser parse --mode=standard
exe/anime_parser parse --mode=json
exe/anime_parser parse --mode=yaml
exe/anime_parser parse --mode=txt
exe/anime_parser parse --mode=csv
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Amanethes/anime_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
