class Book < ApplicationRecord
  def output_mla
    "#{author_last_name}, #{author_first_name}.\"#{title}\" #{container_title}, #{publisher},#{publication_year} pp. 120-126"
  end

  def output_chicago_style
    "#{author_last_name}, #{author_first_name}. #{publication_year} \"#{title}\" #{container_title}, no. 2(February 2000): 205-230. https://mybooks.org/344.55/8555"
  end
end