# frozen_string_literal: true

class Categorization < ApplicationRecord
  belongs_to :items
  belongs_to :categories
end
