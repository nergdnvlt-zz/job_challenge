class AddLanguageToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :language, :integer
  end
end
