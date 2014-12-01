class StreamsController < ApplicationController

  def new
    @stream = Stream.new
    create
  end
  
  def edit
    @stream = Stream.find(params[:id])
  end

  def index
    # @streams= Stream.all
    @streams = Stream.find(params[:id])
    redirect_to edit_stream_path(:stream)
  end

  def update
    
    @stream = Stream.find(params[:id])
    if @stream.update_attributes(stream_params2)
      redirect_to user_path(@stream.user_id)
    else
      render 'edit'
    end
  end

  def create

    @user_id = current_user.id
    @stream = Stream.new(stream_params1)
    if @stream.save
      redirect_to edit_stream_path(@stream)
    else
      redirect_to :back
    end
  end

  def destroy
    @stream = Stream.find(params[:stream])
    @stream.destroy
    redirect_to(:back)
  end
  
  
  private

  def stream_params
    params.require(:stream).permit(:name, :user_id)
  end

  def stream_params2
    params.require(:stream).permit(:url)
  end
end