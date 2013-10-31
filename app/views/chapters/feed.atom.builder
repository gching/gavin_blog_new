atom_feed do |feed|
	feed.title "Gavin Ching's Story"
	feed.updated @chapters.maximum(:updated_at)
	@chapters.each do |chapter|
		feed.entry chapter do |entry|
			entry.title "Chapter #{chapter.id} - #{chapter.title}"
			entry.content chapter.body
			entry.author do |author|
				author.name "Gavin Ching"
			end

		end

	end

end