class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @products = Product.all
    @styles = Style.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

private

  def project_params
    params.require(:project).permit(:product_id, :style_id, :name)
  end

end
