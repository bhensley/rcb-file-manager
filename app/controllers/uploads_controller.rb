class UploadsController < ApplicationController
  before_action :authenticate_user!, :set_upload

  def index
    unless @upload.nil?
      @upload.downloaded = true
    else
      @upload = Upload.new(title: params[:title], downloaded: true)
    end

    @upload.save

    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find_by_title(params[:title])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.fetch(:upload, {}).permit(:title, :downloaded)
    end
end
