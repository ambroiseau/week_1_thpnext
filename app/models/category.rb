# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :categorizations
  has_many :items, through: :categorizations
end
