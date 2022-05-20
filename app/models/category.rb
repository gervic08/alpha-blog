# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 3, maximum: 20}
end
