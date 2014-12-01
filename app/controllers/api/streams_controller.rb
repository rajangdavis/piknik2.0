module Api
	class StreamsController < Api::BaseController

		private

		  def stream_params
		  	params.require(:stream).permit(:user_id, :name)
		  end

		  def query_params
		  	params.permit(:user_id, :name)
		  end
		end
	end