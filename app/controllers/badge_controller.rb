class BadgeController < ApplicationController
  def new
    recipient = Recipient.first
    @badge = recipient.badges.new.with_uuid
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.with_hash.with_proof_id.save!
  end

  private

  def badge_params
    params.require(:badge).permit(
      :uuid,
      :issue_date,
      :recipient_id,
      recipient_attributes: %i[
        id
        name
      ]
    )
  end
end
