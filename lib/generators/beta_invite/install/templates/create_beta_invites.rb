class CreateBetaInvites < ActiveRecord::Migration
  def change
    unless self.table_exists?("beta_invites")
      create_table :beta_invites do |t|
        t.string :recipient_email

        t.timestamps
      end
    end
  end
end