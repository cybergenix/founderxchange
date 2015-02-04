class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :job_type
      t.string :title
      t.string :compensation
      t.text :pitch

      t.timestamps
    end
  end
end
