Create a REST API using RoR MVC and write a method to return a sorted list of these by Publisher, Author (last, first), then title.
Write another API method to return a sorted list by Author (last, first) then title.

Book.all.order('publisher, author_last_name, author_first_name, title')

class DbStoredProcedure < ActiveRecord::Base

  def self.fetch_db_records(proc_name_with_parameters)
    connection.select_all(proc_name_with_parameters)
  end

  def self.insert_update_delete_calculate(proc_name_with_parameters)
    connection.execute(proc_name_with_parameters)
  end

  def self.fetch_val_from_sp(proc_name_with_parameters)
    connection.select_value(proc_name_with_parameters)
  end

end