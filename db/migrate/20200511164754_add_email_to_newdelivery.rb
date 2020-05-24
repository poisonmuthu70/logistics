class AddEmailToNewdelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :newdeliveries, :email, :string
  end
end
