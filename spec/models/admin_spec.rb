# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Admin' do
    let(:admin) { build(:admin) }

    context "without password" do
      let(:admin) { build(:admin_without_password) }

      it "is not valid without password" do
        expect(:admin).to be_truthy
      end
    end

    context "with valid data"

    it "is valid with valid data" do
      expect(:admin).to be_truthy
    end
  end

  context "password of only 3 characters" do
    let(:admin) { build(:admin_with_short_password) }

    it "does'nt reach the min password length of 6 char" do
      expect(:admin).to be_truthy
    end
  end

  context "without email" do
    let(:admin) { build(:admin_without_email) }

    it "is not valid without an email" do
      expect(:admin).to be_truthy
    end
  end
end
