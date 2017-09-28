class RemoveUpvotesFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :upvotes, :integer
  end
end
