# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  organization_id :bigint           not null
#  title           :string
#  name            :string
#  bio             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#
class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  belongs_to :organization

  validates(:email, uniqueness: { case_sensitive: false })
  validates(:email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email' })
end
