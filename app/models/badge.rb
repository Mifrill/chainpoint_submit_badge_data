class Badge < ApplicationRecord
  belongs_to :recipient
  accepts_nested_attributes_for :recipient

  validates :recipient, presence: true
  validates :uuid, presence: true
  validates :proof_id, presence: true
  validates :issue_date, presence: true

  def with_uuid
    tap do
      self.uuid ||= Services::Uuid.new.call
    end
  end

  def with_hash
    tap do
      self.sha_256 ||= Services::Chainpoint::HashGenerator.new(
        values: [issue_date.to_s, recipient.name, uuid]
      ).generate
    end
  end

  def with_proof_id
    tap do
      self.proof_id ||= Services::Chainpoint::Submit.new(
        hash: sha_256
      ).call.proof_id
    end
  end
end
