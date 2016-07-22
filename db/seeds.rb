# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


foodtrucks = ["ATX Boudain Hut",        #0
              "Cow Tipping Creamery",   #1
              "Scotty's BBQ",           #2
              "Bananarchy",             #3
              "Torchy's Tacos",         #4
              "East Side Kings",        #5
              "Hey Cupcake!",           #6
              "Gourdoughs",             #7
              "Baton Creole"            #8
              ]

cuisine = ["Thai",          #0
           "Dessert",       #1
           "Italian",       #2
           "Seafood",       #3
           "Brunch",        #4
           "Southern",      #5
           "Mexican",       #6
           "Dessert",       #7
           "American",      #8
           "BBQ",           #9
           "Caijun",        #10
           "Creole"         #11
          ]

signature_item = ["tacos"]

truck_pic = "http://www.hotwallpapersforfree.com/images/thumb/Cute-Taco-Wallpaper-Taco-cat-64078.jpg"

yelp_url = "http://www.yelp.com/biz/brunch-haus-austin"

Foodtruck.create!(name: foodtrucks[0], cuisine: cuisine[10], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[1], cuisine: cuisine[1], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[2], cuisine: cuisine[9], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[3], cuisine: cuisine[1], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[4], cuisine: cuisine[6], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[5], cuisine: cuisine[0], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[6], cuisine: cuisine[1], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[7], cuisine: cuisine[1], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
Foodtruck.create!(name: foodtrucks[8], cuisine: cuisine[11], signature_item: signature_item[0], truck_pic: truck_pic, yelp_url: yelp_url)
