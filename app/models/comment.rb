class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :article
	validates_presence_of :user_id,:article_id,:body
	validates_numericality_of :user_id,:article_id
end
