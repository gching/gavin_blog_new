class ChaptersController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	## Removed as rails admin overides it.
=begin
	def create
		@chapter = Chapter.new(permitted_params.chapter)
		if @chapter.save
			redirect_to chapter_path(@chapter)
		else
			render 'new'
		end
	end
=end

	def edit
	end

	def update
		if chapter.update_attributes(permitted_params.chapter)
			redirect_to chapter_path(chapter)
		else
			render 'edit'
		end
	end

	def destroy
		chapter.destroy
		redirect_to root_path
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
