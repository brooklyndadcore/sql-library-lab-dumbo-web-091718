def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = 1 ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  GROUP By motto
  HAVING MAX(length(motto))
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  # "SELECT COUNT(characters.species) FROM characters"
  "SELECT species, COUNT(characters.species) AS counted
  FROM characters
  GROUP BY species
  HAVING counted
  ORDER BY species DESC
  LIMIT 1
  "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors, subgenres
  JOIN series
  WHERE series.author_id = authors.id AND series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN characters
  WHERE series.id = characters.series_id
  GROUP BY series.title
  HAVING COUNT(characters.species='human')
  ORDER BY series.title
  LIMIT 1
  "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.character_id) AS counted
  FROM characters
  JOIN character_books
  WHERE characters.id = character_books.character_id
  GROUP BY characters.name
  HAVING counted
  ORDER BY counted DESC "
end
