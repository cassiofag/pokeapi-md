FactoryBot.define do
  factory :pokemon do
    pokedex_number { 1 }
    name { "Bulbassaur" }
    type_1 { "Grass" }
    type_2 { "Poison" }
    total { 320 }
    hp { 80 }
    attack { 40 }
    defense { 40 }
    sp_atk { 60 }
    sp_def { 60 }
    speed { 40 }
    generation { 1 }
    legendary { false }
  end
end
