class AddContainerTitleToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :container_title, :string
  end
end
