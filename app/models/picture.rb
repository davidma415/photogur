class Picture < ApplicationRecord
  belongs_to :user
  validates :title, length: {within: 3..20}
  validates :artist, :url, presence: true
  validates :url,
            uniqueness: true

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(year)
    Picture.where("created_at LIKE ?", "#{year}%")
  end

  def self.latest(num)
    Picture.order(created_at: :desc).limit(num)
  end
end
