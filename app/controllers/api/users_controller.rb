module Api
	class UsersController < Api::BaseController

		private

			def user_params
				params.require(:user).permit(:username)
			end

			def query_params
				params.permit(:username)
			end
		end
	end