module MicropostsHelper

  def left_margin(micropost)
    #階層をインデックスを取得、ロートは０
    hierarchy = micropost.depth
    return hierarchy*20
  end
end
