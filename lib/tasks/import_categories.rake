namespace :db do
  desc 'Import categories'
  task import_categories: [:environment] do
    path = Rails.root.join('lib', 'tasks', 'import_categories.csv')
    CSV.foreach(path) do |row|
      name, color, icon_path = row
      icon = File.open(Rails.root.join('lib', 'tasks', 'icons', 'categories', icon_path))
      Category.create!(name: name, color: color, icon: icon)
    end
  end
end
