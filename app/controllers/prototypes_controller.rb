class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # Prototype.create(prototype_params)
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    # else
    #   render :show
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,  :image).merge(user_id: current_user.id)
  end

end
