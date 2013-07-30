class AssignmentsController < ApplicationController
  def index
  	@assignments = Assignment.all


  end

  def show
  	@assignment = Assignment.find(params[:id])
    @assignment.review 
    # Change the current user's state
    @assignment.transactions.create(transaction_type: "review", writer_id: @assignment.user_id)

  end

  def new
  	@assignments = Assignment.new
    authorize! :create, Assignment, message: "You need to be a member to create a new assignment."
  end

  def create
  @assignment = current_user.assignments.build(params[:assignment])
  authorize! :create, @assignment, message: "You need to be signed up to do that."
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
    authorize! :edit, @assignment, message: "You need to own the assignment to edit it."
  end

  def update
    @assignment = Assignment.find(params[:id])
    authorize! :edit, @assignment, message: "You need to own the assignment to edit it."
    if @assignment.update_attributes(params[:assignment])
      flash[:notice] = "Assignment was updated."
      redirect_to @assignment
    else
      flash[:error] = "There was an error saving the Assignment. Please try again."
      render :new
    end
  end

  def renew
    @assignment = Assignment.find(params[:id])
    @assignment.renew
    redirect_to "/assignments"
  end

  def write  
    @assignment = Assignment.find(params[:id])
    @assignment.write        
  end

  def cancel
    @assignment = Assignment.find(params[:id])
    if @assignment.cancel
      flash[:notice] = "You can only review this assignment 1 more time."
      redirect_to "/assignments"
    else
      flash[:error] = "Something went wrong."
      redirect_to "/assignments"
    end
  end


  def authorize
    @assignment = Assignment.find(params[:id])
    @assignment.authorize
   
  end
 
  def published
    @assignment = Assignment.find(params[:id])
    @assignment.published
  end

  def reject
    @assignment = Assignment.find(params[:id])
    @assignment.reject
    redirect_to "/assignments"
  end

  def revision
    @assignment = Assignment.find(params[:id])
    @assignment.revision
  end

  def resubmit
    @assignment = Assignment.find(params[:id])
    @assignment.resubmit
  end

  def resubmission
    @assignment = Assignment.find(params[:id])
    @assignments.resubmission
  end

def hide
    @assignment = Assignment.find(params[:id])
    @assignnments.hide
  end

end
