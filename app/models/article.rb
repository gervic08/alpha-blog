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

  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 140 }
end
