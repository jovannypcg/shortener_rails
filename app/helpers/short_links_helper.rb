module ShortLinksHelper
  def slug_info(slug)
    content_tag(:section, class: "card") do
      content_tag(:h3, 'Your shorter link') +
      content_tag(:p, slug)
    end
  end
end
