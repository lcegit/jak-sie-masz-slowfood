require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :reset_password_token }
    it { is_expected.to have_db_column :reset_password_sent_at }
    it { is_expected.to have_db_column :remember_created_at }
    it { is_expected.to have_db_column :sign_in_count }
    it { is_expected.to have_db_column :current_sign_in_at }
    it { is_expected.to have_db_column :last_sign_in_at }
    it { is_expected.to have_db_column :current_sign_in_ip }
    it { is_expected.to have_db_column :last_sign_in_ip }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.not_to allow_value('hey').for :password }
    it { is_expected.not_to allow_value('hey@').for :email }
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end
end
