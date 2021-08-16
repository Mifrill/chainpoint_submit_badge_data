class Badge < ApplicationRecord
  belongs_to :recipient

  validates :recipient, presence: true
  validates :uuid, presence: true
  validates :proof_id, presence: true
  validates :issue_date, presence: true
end
