class AddExtraFieldsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :reference_image, :string
    add_column :questions, :perspective_image, :string
    add_column :questions, :downloadable, :string
    add_column :questions, :has_image, :boolean, default: false
    add_column :questions, :has_downloadable, :boolean, default: false
    add_column :questions, :has_perspective, :boolean, default: false
  end
end
