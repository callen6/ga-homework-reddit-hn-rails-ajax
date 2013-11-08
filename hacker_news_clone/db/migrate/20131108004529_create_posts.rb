class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :link
      t.integer :up_votes
      t.integer :down_votes
    end
  end
end
