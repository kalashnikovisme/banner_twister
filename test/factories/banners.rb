FactoryGirl.define do
  factory :banner do
    url
    count { generate :integer }
  end
end
