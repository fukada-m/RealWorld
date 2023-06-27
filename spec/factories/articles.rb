# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    slug { 'how-to-train-your-dragon' }
    title { 'How to train your dragon' }
    description { 'Ever wonder how?' }
    body { 'You have to believe' }
  end
end
