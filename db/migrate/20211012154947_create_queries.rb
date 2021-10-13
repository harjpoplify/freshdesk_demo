class CreateQueries < ActiveRecord::Migration[6.1]
  def change
    create_table :queries do |t|
      t.string :name
      t.string :subject
      t.text :description, size: :long
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
