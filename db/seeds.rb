# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

users = User.create([
    {username: 'mkienbus', password: "test"},
    {username: 'jsmith', password: "test"}
])

Restaurant.delete_all
zip = "10006" # Set a search zip
returns_per_term = 5 # How many restaurants to return per query
owner = Owner.first # Need an owner
terms = ["burgers", "italian", "deli", "coffee", "cuban", "japanese", "steakhouse"] # Terms to search for, should all names of categories
terms.each do |term|
	# Query the Yahoo Local API
    url = "http://local.yahooapis.com/LocalSearchService/V3/localSearch?appid=YahooDemo&query=#{term}&zip=#{zip}&results=#{returns_per_term}&output=json"
	json = open(url)
    #Parse the JSON into a hash
	parsed = ActiveSupport::JSON.decode(json)
	parsed['ResultSet']['Result'].each do |result|
		address1 = result['Address'] 
		address1 = "Unknown" if address1.empty? # Some address fields are empty, validations will complain otherwise
		restaurant = owner.restaurants.create!({
			name: result['Title'],
			description: "Replace Me",
			address1:  address1,
			city: result['City'],
			state: result['State'],
			zip: zip,
			phone: result['Phone']
            # If you store the address as a single string instead of separate address1/address2/city/state/zip fields
            # Use the following code instead
            # address: "#{Result['Address']}\nResult['City'], Result['State'] #{zip}"
		})
		restaurant.categories << Category.where({name: term}).first
	end
end
