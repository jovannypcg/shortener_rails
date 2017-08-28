class ShortLink < ApplicationRecord
  validates :slug, uniqueness: true, strict: SlugAlreadyTaken
  validates :destination, format: { with: /(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?/,
    message: 'Enter a valid URL' }

  after_initialize :init
  before_validation :hash_destination

  def init
    self.visits ||= 0
  end

  def hash_destination
    self.slug = Digest::CRC32.hexdigest(destination)
  end
end
