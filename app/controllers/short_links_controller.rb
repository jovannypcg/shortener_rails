class ShortLinksController < ApplicationController
  def handleSlug
    @short_link = ShortLink.find_by(slug: params[:slug])

    count_visit(@short_link)
    redirect_to @short_link.destination
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    @short_link = ShortLink.new(request_params)
    # @short_link.slug = hash_destination(@short_link.destination)

    @short_link.save!
    redirect_to @short_link

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

    def handleExistingSlug(slug)
      @short_link = ShortLink.find_by(slug: slug)

      redirect_to @short_link
    end

    def count_visit(short_link)
      short_link.increment(:visits)
      short_link.save
    end
end
