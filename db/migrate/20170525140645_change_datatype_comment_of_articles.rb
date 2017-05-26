class ChangeDatatypeCommentOfArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :comment, :text
  end
end
