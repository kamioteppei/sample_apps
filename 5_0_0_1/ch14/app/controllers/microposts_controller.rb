class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    #debugger
    @micropost = Micropost.find(params[:id])
    #https://github.com/stefankroes/ancestry
   @descendants = @micropost.descendants

  #  @descendants = @micropost.descendants.sort_by_ancestry
    #@microposts = @micropost
    #アクション名と同じテンプレートでレンダーされるはず
    #render "show"
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
