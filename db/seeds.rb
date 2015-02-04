JsonParser.new

def assign_query_string(big_category)
  name = big_category.name
  query_string = "%22" + name.gsub(", ", "%22+OR+%22") + "%22"
  query_string = query_string.gsub("and ", "")
  query_string = query_string.gsub(" ", "+")
  big_category.update(query: query_string)
end

big_categories = [
  Category.find_by(name: "Arts, entertainment, recreation, accommodation, and food services"), 
  Category.find_by(name: "Educational services, health care, and social assistance"), 
  Category.find_by(name: "Finance, insurance, real estate, rental, and leasing"), 
  Category.find_by(name: "Agriculture, forestry, fishing, and hunting")]

big_categories.each do |big_category|
  assign_query_string(big_category)
end
