module Api
	class BaseController < ApplicationController
		protect_from_forgery with: :null_session
		before_action :set_resource, only: [:destroy, :show, :update]
		respond_to :json



	# POST /api/{plural_resource_name}
		def create
			set_resource(resource_class.new(resource_params))

			if get_resource.save
				render :show, status: :created
			else
				render json: get_resource.errors, status: :unprocessable_entity
			end
		end

	# DELETE /api/{plural_resource_name}/1
		def destroy
			get_resource.destroy
			head :no_content
		end

		def index
			plural_resource_name = "@#{resource_name.pluralize}"
			resources = resource_class.where(query_params)
										.page(page_params[:page])
										.per(page_params[:page_size])
			instance_variable_set(plural_resource_name, resources)
			respond_with instance_variable_get(plural_resource_name)
		end

	#GET /api/{plural_resource_name}/1
		def show
		respond_with get_resource
		end

	#PATCH/PUT /api/{plural_resource_name}/1
		def update
		  if get_resource.update(resource_params)
			render :show
		  else
		 	render json: get_resource.errors, status: :unprocessable_entity
		  end
		end


		private

		# get_resource: provides us with what would normally be our instance variable; eg @users or @streams, and returning us with its value.

		def get_resource
			instance_variable_get("@#{resource_name}")
		end

	 # Returns the allowed parameters for searching
      # Override this method in each API controller
      # to permit additional parameters to search on
      # @return [Hash]

      # query_params: acts mostly as a place holder to allow for quick extension of direct-matching queries on whitelisted attributes; anything past direct-matching requires custom logic.

		def query_params
			{}
		end
	  # Returns the allowed parameters for pagination
      # @return [Hash]

      # page_params: allows us to define permitted page-related parameters that will be inherited by all of our API controllers. Useful for allowing pagination of data.
		def page_params
			params.permit(:page, :page_size)
		end
	
	# resource_class: returns the class of the model that we are currently working with, it is infered from the controller’s name.
		
		def resource_class
			@resource_class ||=resource_name.classify.constantize
		end

    # The singular name for the resource class based on the controller
    # @return [String]
    # resource_name: is just the name of the resource that we’re referring to; same as resource_class but instead of the class User it is the string "user".

		def resource_name
			@resource_name ||=self.controller_name.singularize
		end
	# Only allow a trusted parameter "white list" through.
    # If a single resource is loaded for #create or #update,
    # then the controller for the resource must implement
    # the method "#{resource_name}_params" to limit permitted
    # parameters for the individual model.

    # resource_params: calls the resource specific params method of a child controller, eg stream_params.

		def resource_params
			@resource_params ||=self.send("#{resource_name}_params")
		end

    # set_resource: sets the instance variable that get_resource retrieves.

		def set_resource(resource = nil)
			resource ||= resource_class.find(params[:id])
			instance_variable_set("@#{resource_name}", resource)
		end

	end

end