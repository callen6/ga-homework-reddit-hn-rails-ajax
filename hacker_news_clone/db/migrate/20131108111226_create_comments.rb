class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.belongs_to :post_id, index: true
    end
  end
end
