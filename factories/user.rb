# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "factory@#{SecureRandom.hex(16)}.com" }
    confirmed_at { Time.zone.now }
    password_digest { SecureRandom.hex(16) }

    trait :unconfirmed do
      confirmed_at { nil }
      unconfirmed_email { "factory@#{SecureRandom.hex(16)}.com" }
    end
  end
end
