class ArticlesController < ApplicationController
before_action :authenticate_user!, except: [:index,:show]
# before_action :check_is_admin, except: [:index,:show]
	def index
		@articles = Article.all

	end

	def new
		@article = Article.new
	end

	def create

		@article = Article.new(params[:article].permit(:title, :body, :published_date, category_ids:[]))
		@article.user_id = current_user.id
		if @article.save
			redirect_to @article
		else
			render action: "new"
		end
	end

	def show
		
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comments = Comment.all
		
	end

	def edit

		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article].permit(:title, :body, :published_date))
			redirect_to articles_path
		else
			render action: "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy(params[:article])
		redirect_to articles_path
	end
end
