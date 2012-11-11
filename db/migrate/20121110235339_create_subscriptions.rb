class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.string :stripe_customer_id
      t.string :stripe_token
      t.string :plan

      t.timestamps
    end
    add_index :subscriptions, :user_id
  end
end
