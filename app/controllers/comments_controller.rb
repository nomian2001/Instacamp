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

    def edit
        @comment = @photo.comments.find_by_id(params[:id])
    end

    def update
        @comment = @photo.comments.find_by_id(params[:id])
        @comment.update_attributes(comment_params)
        if @comment.save
          redirect_to @photo
        else
          render "edit"
        end
    end
    
    def show
        redirect_to root_path
    end
    
    def destroy
        @comment = @photo.comments.find_by_id(params[:id])
        @comment.destroy
        redirect_to root_path
    end
    
    def comment_params
        params.require(:comment).permit(:username, :body)
    end


    
end
