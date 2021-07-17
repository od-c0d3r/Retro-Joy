module ArticlesHelper
  def img_if_not_existed(art)
    if art.image.attached?
      url_for(art.image)
    else
      asset_path 'logo.png'
    end
  end
end
