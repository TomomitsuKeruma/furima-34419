FactoryBot.define do
  factory :purchase do
    postal_code    {"123-4456"}
    area_id        {2}
    municipalites  {"横浜市"}
    address        {"青山1-1"}
    phone_number   {"09012345678"}   
    token {"tok_abcdefghijk00000000000000000"}
    item_id {16}
    user_id {1}  

  end
end