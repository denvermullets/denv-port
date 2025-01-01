class UrlsController < ApplicationController
  before_action :set_url, only: %i[show edit update destroy]

  # GET /urls
  def index
    @urls = Url.all
  end

  # GET /urls/1
  def show; end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit; end

  # POST /urls
  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path, notice: 'Url was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      redirect_to root_path, notice: 'Url was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy!
    redirect_to root_path, notice: 'Url was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_url
    @url = Url.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def url_params
    params.fetch(:url, {})
  end
end
