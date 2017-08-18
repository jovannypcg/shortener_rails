class ShortLink < ApplicationRecord
  after_initialize :init

  def init
    self.visits ||= 0
  end
end
