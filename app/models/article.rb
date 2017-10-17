class Article < ApplicationRecord
  def day
    self.published_at.strftime('%B %d, %Y')
  end
end
