ActiveRecord::Schema.define(version: 20080906171750) do
  create_table :books, force: true do |t|
    t.string   "name"
    t.string "author"
    t.timestamps
  end
 
  create_table :users, force: true do |t|
    t.string   "name"
    t.timestamps
  end

  create_join_table :books, :users
end