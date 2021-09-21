class Post < ApplicationRecord
  validates :title, :body, presence: true

  after_create :broadcast_append
  after_destroy :broadcast_remove
  after_update :broadcast_update

  def broadcast_append
    broadcast_append_to :posts
  end

  def broadcast_update
    broadcast_replace_to :posts
  end

  def broadcast_remove
    broadcast_remove_to :posts
  end
end
