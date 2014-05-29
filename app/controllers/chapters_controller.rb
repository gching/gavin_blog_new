class ChaptersController < ApplicationController

	## Helps direct it to the right chapter through it's slug.
	before_filter :find_chapter, only: [:show, :edit, :update, :destroy]
	def index
		@chapters = Chapter.all
	end

	def show
	end

	def new
		@chapter = Chapter.new
	end

	def create
		@chapter = Chapter.new(permitted_params.chapter)
		if @chapter.save
			redirect_to chapter_path(@chapter)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @chapter.update_attributes(permitted_params.chapter)
			redirect_to chapter_path(@chapter)
		else
			render 'edit'
		end
	end

	def destroy
		@chapter.destroy
		redirect_to root_path
	end

	## Provides feed for atom
	## Not conventional
	def feed
		@chapters = Chapter.all
	end


private
	## Finds the page by its slug
	def find_chapter
		@chapter = Chapter.find_by_slug!(params[:id])
	end
end
