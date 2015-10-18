class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)	
	end

	def new	
		@project = Project.new	
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, notice: "Your Project was successfully saved!"
		else
			render 'new', notice: "Your article was unabled to be saved!"
		end
	end

	def show			
	end

	def edit		
	end

	def update
		if @project.update(project_params)
			redirect_to @project, notice: "Your udpdate was successful!"
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end
	
	private

	def find_project
		@project = Project.friendly.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :link, :slug)
	end
end
