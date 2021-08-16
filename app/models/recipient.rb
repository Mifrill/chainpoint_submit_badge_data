class Recipient < ApplicationRecord
  has_many :badges, dependent: :destroy
end
