class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, polymorphic: true
  after_create_commit -> { broadcast_append_to conversation }
end
