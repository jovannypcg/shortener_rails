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

    if @short_link.save
      redirect_to @short_link
    else
      render 'new'
    end
  end

  def show
    @short_link = ShortLink.find(params[:id])
  end

  private
    def request_params
      params.require(:short_link).permit(:destination)
    end

    def hash_destination(dest)
      Digest::CRC32.hexdigest(dest)
    end
end
