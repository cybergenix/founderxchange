class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :partner_role

      t.timestamps
    end
  end
end
