class ChaptersController < ApplicationController

	def index
	end

	def show
	end

	## Provides feed for atom
	## Not conventional
	def feed
	end


private
	## Get every chapter and cache it.
	def chapters
		@chapters ||= Chapter.all
	end
	helper_method :chapters

	## Finds the page by its slug and cache it.
	def chapter
		@chapter ||= Chapter.find_by_slug!(params[:id])
	end
	helper_method :chapter
end
