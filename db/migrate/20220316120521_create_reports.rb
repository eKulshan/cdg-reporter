class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.string :grade
      t.bigint :user_id

      t.timestamps
    end
  end
end
