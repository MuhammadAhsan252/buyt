class ProjectsController < ApplicationController
    before_action :set_project, only: [ :edit, :update, :destroy ]
    before_action :authenticate_seller!
    before_action :set_seller

    # GET /projects/new
    def new
      @project = Project.new
    end

    # POST /projects
    def create
      @project = Project.new(project_params)
      @project.seller = @seller
      if @project.save
        redirect_to seller_url(@seller), notice: "Project added successfully."
      else
        render :new
      end
    end

    # GET /projects/:id/edit
    def edit
    end

    # PATCH/PUT /projects/:id
    def update
      if @project.update(project_params)
        redirect_to seller_url(@seller), notice: "Project updated successfully."
      else
        render :edit
      end
    end

    # DELETE /projects/:id
    def destroy
      @project.destroy
      redirect_to seller_url(@seller), notice: "Project deleted successfully."
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :details, :link)
    end

    def set_seller
      @seller = Seller.find(params[:seller_id])
      unless current_seller == @seller
          redirect_to root_path, alert: "You are not authorized to manage projects for this seller."
      end
    end
end
