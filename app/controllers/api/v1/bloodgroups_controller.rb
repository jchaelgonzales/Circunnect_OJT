module Api
	module V1
		class BloodgroupsController < ApplicationController
			
			def index
				bloodgroups = BloodGroup.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Loaded bloodgroups', data:bloodgroups}, status: :ok
			end

			def show
				bloodgroup = BloodGroup.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded bloodgroup', data:bloodgroup}, status: :ok
			end

			def create
				bloodgroup = bloodgroup.create(bloodgroup_params)

				if bloodgroup.save
					render json: {status: 'SUCCESS', message:'Saved bloodgroup', data:bloodgroup}, status: :ok
				else
					render json: {status: 'ERROR', message:'Bloodgroup not saved', data:bloodgroup.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				bloodgroup = Bloodgroup.find(params[:id])
				bloodgroup.destroy
				render json: {status: 'SUCCESS', message:'Deleted bloodgroup', data:bloodgroup}, status: :ok
			end

			def update
				bloodgroup = bloodgroup.find(params[:id])

				if bloodgroup.update_attributes(bloodgroup_params)
					render json: {status: 'SUCCESS', message:'Updated bloodgroup', data:bloodgroup}, status: :ok
				else
					render json: {status: 'ERROR', message:'Bloodgroup not updated', data:bloodgroup}, status: :ok
				end
			end

			private

			def bloodgroup_params
				params.permit(:blood_type)
			end
			
		end
	end
end