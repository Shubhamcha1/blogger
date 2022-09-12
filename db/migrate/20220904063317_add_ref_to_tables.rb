class AddRefToTables < ActiveRecord::Migration[7.0]
  def change
      add_reference :blogs  ,:user , foreign_key: true
      add_reference :blogs  ,:master_categories , foreign_key: true
      add_reference :comments ,:blog ,foreign_key: true 
      add_reference :comments ,:user ,foreign_key: true 
      add_reference :likes ,:blog ,foreign_key: true
      add_reference :likes ,:user ,foreign_key: true
      add_reference :user_visit_blogs ,:blog ,foreign_key: true
      add_reference :user_visit_blogs ,:user ,foreign_key: true

  end
end
