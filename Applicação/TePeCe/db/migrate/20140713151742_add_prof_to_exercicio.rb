class AddProfToExercicio < ActiveRecord::Migration
  def change
   	add_column :exercicios, :prof_id, :integer
  end
end
