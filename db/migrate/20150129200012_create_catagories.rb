class CreateCatagories < ActiveRecord::Migration
  def change
    create_table(:catagories) do |t|
      t.column(:name, :string)
    end
  end
end
