class Article < ApplicationRecord
    validates :title, :description, :body, presence: true 
end
