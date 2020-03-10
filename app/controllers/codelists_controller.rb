class CodelistsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: :destroy

  def index
    @codelists = Codelist.paginate(page: params[:page])
  end

  def show
    @codelist = Codelist.find(params[:id])
  end

  def new
    @codelist = Codelist.new
  end

  def create
    @codelist = current_user.codelists.build(codelist_params)
    if @codelist.save
      flash[:success] = "アイテムの登録が完了しました。"
      redirect_to @codelist
    else
      render 'new'
    end
  end

  def edit
    @codelist = Codelist.find(params[:id])
  end

  def update
    @codelist = Codelist.find(params[:id])
    if @codelist.update_attributes(codelist_params)
      flash[:success] = "アイテムの更新が完了しました。"
      redirect_to @codelist
    else
      render 'edit'
    end
  end

  def destroy
    @codelist.destroy
    flash[:success] = "アイテムを削除しました。"
    redirect_to codelists_url
  end

  private

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
      @codelist = current_user.codelists.find_by(id: params[:id])
      redirect_to root_url if @codelist.nil?
    end

    def codelist_params
      params.require(:codelist).permit(:title, :content, :url,:password_digest, :picture)
    end
end
