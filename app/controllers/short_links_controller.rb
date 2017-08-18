class ShortLinksController < ApplicationController
  def handleSlug
    render plain: "Handling slug..."
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    @short_link = ShortLink.new(request_params)
    @short_link.slug = hash_destination(@short_link.destination)

    binding.pry
  end

  private
    def request_params
      params.require(:short_link).permit(:destination)
    end

    def hash_destination(dest)
      Digest::CRC32.hexdigest(dest)
    end
end
