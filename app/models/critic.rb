class Critic < ApplicationRecord
  # Callbacks
  # after_create :increment_critics_count
  # after_destroy :decrement_critics_count

  #  Validations
  validates :title, :body, presence: true
  validates :title, length: { maximum: 40 }

  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true

  #   private

  #   def increment_critics_count
  #     critic_user = user
  #     critic_user.critics_count += 1
  #     critic_user.save
  #   end

  #   def decrement_critics_count
  #     critic_user = user
  #     critic_user.critics_count -= 1
  #     critic_user.save
  #   end
end
