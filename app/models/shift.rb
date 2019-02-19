class Shift < ApplicationRecord
  belongs_to :User

  validate :validate_user_id

  private

  # Ensures that the user_id in the Shifts table actually exists in the User table
  def validate_user_id
    errors.add(:user_id, "is invalid") unless User.exists?(self.user_id)
  end
end
