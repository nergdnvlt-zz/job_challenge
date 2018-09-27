class AddLanguageToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :language, foreign_key: true
  end
end
