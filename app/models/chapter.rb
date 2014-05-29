class Chapter < ActiveRecord::Base

validates_presence_of :title, :body

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



end
