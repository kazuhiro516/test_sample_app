class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
  	# emailからユーザーを検索するとき全表スキャンを使わない処理
  	add_index :users, :email, unique: true
  end
end
