class Api::V1::RequestsController < ApplicationController
			
	def index
		requests = Request.order('created_at DESC');
		render json: {status: 'SUCCESS', message:'Loaded requests', data:requests}, status: :ok
	end

	def show
		request = Request.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded request', data:request}, status: :ok
	end

	def create
		request = Request.create(request_params)

		if request.save
			render json: {status: 'SUCCESS', message:'Saved request', data:request}, status: :ok
		else
			render json: {status: 'ERROR', message:'Request not saved', data:request.errors}, status: :unprocessable_entity
		end
	end

	def destroy
		request = Request.find(params[:id])
		request.destroy
		render json: {status: 'SUCCESS', message:'Deleted request', data:request}, status: :ok
	end

	# def update
	# 	request = Request.find(params[:id])

	# 	if request.update_attributes(request_params)
	# 		render json: {status: 'SUCCESS', message:'Updated request', data:request}, status: :ok
	# 	else
	# 		render json: {status: 'ERROR', message:'Request not updated', data:request}, status: :unprocessable_entity
	# 	end
	# end

	private

	def request_params
		params.permit(:request_accepted)
	end
		
end