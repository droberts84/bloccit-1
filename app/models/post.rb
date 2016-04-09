class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :destroy, as: :commentable
  belongs_to :user
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  default_scope { order('created_at DESC') }

  scope :ordered_by_title, -> {order('title ASC')}
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
end
