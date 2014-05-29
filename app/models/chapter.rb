class Chapter < ActiveRecord::Base

	## Make sure that title, body, and slug exist.
	validates_presence_of :title, :body, :slug

	## Makes sure that slug unique and not admin
	validates :slug, uniqueness: true, exclusion: {in: %w(admin)}

	before_validation :generate_slug



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
		rand_id = rand(Chapter.count)+1
		while rand_id == self.id
			rand_id = rand(Chapter.count)+1
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
