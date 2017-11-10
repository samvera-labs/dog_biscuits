# frozen_string_literal: true

FactoryBot.define do
  factory :depositor, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
  end
end
