class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @upload = Upload.new(csv: upload_params)

    if @upload.save
      head :ok
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  private def upload_params
    params.fetch(:file, {})
  end
end
