module Api
	class UsersController < Api::BaseController

		private

			def user_params
				params.require(:user).permit(:username, :password, :password_confirmation)
			end

			def query_params
				params.permit(:stream_id, :username)
			end
		end
	end