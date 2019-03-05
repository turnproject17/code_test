class ToAddIndexesArticle < ActiveRecord::Migration[5.2]
  def change
		add_index :articles, :title
		add_index :articles, :published_at  	
		add_index :articles, :updated_at
  end
end
