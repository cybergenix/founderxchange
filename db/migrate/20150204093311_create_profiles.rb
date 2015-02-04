class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :expertise
      t.string :seeking
      t.string :partner_role
      t.text :about
      t.string :experience
      t.string :prefer_age
      t.string :equity_type

      t.timestamps
    end
  end
end
