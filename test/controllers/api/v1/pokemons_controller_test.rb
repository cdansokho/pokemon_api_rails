require "test_helper"

class Api::V1::PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_pokemons_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_pokemons_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_pokemons_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_pokemons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_pokemons_destroy_url
    assert_response :success
  end
end
