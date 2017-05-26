class ChangeCodeToArticle < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :code, :text
  end
end
