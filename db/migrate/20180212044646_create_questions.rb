class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_type
      t.integer :maximum
      t.integer :minimum

      t.timestamps
    end
  end
end
