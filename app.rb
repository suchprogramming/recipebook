require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/categories') do
  @categories = Category.all()
  erb(:categories)
end

post("/categories") do
  name = params.fetch('name')
  @category = Category.create({:name => name})
  redirect ('/categories')
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i())
  erb(:category_recipes)
end

post('/categories/:id') do
  @recipes = Recipe.all()
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  @category = Category.find(params.fetch("id").to_i())
  category.recipe.new({:category_id => [category_id()], :name => name, :ingredients => ingredients, :instructions => instructions})
  erb(:category_recipes)
end

# get('/recipe_details/:id') do
#   @recipes = Recipe.all()
#   @recipe = Recipe.find(params.fetch("id").to_i())
#   erb(:recipe_details)
# end
#
# delete('/categories') do
#   @categories = Category.all()
#   Category.delete_all()
#   erb(:categories)
# end
#
# delete('/recipes') do
#   @recipes = Recipe.all()
#   Recipe.delete_all()
#   erb(:recipes)
# end
