class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  validates :name, length: {minimum: 3}

  belongs_to :user

  def has_review(user)
  	reviews.find_by(user: user)
  end

end