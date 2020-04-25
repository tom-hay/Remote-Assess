class AddMessageToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :message, :string
  end
end
