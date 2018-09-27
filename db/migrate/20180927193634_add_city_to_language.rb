class AddCityToLanguage < ActiveRecord::Migration[5.2]
  def change
    add_reference :languages, :city, foreign_key: true
  end
end
