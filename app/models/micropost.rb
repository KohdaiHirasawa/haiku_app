class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  validates :picture,presence: true
  mount_uploader :picture, PictureUploader

    def iine(user)
      likes.create(user_id: user.id)
    end

    def uniine(user)
      likes.find_by(user_id: user.id).destroy
    end

    def iine?(user)
      iine_users.include?(user)
    end

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
