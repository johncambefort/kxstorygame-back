# frozen_string_literal: true

FactoryBot.define do
  factory :poem do
    lines { 'the little brown fox jumped over the moon' }
    users { [FactoryBot.create(:user)] }
  end
end
