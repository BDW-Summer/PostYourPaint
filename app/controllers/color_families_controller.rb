class ColorFamiliesController < ApplicationController
  # GET /color_families
  # GET /color_families.json
  def index
    @color_families = ColorFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @color_families }
    end
  end

  # GET /color_families/1
  # GET /color_families/1.json
  def show
    @color_family = ColorFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color_family }
    end
  end

  # GET /color_families/new
  # GET /color_families/new.json
  def new
    @color_family = ColorFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color_family }
    end
  end

  # GET /color_families/1/edit
  def edit
    @color_family = ColorFamily.find(params[:id])
  end

  # POST /color_families
  # POST /color_families.json
  def create
    @color_family = ColorFamily.new(params[:color_family])

    respond_to do |format|
      if @color_family.save
        format.html { redirect_to @color_family, notice: 'Color family was successfully created.' }
        format.json { render json: @color_family, status: :created, location: @color_family }
      else
        format.html { render action: "new" }
        format.json { render json: @color_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /color_families/1
  # PUT /color_families/1.json
  def update
    @color_family = ColorFamily.find(params[:id])

    respond_to do |format|
      if @color_family.update_attributes(params[:color_family])
        format.html { redirect_to @color_family, notice: 'Color family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_families/1
  # DELETE /color_families/1.json
  def destroy
    @color_family = ColorFamily.find(params[:id])
    @color_family.destroy

    respond_to do |format|
      format.html { redirect_to color_families_url }
      format.json { head :no_content }
    end
  end
end
