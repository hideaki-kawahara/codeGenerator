class CodelistsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def index
    @codelists = Codelist.paginate(page: params[:page])
  end

  def show
    @codelist = Codelist.find(params[:id])
  end

  def destroy
    @codelist.destroy
    flash[:success] = "アイテムを削除しました。"
    redirect_to codelists_url
  end

  private

    def correct_user
      @codelist = current_user.codelists.find_by(id: params[:id])
      redirect_to root_url if @codelist.nil?
    end
end
