class HomePicturesController < ApplicationController
  # GET /home_pictures
  # GET /home_pictures.json
  def index
    @home_pictures = HomePicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @home_pictures }
    end
  end

  # GET /home_pictures/1
  # GET /home_pictures/1.json
  def show
    @home_picture = HomePicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home_picture }
    end
  end

  # GET /home_pictures/new
  # GET /home_pictures/new.json
  def new
    @home_picture = HomePicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home_picture }
    end
  end

  # GET /home_pictures/1/edit
  def edit
    @home_picture = HomePicture.find(params[:id])
  end

  # POST /home_pictures
  # POST /home_pictures.json
  def create
    @home_picture = HomePicture.create(params[:home_picture])

    respond_to do |format|
      if @home_picture.save
        format.html { redirect_to @home_picture, notice: 'Home picture was successfully created.' }
        format.json { render json: @home_picture, status: :created, location: @home_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @home_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /home_pictures/1
  # PUT /home_pictures/1.json
  def update
    @home_picture = HomePicture.find(params[:id])

    respond_to do |format|
      if @home_picture.update_attributes(params[:home_picture])
        format.html { redirect_to @home_picture, notice: 'Home picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_pictures/1
  # DELETE /home_pictures/1.json
  def destroy
    @home_picture = HomePicture.find(params[:id])
    @home_picture.destroy

    respond_to do |format|
      format.html { redirect_to home_pictures_url }
      format.json { head :no_content }
    end
  end
end
