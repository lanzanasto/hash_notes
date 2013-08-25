class HashTagsController < ApplicationController
  before_filter :authenticate_user!

  # GET /hash_tags
  # GET /hash_tags.json
  def index
    @hash_tags = HashTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hash_tags }
    end
  end

  # GET /hash_tags/1
  # GET /hash_tags/1.json
  def show
    @hash_tag = HashTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hash_tag }
    end
  end

  # GET /hash_tags/new
  # GET /hash_tags/new.json
  def new
    @hash_tag = HashTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hash_tag }
    end
  end

  # GET /hash_tags/1/edit
  def edit
    @hash_tag = HashTag.find(params[:id])
  end

  # POST /hash_tags
  # POST /hash_tags.json
  def create
    @hash_tag = HashTag.new(params[:hash_tag])

    respond_to do |format|
      if @hash_tag.save
        format.html { redirect_to @hash_tag, notice: 'Hash tag was successfully created.' }
        format.json { render json: @hash_tag, status: :created, location: @hash_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @hash_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hash_tags/1
  # PUT /hash_tags/1.json
  def update
    @hash_tag = HashTag.find(params[:id])

    respond_to do |format|
      if @hash_tag.update_attributes(params[:hash_tag])
        format.html { redirect_to @hash_tag, notice: 'Hash tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hash_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hash_tags/1
  # DELETE /hash_tags/1.json
  def destroy
    @hash_tag = HashTag.find(params[:id])
    @hash_tag.destroy

    respond_to do |format|
      format.html { redirect_to hash_tags_url }
      format.json { head :no_content }
    end
  end
end
