# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :description, :body, presence: true
end
