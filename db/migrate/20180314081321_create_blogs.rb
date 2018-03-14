class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|

      t.string :title
      t.text :body
      t.string :category
      t.timestamps
    end
  end
end

# migrateはテーブルの設計図
# クラスを決める時型を決める
# text は長文
# stringは短文