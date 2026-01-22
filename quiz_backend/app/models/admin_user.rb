class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable

  validate :single_admin_user, on: :create

  private

  def single_admin_user
    if AdminUser.exists?
      errors.add(:base, "Only one admin user is allowed")
    end
  end
end