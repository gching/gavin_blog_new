class Chapter < ActiveRecord::Base

	## Make sure that title, body, and slug exist.
	validates_presence_of :title, :body, :slug

	## Makes sure that slug unique and not admin
	validates :slug, uniqueness: true, exclusion: {in: %w(admin)}

	before_validation :generate_slug



	## Finds the  next chapter if it exists
	def next
		self.class.find(:first,
			:conditions => ['id > ?', self.id],
			:order => 'id')
	end

	## Finds the previous chapter if it exists
	def previous
		self.class.find(:first,
			:conditions => ['id < ?', self.id],
			:order => 'id desc')

	end


	## Finds a random chapter
	def random_chapter
		rand_id = rand(self.class.count)+1
		while rand_id == self.id
			rand_id = rand(self.class.count)
		end
		#rand_id = rand(Model.count)
	    self.class.first(:conditions => [ "id >= ?", rand_id])

	 	#Model.first(:conditions => [ "id >= ?", rand_id])

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
