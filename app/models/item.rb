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
#

class Item < ApplicationRecord
  def price
    price = original_price - (original_price * discount_percentage / 100)
    return price
    unless has_discount == false
      return original_price
    end
  end

  def self.average_price
    items_prices = Item.all.map(&:price)
    return items_prices.sum / items_prices.size.to_f
  end
end
