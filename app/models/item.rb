# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#

class Item < ApplicationRecord
  validates :name, presence: true
  validates :original_price, presence: true

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  def price
    return original_price unless has_discount

    original_price - (original_price * discount_percentage / 100)
  end

  def self.average_price
    items_prices = Item.all.map(&:price)
    items_prices.sum / items_prices.size.to_f
  end
end
