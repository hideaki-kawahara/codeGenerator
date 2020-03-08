class CodelistsController < ApplicationController
  def index
    @codelists = Codelist.paginate(page: params[:page])
  end

  def show
    @codelist = Codelist.find(params[:id])
  end
end
