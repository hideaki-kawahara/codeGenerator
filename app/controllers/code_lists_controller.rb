class CodeListsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: :destroy

  def index
    @code_lists = CodeList.paginate(page: params[:page])
  end

  def show
    @code_list = CodeList.find(params[:id])
    if logged_in?
      @exchange_list = ExchangeList.find_by(code_list_id: params[:id], user_id: current_user)
      if @exchange_list.nil?
        @exchange_list = current_user.exchange_lists.build
      end
    else
      @exchange_list = current_user.exchange_lists.build
    end
  end

  def new
    @code_list = CodeList.new
  end

  def create
    @code_list = current_user.code_lists.build(code_list_params)
    if @code_list.save
      flash[:success] = "アイテムの登録が完了しました。"
      redirect_to @code_list
    else
      render 'new'
    end
  end

  def edit
    @code_list = CodeList.find(params[:id])
  end

  def update
    @code_list = CodeList.find(params[:id])
    if @code_list.update_attributes(code_list_params)
      flash[:success] = "アイテムの更新が完了しました。"
      redirect_to @code_list
    else
      render 'edit'
    end
  end

  def destroy
    @code_list.destroy
    flash[:success] = "アイテムを削除しました。"
    redirect_to code_lists_url
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
      @code_list = current_user.code_lists.find_by(id: params[:id])
      redirect_to root_url if @code_list.nil?
    end

    def code_list_params
      params.require(:code_list).permit(:title, :content, :url,:password_digest, :picture)
    end
end
