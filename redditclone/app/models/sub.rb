# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord

  validates :title, :description, :mod_id, presence: true

  belongs_to :moderator,
    foreign_key: :mod_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs
end
