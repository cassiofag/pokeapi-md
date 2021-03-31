require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe '#validations' do
    let(:pokemon) { build(:pokemon) }

    it 'test pokemon object' do
      expect(pokemon).to be_valid
    end

    it 'has an invalid pokedex_number - can\'t be blank' do
      pokemon.pokedex_number = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:pokedex_number]).to include("can't be blank")
    end

    it 'has an invalid pokedex_number - is not a number' do
      pokemon.pokedex_number = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:pokedex_number]).to include("is not a number")
    end

    it 'has an invalid pokedex_number - must be greater than 0' do
      pokemon.pokedex_number = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:pokedex_number]).to include("must be greater than 0")
    end

    it 'has an invalid name - can\'t be blank' do
      pokemon.name = ''
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:name]).to include("can't be blank")
    end

    it 'validate the uniqueness of the name' do
      pokemon1 = FactoryBot.create(:pokemon)
      expect(pokemon1).to be_valid

      pokemon2 = FactoryBot.build(:pokemon, name: pokemon1.name)
      expect(pokemon2).not_to be_valid
      expect(pokemon2.errors[:name]).to include("has already been taken")
    end

    it 'has an invalid type_1' do
      pokemon.type_1 = ''
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:type_1]).to include("can't be blank")
    end

    it 'has an invalid total - can\'t be blank' do
      pokemon.total = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:total]).to include("can't be blank")
    end

    it 'has an invalid total - is not a number' do
      pokemon.total = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:total]).to include("is not a number")
    end

    it 'has an invalid total - must be greater than 0' do
      pokemon.total = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:total]).to include("must be greater than 0")
    end

    it 'has an invalid hp - can\'t be blank' do
      pokemon.hp = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:hp]).to include("can't be blank")
    end

    it 'has an invalid hp - is not a number' do
      pokemon.hp = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:hp]).to include("is not a number")
    end

    it 'has an invalid hp - must be greater than 0' do
      pokemon.hp = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:hp]).to include("must be greater than 0")
    end

    it 'has an invalid attack - can\'t be blank' do
      pokemon.attack = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:attack]).to include("can't be blank")
    end

    it 'has an invalid attack - is not a number' do
      pokemon.attack = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:attack]).to include("is not a number")
    end

    it 'has an invalid attack - must be greater than 0' do
      pokemon.attack = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:attack]).to include("must be greater than 0")
    end

    it 'has an invalid defense - can\'t be blank' do
      pokemon.defense = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:defense]).to include("can't be blank")
    end

    it 'has an invalid defense - is not a number' do
      pokemon.defense = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:defense]).to include("is not a number")
    end

    it 'has an invalid defense - must be greater than 0' do
      pokemon.defense = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:defense]).to include("must be greater than 0")
    end

    it 'has an invalid sp_atk - can\'t be blank' do
      pokemon.sp_atk = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_atk]).to include("can't be blank")
    end

    it 'has an invalid sp_atk - is not a number' do
      pokemon.sp_atk = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_atk]).to include("is not a number")
    end

    it 'has an invalid sp_atk - must be greater than 0' do
      pokemon.sp_atk = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_atk]).to include("must be greater than 0")
    end

    it 'has an invalid sp_def - can\'t be blank' do
      pokemon.sp_def = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_def]).to include("can't be blank")
    end

    it 'has an invalid sp_def - is not a number' do
      pokemon.sp_def = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_def]).to include("is not a number")
    end

    it 'has an invalid sp_def - must be greater than 0' do
      pokemon.sp_def = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:sp_def]).to include("must be greater than 0")
    end

    it 'has an invalid speed - can\'t be blank' do
      pokemon.speed = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:speed]).to include("can't be blank")
    end

    it 'has an invalid speed - is not a number' do
      pokemon.speed = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:speed]).to include("is not a number")
    end

    it 'has an invalid speed - must be greater than 0' do
      pokemon.speed = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:speed]).to include("must be greater than 0")
    end

    it 'has an invalid generation - can\'t be blank' do
      pokemon.generation = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:generation]).to include("can't be blank")
    end

    it 'has an invalid generation - is not a number' do
      pokemon.generation = 'a'
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:generation]).to include("is not a number")
    end

    it 'has an invalid generation - must be greater than 0' do
      pokemon.generation = 0
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:generation]).to include("must be greater than 0")
    end

    it 'has an invalid legendary' do
      pokemon.legendary = nil
      expect(pokemon).not_to be_valid
      expect(pokemon.errors[:legendary]).to include("is not included in the list")
    end
  end
end
