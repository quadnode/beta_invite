class CreateBetaInvites < ActiveRecord::Migration
  def change
    unless self.table_exists?("beta_invites")
      write("#####     creating beta_invites table")
      create_table :beta_invites do |t|
        t.string :recipient_email

        t.timestamps
      end
    end
  end
end
