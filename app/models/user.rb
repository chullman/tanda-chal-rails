class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organisation, optional: true
  has_many :shifts

  validate :validate_organisation_id, if: :organisation_id? # Because organisation_id can be nil, we are skipping validation on nil records

  private

  # Ensures that the organisation_id in the User table actually exists in the Organisation table
  def validate_organisation_id
    errors.add(:organisation_id, "is invalid") unless Organisation.exists?(self.organisation_id)
  end

end
