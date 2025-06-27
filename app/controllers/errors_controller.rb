class ErrorsController < ApplicationController
  VALID_STATUS_CODES = %w[400 404 406 422 500]

  def error_page
    status_code = VALID_STATUS_CODES.include?(params[:code]) ? params[:code] : "500"
    respond_to do |format|
      format.html { render "error_page", status: status_code }
      format.any  { head status_code }
    end
  end
end
