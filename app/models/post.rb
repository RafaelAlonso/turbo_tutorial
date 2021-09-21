class Post < ApplicationRecord
  validates :title, :body, presence: true

  after_create :broadcast_append

  def broadcast_append
    broadcast_append_to :posts 
  end
end
