class CreateCommentReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_replies do |t|

      t.timestamps
    end
     add_reference :comment_replies ,:comment ,foreign_key:{to_table: :comments}
     add_reference  :comment_replies ,:reply ,foreign_key:{to_table: :comments}

  end
end
