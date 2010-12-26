class CreateWeighIns < ActiveRecord::Migration
  def self.up
    create_table :weigh_ins do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :weigh_ins
  end
end
