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
- All mandatory attributes need to be sent:
```
{
    "data": {
        "attributes": {
            "pokedex_number": 9999,
            "name": "MissingNo",
            "type_1": "Normal",
            "type_2": "Psychic",
            "total": 300,
            "hp": 50,
            "attack": 50,
            "defense": 50,
            "sp_atk": 50,
            "sp_def": 50,
            "speed": 50,
            "generation": 1,
            "legendary": true
        }
    }
}
```

Update a pokemon:
- PUT ```/pokemons/:id```
- PATCH ```/pokemons/:id```
- Only the attributes that will be updated need to be sent:
```
{
    "data": {
        "attributes": {
            "pokedex_number": 9999,
            "name": "MissingNo",
            "type_1": "Normal",
            "type_2": "Water"
        }
    }
}
```

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
