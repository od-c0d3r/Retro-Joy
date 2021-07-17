class ChangeColumnTypeInArticle < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :author_id, 'integer USING CAST(author_id AS integer)'
  end
end
