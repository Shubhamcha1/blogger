class CreateUserVisitBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_visit_blogs do |t|
      t.timestamps
    end
  end

end
