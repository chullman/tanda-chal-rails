class User < ApplicationRecord
  belongs_to :Organisation, optional: true
  has_many :shifts
end
