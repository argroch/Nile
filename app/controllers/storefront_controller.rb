class StorefrontController < ApplicationController
  before_action :set_storefront, only: [:show, :edit, :update, :destroy]

  # GET /storefronts
  # GET /storefronts.json
  def index
    @storefronts = Storefront.all
  end

  # GET /storefronts/1
  # GET /storefronts/1.json
  def show
  end

  # GET /storefronts/new
  def new
    @storefront = Storefront.new
  end

  # GET /storefronts/1/edit
  def edit
  end

  # POST /storefronts
  # POST /storefronts.json
  def create
    @storefront = Storefront.new(storefront_params)

    respond_to do |format|
      if @storefront.save
        format.html { redirect_to @storefront, notice: 'Storefront was successfully created.' }
        format.json { render action: 'show', status: :created, location: @storefront }
      else
        format.html { render action: 'new' }
        format.json { render json: @storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storefronts/1
  # PATCH/PUT /storefronts/1.json
  def update
    respond_to do |format|
      if @storefront.update(storefront_params)
        format.html { redirect_to @storefront, notice: 'Storefront was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storefronts/1
  # DELETE /storefronts/1.json
  def destroy
    @storefront.destroy
    respond_to do |format|
      format.html { redirect_to storefronts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storefront
      @storefront = Storefront.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storefront_params
      params[:storefront]
    end
end
