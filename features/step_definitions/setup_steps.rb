Given /the following (.+)s exist:/ do |table, dataset|
  setup_data table, dataset
end

def setup_data(table, dataset)
  model = Object.const_get table.capitalize
  dataset.hashes.each do |data|
    model.create data
  end
end
