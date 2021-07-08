module ArticlesHelper

    def set_img_if_not_existed(art)
        if art.image.nil?
            image_tag('logo.png')
        else
            url_for(art.image)
        end
    end
end
