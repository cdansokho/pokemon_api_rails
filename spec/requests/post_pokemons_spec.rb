require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'POST /api/v1/pokemons' do
    context 'with valid parameters' do
      let!(:my_pokemon) { FactoryBot.create(:pokemon) }

      before do
        post '/api/v1/pokemons', params: {
              "name": my_pokemon.name,
              "type_1": my_pokemon.type_1,
              "type_2": my_pokemon.type_2,
              "total": my_pokemon.total,
              "hp": my_pokemon.hp,
              "attack": my_pokemon.attack,
              "defense": my_pokemon.defense,
              "sp_atk": my_pokemon.sp_atk,
              "sp_def": my_pokemon.sp_def,
              "speed": my_pokemon.speed,
              "generation": my_pokemon.generation,
              "legendary": my_pokemon.legendary
            }
      end

      it 'returns the name' do
        expect(json['pokemon']['name']).to eq(my_pokemon.name)
      end

      it 'returns the attack' do
        expect(json['pokemon']['attack']).to eq(my_pokemon.attack)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end