class AddColumnInBlog < ActiveRecord::Migration[7.0]
  def change
        add_column :blogs, :visit_count, :integer, default: 0
        add_column :users, :name ,:string
  end
end
