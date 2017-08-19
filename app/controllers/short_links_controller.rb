class ShortLinksController < ApplicationController
  def handleSlug
    @short_link = ShortLink.find_by(slug: params[:slug])

    redirect_to @short_link.destination
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    @short_link = ShortLink.new(request_params)
    @short_link.slug = hash_destination(@short_link.destination)

    if @short_link.save!
      redirect_to @short_link
    else
      render 'new'
    end

  rescue ActiveRecord::RecordInvalid => exception
    render 'new'
  rescue SlugAlreadyTaken => exception
    handleExistingSlug(@short_link.slug)
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

    def handleExistingSlug(slug)
      @short_link = ShortLink.find_by(slug: slug)

      redirect_to @short_link
    end
end
