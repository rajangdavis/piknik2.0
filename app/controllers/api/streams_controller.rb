module Api
	class StreamsController < Api::BaseController

		private

		  def stream_params1
		  	params.require(:stream).permit(:user_id, :name)
		  end

		  def stream_params2
		  	params.require(:stream).permit(:url)

		  def query_params
		  	params.permit(:user_id, :name, :url)
		  end
		end
	end



	