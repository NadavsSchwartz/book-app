class ToggleNotNullOnBooksAuthor < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :author_id, false

  end
end
