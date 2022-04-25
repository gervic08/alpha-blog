# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 140 }
end