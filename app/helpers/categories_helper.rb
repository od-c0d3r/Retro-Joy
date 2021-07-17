module CategoriesHelper
  def even_arts?(arts, art)
    if art == arts.last && arts.count.odd?
      'ele-last-odd'
    else
      'ele-size'
    end
  end
end
