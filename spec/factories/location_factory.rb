FactoryBot.define do
  factory :location, class: 'Location' do
    sequence(:id){ |n| n }
    lat {'51.5073'}
    lon {'-0.1276'}
    name { 'London' }
  end
end
