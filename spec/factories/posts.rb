FactoryGirl.define do
  factory :post do
    title "MyString"
    subtitle "MyString"
    content "MyText"
    image { File.new(Rails.root.join('spec', 'fixtures', 'image.jpg')) }
  end
end
