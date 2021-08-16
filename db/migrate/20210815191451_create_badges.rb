class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.belongs_to :recipient, null: false, foreign_key: true
      t.string :uuid, null: false, index: { unique: true }
      t.string :sha_256, null: false, index: { unique: true }
      t.string :proof_id, null: false, index: { unique: true }
      t.date :issue_date, null: false
      t.timestamps
    end
  end
end
