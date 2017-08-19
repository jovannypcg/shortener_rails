class ShortLink < ApplicationRecord
  validates :slug, uniqueness: true, strict: SlugAlreadyTaken
  validates :destination, format: { with: /(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?/,
    message: 'Enter a valid URL' }

  after_initialize :init

  def init
    self.visits ||= 0
  end
end
