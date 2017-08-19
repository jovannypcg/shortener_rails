module ShortLinksHelper
  def slug_info(slug)
    content_tag(:section, class: "card") do
      content_tag(:h3, 'Your shorter link') +
      content_tag(:a, full_url(slug), href: full_url(slug))
    end
  end

  private
    def full_url(slug)
      "http://#{request.host_with_port}/#{slug}"
    end
end
