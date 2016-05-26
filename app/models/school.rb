class School < ActiveRecord::Base
	has_many :comments, as: :commentable
	has_many :ratings
	has_many :reviews
	mount_uploader :image, PictureUploader
	validates :name, presence: true, length: {minimum:6}
	validates_uniqueness_of :name, scope: [:address], message: "School already exists. Maybe Someone already beat you to adding this"

	scope :contains_name, ->(name) {where("name LIKE ?","%#{name}%")}

	geocoded_by :full_address
	after_validation :geocode

	def full_address
		[address, state].compact.join(',') #.compact removes nil arguments/ members from the array
	end

	def average_rating
  		ratings.sum(:score) / ratings.size
	end

	scope :between, -> (price1, price2) {where(fees: price1..price2).order('fees DESC')}

	CLASSES = ["Primary One", "Primary Two", "Primary Three", "Primary Four", "Primary Five", "Primary Six"]
end
