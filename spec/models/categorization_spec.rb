# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  describe 'Model instantiation' do
    subject(:new_categorization) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:items_id).of_type(:integer) }
      it { is_expected.to have_db_column(:categories_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end
end
