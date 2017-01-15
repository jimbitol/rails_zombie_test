class AddAgeToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :age, :integer
  end
end
