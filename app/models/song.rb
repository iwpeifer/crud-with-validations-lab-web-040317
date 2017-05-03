class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :released, inclusion: {in: [true, false]}
	validates :title,  uniqueness: {scope: [:release_year, :artist_name]}
	with_options if: :released? do |release|
		release.validates :release_year, presence: true
		release.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
	end

end

# title, a string
# Must not be blank
# Cannot be repeated by the same artist in the same year
# released, a boolean describing whether the song was ever officially released.
# Must be true or false
# release_year, an integer
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre, a string
# REQUIREMENTS
# Use the resource generator, not the scaffold generator.
# Define a model with validations for Song.
# Define all RESTful routes for songs.
# Build views that connect to each other using route helpers.
# Use form_for to build forms with pre-fill and error list features. (Hint: Try using a partial to cut down on copypasting!)