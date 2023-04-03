require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'GET /api/v1/pokemons' do
    before do
      FactoryBot.create_list(:pokemon, 10)
      get '/api/v1/pokemons'
    end

    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/pokemons/:id' do
    let!(:my_pokemon) { FactoryBot.create(:pokemon) }

    before do
      get "/api/v1/pokemons/#{my_pokemon.id}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the name' do
      expect(json['name']).to eq(my_pokemon.name)
    end
  end
end