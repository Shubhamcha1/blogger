class AddColumnToblog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs ,:tag_list ,:string
  end
end
