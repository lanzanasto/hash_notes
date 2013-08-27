class NotesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_note, :only => [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @note = Note.new

    if params[:search] && params[:search] != ""
      @notes = Note.search params[:search], :with => {:user_id => current_user.id}
    else
      @notes = current_user.notes
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { respond_with_bip(@note) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@note) }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
      format.js { render :nothing => true }
    end
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

end
