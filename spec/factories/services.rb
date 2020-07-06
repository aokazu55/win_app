FactoryBot.define do
  factory :service do
    main_service { "MyString" }
    service_detail { "MyString" }
    service_name { "MyString" }
    image_id { "MyString" }
    confidence_level { "MyString" }
    price { 1 }
    working_time { "MyString" }
    period_start { "2020-07-06" }
    period_end { "2020-07-06" }
    remark { "MyText" }
    transportation_expenses { "MyString" }
    user { nil }
  end
end
