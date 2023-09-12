class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ edit update destroy ]

  # GET /subjects or /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subjects_path, notice: "Subject was successfully created."
    else
      redirect_to new_subject_path, alert: "Subject was not created."
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: "Subject was successfully updated."
    else
      redirect_to edit_subject_path, alert: "Subject was not updated."
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy

    redirect_to subjects_url, notice: "Subject was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :evaluation, :unit_value)
    end
end
