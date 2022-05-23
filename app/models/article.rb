# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 140 }

  max_paginates_per 5
end
