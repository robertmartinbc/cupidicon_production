class AssignmentsController < ApplicationController
  def index
  	@assignments = Assignment.all
  end

  def show
  	@assignment = Assignment.find(params[:id])
  end

  def new
  	@assignments = Assignment.new
  end

  def create
  @assignment = current_user.posts.build(params[:assignment])
  if @assignment.save
    flash[:notice] = "Assignment was saved."
    redirect_to @assignment
  else
    flash[:error] = "There was an error saving the Assignment. Please try again."
    render :new
  end
end

  def edit
  	@assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      flash[:notice] = "Assignment was updated."
      redirect_to @assignment
    else
      flash[:error] = "There was an error saving the Assignment. Please try again."
      render :new
    end
  end
end
