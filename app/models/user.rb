# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  source     :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :zip, presence: true
  validates :zip, numericality: { only_integer: true }
end
