class AddTimeToSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :signups, :time, :integer
  end
end
