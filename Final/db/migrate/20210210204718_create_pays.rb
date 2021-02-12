class CreatePays < ActiveRecord::Migration[6.1]
  def change
    create_table :pays do |t|
      t.datetime :date
      t.float :real_ammount

      t.timestamps
    end
  end
end
