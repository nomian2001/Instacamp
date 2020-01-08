class CommentsController < ApplicationController
    # POST /photos/:photo_id/comments
    def create
        #get photo_id from the nested route
        @photo = Photo.find params[:photo_id]
        # create a new comment from {"body" => "user comment"}
        @comment = @photo.comments.create(comment_params)
        # check if @comment saved successfully?
        if @comment.valid?
            redirect_to root_path, flash: {success: "Added comment."}
        else
            redirect_to root_path, flash: {error: "Cannot add comment"}
        end
    end

    def comment_params
        params.require(:comment).permit(:username, :body)
    end

    
end
