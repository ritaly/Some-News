class CreateCommentVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_votes do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
