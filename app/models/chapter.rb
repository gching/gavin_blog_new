class Chapter < ActiveRecord::Base
	## Banner uploader
	mount_uploader :banner, BannerUploader

	## Make sure that title, body, and slug exist.
	validates_presence_of :title, :body, :slug

	## Makes sure that slug unique and not admin
	validates :slug, uniqueness: true, exclusion: {in: %w(admin)}

	before_validation :generate_slug


	## next, previous, and random_chapter are object methods as it requires
	## a given objects id to know the upcoming chapter object to return
	## To fix readibility, might make this into class method with current id passed.

	## Finds the  next chapter if it exists, if not, returns nil.
	def next
    Chapter.find_by id: self.id+1
	end

	## Finds the previous chapter if it exists, if not, returns nil.
	def previous
		Chapter.find_by id: self.id-1
	end


	## Finds a random chapter
	def random_chapter
		#rand_id = rand(Chapter.count)+1
		#puts rand_id
		## Pluck out ids (returns array of ids)
		chapter_ids = Chapter.pluck(:id)

		## Sample one of them
		rand_id = chapter_ids.sample
		## Keep doing it till its not the same
		while rand_id == self.id
			rand_id = chapter_ids.sample
		end

		Chapter.where("id >= ?", rand_id).first

	end

	## Overides current to_param to just include the title
	def to_param
		slug
	end

	## Generates slug - parameterized title.
	def generate_slug
		self.slug ||= title.parameterize unless title.nil?
	end



end
