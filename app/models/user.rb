# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions, dependent: :destroy
  has_many :transaction_records, dependent: :destroy

  validates :avatar, attached: false

  enum user_type: { buyer: 0, admin: 1 }
end
