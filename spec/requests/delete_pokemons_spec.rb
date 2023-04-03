require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe "DELETE /api/v1/pokemons/" do
    let!(:pokemon) { FactoryBot.create(:pokemon) }

    before do
      delete "/api/v1/pokemons/#{pokemon.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end