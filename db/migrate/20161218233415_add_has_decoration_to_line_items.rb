class AddHasDecorationToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :has_decoration, :boolean, default: false
  end
end
