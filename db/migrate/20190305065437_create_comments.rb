class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, comment: 'コメント' do |t|
      t.string :content, comment: '内容'
      t.timestamps
    end
  end
end
