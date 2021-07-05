class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.recourses :users
      t.recourses :articles

      t.timestamps
    end
  end
end
