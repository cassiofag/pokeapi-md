# README

Application developed with Ruby version 2.7.2 and Rails 6.1.3.1

Please run ```bundle install```, ```rails db:migrate``` and ```rails db:seed``` before run the application

# Routes

List of all pokemon paginated:
- GET ```/pokemons```
- GET ```/pokemons?page[number]=2&page[size]=50```

Get a single pokemon by id:
- GET ```/pokemons/:id```

Get a list of pokemons related by their pokedex number:
- GET ```/pokemons/pokedex/:pokedex_number```

Create a pokemon:
- POST ```/pokemons```

Update a pokemon:
- PUT ```/pokemons/:id```
- PATCH ```/pokemons/:id```

Delete a pokemon
- DELETE ```/pokemons/:id```

# Unit Tests
Unit tests where written using Rspec, execute one of the following commands

To execute all tests togheter:
```rspec```

To execute model tests only:
```rspec spec/models/pokemon_spec.rb```

To execute requests tests only:
```rspec spec/requests/pokemons_spec.rb```

To execute routing tests only:
```rspec spec/routing/pokemons_spec.rb```
