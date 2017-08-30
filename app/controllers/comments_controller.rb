class CommentsController < ApplicationController
  before_action :authenticate_user!
# before_action :check_is_admin, except: [:index,:show]


def index
@comments = Comment.all

end

def create
@comment = Comment.new(params[:comment].permit(:user_id,:article_id,:body))
@comment.user_id = current_user.id
@comment.save
# Notification.comment_confirmation(@comment).deliver!
	redirect_to article_path(@comment.article), notice: "Successfully added the comment"

end

end
