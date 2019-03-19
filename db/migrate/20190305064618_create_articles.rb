class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles, comment: '記事' do |t|
      t.string :title, comment: 'タイトル'
      t.string :content, comment: '内容'
      t.timestamps
    end
  end
end
