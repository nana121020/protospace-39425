class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :update]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to prototype_path(@prototype)
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    unless current_user == @prototype.user
      redirect_to root_path, alert: "他のユーザーのプロトタイプは編集できません。"
    end
  end

  def update
    if current_user == @prototype.user && @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: "プロトタイプが正常に更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if current_user == @prototype.user
      @prototype.destroy
      redirect_to root_path, notice: "プロトタイプが削除されました。"
    else
      redirect_to root_path, alert: "他のユーザーのプロトタイプは削除できません。"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end
