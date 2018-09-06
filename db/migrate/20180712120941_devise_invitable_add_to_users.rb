class DeviseInvitableAddToUsers < ActiveRecord::Migration[5.2]
  # def up
  #   change_table :users do |t|
  #     t.string     :invitation_token
  #     t.datetime   :invitation_created_at
  #     t.datetime   :invitation_sent_at
  #     t.datetime   :invitation_accepted_at
  #     t.integer    :invitation_limit
  #     t.references :invited_by, polymorphic: true
  #     t.integer    :invitations_count, default: 0
  #     t.index      :invitations_count
  #     t.index      :invitation_token, unique: true # for invitable
  #     t.index      :invited_by_id
  #   end
  #   add_index :users, :invitation_token, :unique => true
  # end

  # def down
  #   change_table :users do |t|
  #     t.remove_references :invited_by, polymorphic: true
  #     t.remove :invitations_count, :invitation_limit, :invitation_sent_at, :invitation_accepted_at, :invitation_token, :invitation_created_at
  #   end
  # end

  def change
    add_column :users, :invitation_token, :string
    add_column :users, :invitation_created_at, :datetime
    add_column :users, :invitation_sent_at, :datetime
    add_column :users, :invitation_accepted_at, :datetime
    add_column :users, :invitation_limit, :integer
    add_column :users, :invited_by_id, :integer
    add_column :users, :invited_by_type, :string
    add_index :users, :invitation_token, :unique => true

    # Allow null encrypted_password
    change_column_null :users, :encrypted_password, :string, true
    # Allow null password_salt (add it if you are using Devise's encryptable module)
    # change_column_null :users, :password_salt, :string, true
  end
end
