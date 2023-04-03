desc 'Import Pokemons from CSV'

task import_pokemons: :environment do
  import_pokemons_from_csv
end
