namespace :db do
  desc 'Import items'
  task import_items: [:environment] do
    path = Rails.root.join('lib', 'tasks', 'import_items.csv')
    CSV.foreach(path) do |row|
      name, category_name, description, icon_path = row
      category = Category.find_by!(name: category_name)
      icon = File.open(Rails.root.join('lib', 'tasks', 'icons', 'items', icon_path))
      Item.create!(name: name, category: category, description: description, icon: icon)
    end
  end
end
