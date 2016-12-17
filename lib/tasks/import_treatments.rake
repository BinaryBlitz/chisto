namespace :db do
  desc 'Import treatments'
  task import_treatments: [:environment] do
    path = Rails.root.join('lib', 'tasks', 'import_treatments.csv')
    CSV.foreach(path) do |row|
      name, item_name, category_name, description = row
      Item.find_by!(name: item_name)
      category = Category.find_by!(name: category_name)

      Item.where(name: item_name, category: category).find_each do |item|
        Treatment.create!(name: name, item: item, description: description)
      end
    end
  end
end
