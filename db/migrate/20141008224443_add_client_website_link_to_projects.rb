class AddClientWebsiteLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :client_website_url, :string
    add_column :projects, :client_email, :string
  end
end
