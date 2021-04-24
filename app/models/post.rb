# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  body            :text
#  user_id         :bigint           not null
#  organization_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :organization
end
