class PokemonSerializer
  include JSONAPI::Serializer
  attributes :pokedex_number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary
end
