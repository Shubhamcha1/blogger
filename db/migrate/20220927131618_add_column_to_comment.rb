class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment_replies ,:blog ,foreign_key: true 
  end
end
