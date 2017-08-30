class Article < ActiveRecord::Base
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments
	validates_presence_of :title, :body, :published_date

end
