require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

post("/") do
  name = params.fetch('name')
  @category = Category.create({:name => name})
  redirect ('/')
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

post("/recipes") do
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  @recipe = Recipe.create({:name => name, :ingredients => ingredients, :instructions => instructions})
  redirect ('/recipes')
  erb(:recipes)
end

get('/recipe_details/:id') do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe_details)
end

delete('/') do
  @categories = Category.all()
  Category.delete_all()
  erb(:index)
end

delete('/recipes') do
  @recipes = Recipe.all()
  Recipe.delete_all()
  erb(:recipes)
end
