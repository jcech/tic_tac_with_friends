class AddTables < ActiveRecord::Migration
  def change
    remove_column :games, :player_x
    remove_column :games, :player_o
    add_column :games, :current_player, :integer

    create_table :players do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :symbol
      t.boolean :won, default: false

      t.timestamps
    end

    create_table :boards do |t|
      t.integer :game_id

      t.timestamps
    end

    create_table :spaces do |t|
      t.integer :board_id
      t.integer :number
      t.string :marked_by

      t.timestamps
    end

  end
end
