class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    #debugger
    @micropost = Micropost.find(params[:id])
    #miropostを再帰的にネストできるようにする
    #https://ruby-rails.hatenadiary.com/entry/20150216/1424092796
    @microposts_sorted = sort_as_tree(@micropost)
    #アクション名と同じテンプレートでレンダーされるはず
    #render "show"
  end

  def sort_as_tree(parent)
    result = [parent]
    parent.children.each do |child|
      #result.push(child)
      result.concat(sort_as_tree(child))
    end
    return result
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
