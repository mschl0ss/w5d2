# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :url, :content, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  has_many :comments
end
