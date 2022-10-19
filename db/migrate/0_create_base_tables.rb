class CreateBaseTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :password
      t.timestamps # Creates two columns: created_at, updated_at as datetime data type
    end

    create_table :finstagram_posts do |t|
      t.references :user # Creates a user_id column, integer data type
      t.string :photo_url
      t.timestamps
    end

    create_table :comments do |t|
      t.references :user # Makes a user_id column
      t.references :finstagram_post # Makes a finstagram_post_id column
      t.text :text
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :finstagram_post
      t.timestamps
    end

  end

end
