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

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Model instantiation' do
    subject(:new_item) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:original_price).of_type(:float).with_options(null: false) }
      it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:discount_percentage).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  describe 'Price' do
    context 'when the item has a discount' do
      let(:item) { build(:item_with_discount, original_price: 100.00, discount_percentage: 20) }

      it { expect(item.price).to eq(80.00) }
    end

    context 'when the item does not have a discount' do
      let(:item) { build(:item_without_discount, original_price: 100.00) }

      it { expect(item.price).to eq(100.00) }
    end
  end

  describe 'Item' do
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_many(:categorizations) }

    it 'is invalid if there is no name' do
      item = Item.new(original_price: 5, has_discount: false, discount_percentage: nil)
      expect(item.valid?).to eq false
    end

    context 'when the item has no original price' do
      let(:item) { build(:item_without_original_price) }

      it 'is invalid if there is no original price' do
        expect(item.valid?).to eq(false)
      end
    end
  end
end
