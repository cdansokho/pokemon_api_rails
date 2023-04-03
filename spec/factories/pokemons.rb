FactoryBot.define do
  factory :pokemon do
    name { "Charizard" }
    type_1 { "Fire" }
    type_2 { "Flying" }
    total { 534 }
    hp { 78 }
    attack { 84 }
    defense { 78 }
    sp_atk { 109 }
    sp_def { 85 }
    speed { 100 }
    generation { 1 }
    legendary { false }
  end
end
