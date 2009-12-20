class MyPicturesController < ApplicationController
  def index
    @my_pictures = MyPicture.all
  end
  
  def show
    @my_picture = MyPicture.find(params[:id])
  end
  
  def new
    @my_picture = MyPicture.new
  end
  
  def create
    @my_picture = MyPicture.new(params[:my_picture])
    if @my_picture.save
      flash[:notice] = "Successfully created my picture."
      redirect_to @my_picture
    else
      render :action => 'new'
    end
  end
  
  def edit
    @my_picture = MyPicture.find(params[:id])
  end
  
  def update
    @my_picture = MyPicture.find(params[:id])
    if @my_picture.update_attributes(params[:my_picture])
      flash[:notice] = "Successfully updated my picture."
      redirect_to @my_picture
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @my_picture = MyPicture.find(params[:id])
    @my_picture.destroy
    flash[:notice] = "Successfully destroyed my picture."
    redirect_to my_pictures_url
  end
end
