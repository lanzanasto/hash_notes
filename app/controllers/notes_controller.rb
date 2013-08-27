class NotesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_note, :only => [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index

    if params[:search] && params[:search] != ""
      @notes = Note.search params[:search], :order => :updated_at, :sort_mode => :desc, :with => {:user_id => current_user.id}
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

    save_tags @note.content

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    update_tags @note.content, params[:note]["content"]

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    destroy_tags @note.content

    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def save_tags content
    tags = Note.extract_tags content
    tags.each do |tag|
      hash_tags = HashTag.where(:tag => tag, :user_id => current_user.id)
      if hash_tags.empty?
        create_tag tag
      else
        hash_tags.first.count += 1
        hash_tags.first.save!
      end
    end
  end

  def destroy_tags content
    tags = Note.extract_tags content
    tags.each do |tag|
      hash_tags = HashTag.where(:tag => tag, :user_id => current_user.id)
      unless hash_tags.empty?
        hash_tag = hash_tags.first
        hash_tag.count -= 1
        if hash_tag.count <= 0
          hash_tag.destroy
        else
          hash_tag.save!
        end
      end
    end
  end

  def update_tags original_content, content
    destroy_tags original_content
    save_tags content
  end

  def create_tag tag
    hash_tag = HashTag.create(:tag => tag)
    hash_tag.count = 1
    hash_tag.user = current_user
    hash_tag.save!
  end

end
