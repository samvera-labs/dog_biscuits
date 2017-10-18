# frozen_string_literal: true

FactoryGirl.define do
  factory :depositor, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
  end
end
