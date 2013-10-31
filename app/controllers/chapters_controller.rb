class ChaptersController < ApplicationController
	def index
		@chapters = Chapter.all
	end

	def show
		@chapter = Chapter.find(params[:id])
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
		@chapter = Chapter.find(params[:id])
	end

	def update
		@chapter = Chapter.find(params[:id])
		if @chapter.update_attributes(permitted_params.chapter)
			redirect_to chapter_path(@chapter)
		else
			render 'edit'
		end
	end

	def destroy
		@chapter = Chapter.find(params[:id])
		@chapter.destroy
		redirect_to root_path
	end

	## Provides feed for atom
	## Not conventional
	def feed
		@chapters = Chapter.all
	end

end