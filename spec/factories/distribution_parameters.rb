# frozen_string_literal: true

FactoryBot.define do
  factory :distribution_parameter do
    name { 'MyString' }
    symbol { 'MyString' }
    uppercase { false }
    meaning { 'MyString' }
  end
end
