# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



################### Stock USERS ##################


###################################################


################## Stock FOODTRUCKS ################


ITALIAN = ["http://viztangocafe.com/wp-content/uploads/2015/06/food2.jpg"]
CHINESE = ["http://www.kowloonnc.com/resources/img/backgrounds/chinese_2.jpg"]
THAI = ["http://thethaichili.net/site/wp-content/uploads/2013/05/pad-thai.jpg"]
GREEK = ["https://www.hungerpass.com/wp-content/uploads/2016/02/greekcove4.jpg"]
MEXICAN = [ "http://img2.timeinc.net/people/i/2016/greatideas/blog/160118/tacos-600x800.jpg"]
AMERICAN = ["https://www.waiter.com/blog/wp-content/uploads/2015/06/hamburger.jpg"]
LATIN = ["http://www.seriouseats.com/images/2013/09/20130831-huevos-rancheros-breakfast-tacos-recipe-2.jpg"]
DESSERT = ["http://static.oprah.com/images/o2/201208-omag-cones-949x534.jpg"]
VEGAN = ["http://cdn.everything.io/vegankit/images/veggies.jpg"]
VEGETARIAN = ["http://www.internationalsupermarketnews.com/wp-content/uploads/2016/02/vegetarian-food.jpg"]
BRUNCH = ["https://blog.vegas.com/wp-content/uploads/2015/09/Brunch-Border-Grill1.jpg"]
COFFEE = ["http://genechanger.com/wp-content/uploads/2015/01/Coffee-and-Tea.jpg"]
CUBAN = ["http://www.nationalturk.com/en/wp-content/uploads/2011/07/Cuban-Food-Culture-cuisine-nationalturk-24576.jpg"]
VIETNAMESE = ["http://epicureandculture.com/wp-content/uploads/2015/09/shutterstock_204875356.jpg"]
GLUTENFREE = ["http://deliciousliving.com/site-files/newhope360.com/files/uploads/2011/09/91253417.jpg"]
CAIJUN = ["https://s-media-cache-ak0.pinimg.com/564x/32/23/94/3223944ababf5628d6877cbfa3ef8ba9.jpg"]
BBQ = ["https://pantograph0.goldbely.com/cfill-h267-w575/uploads/merchant/main_image/487/kings-bbq.b1786196c4146d4d843f2ff073ba03ee.jpg"]
BANANARCHY = ["http://tastytouring.com/wp-content/uploads/2010/05/bananas.JPG"]
HEYCUPCAKE = ["https://activerain-store.s3.amazonaws.com/image_store/uploads/3/2/1/7/2/ar126376850627123.jpg"]
GORDOUGHS = ["http://www.atxfoodnews.com/wp-content/uploads/2013/01/iPhone-jan-2013-113.jpg"]
CREOLE = ["http://cdn.phillymag.com/wp-content/uploads/2013/09/carmines-creole-cafe-act-ii-shrimp-crawfish-etouffee.jpg"]
OTHER = ["http://www.hotwallpapersforfree.com/images/thumb/Cute-Taco-Wallpaper-Taco-cat-64078.jpg"]

truck_type = [["Italian", ITALIAN],         #0
              ["Chinese", CHINESE],         #1
              ["Thai", THAI],               #2
              ["Greek", GREEK],             #3
              ["Mexican", MEXICAN],         #4
              ["American", AMERICAN],       #5
              ["Latin", LATIN],             #6
              ["Dessert", DESSERT],         #7
              ["Vegan", VEGAN],             #8
              ["Vegetarian", VEGETARIAN],   #9
              ["Brunch", BRUNCH],           #10
              ["Coffee/tea", COFFEE],       #11
              ["Cuban", CUBAN],             #12
              ["Vietnamese", VIETNAMESE],   #13
              ["Gluten Free", GLUTENFREE],  #14
              ["Other", OTHER]              #15
              ]

foodtrucks = [["ATX Boudain Hut", "Boudain Balls"],       #0
             ["Cow Tipping Creamery", "Soft Serve"],      #1
             ["Scotty's BBQ", "Brisket"],                 #2
             ["Bananarchy", "Chocolate Covered Bananas"], #3
             ["Torchy's Tacos", "The American"],          #4
             ["East Side Kings", "Beet Home Fries"],      #5
             ["Hey Cupcake!", "Cupcakes"],                #6
             ["Gourdoughs", "Donuts"],                    #7
             ["Baton Creole", "Jambalaya Baton"]          #8
            ]

Foodtruck.create!(name: foodtrucks[0][0],
                  cuisine: truck_type[15][0],
                  signature_item: foodtrucks[0][1],
                  truck_pic: (truck_type[15][1]).join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[0][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[1][0],
                  cuisine: truck_type[7][0],
                  signature_item: foodtrucks[1][1],
                  truck_pic: (truck_type[7][1]).join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[1][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[2][0],
                  cuisine: truck_type[5][0],
                  signature_item: foodtrucks[2][1],
                  truck_pic: BBQ.join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[2][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[3][0],
                  cuisine: truck_type[7][0],
                  signature_item: foodtrucks[3][1],
                  truck_pic: BANANARCHY.join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[3][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[4][0],
                  cuisine: truck_type[4][0],
                  signature_item: foodtrucks[4][1],
                  truck_pic: (truck_type[4][1]).join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[4][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[5][0],
                  cuisine: truck_type[2][0],
                  signature_item: foodtrucks[5][1],
                  truck_pic: (truck_type[2][1]).join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[5][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[6][0],
                  cuisine: truck_type[7][0],
                  signature_item: foodtrucks[6][1],
                  truck_pic: HEYCUPCAKE.join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[6][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[7][0],
                  cuisine: truck_type[5][0],
                  signature_item: foodtrucks[7][1],
                  truck_pic: GORDOUGHS.join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[7][0].gsub(/\s/, '-')}-austin")

Foodtruck.create!(name: foodtrucks[8][0],
                  cuisine: truck_type[15][0],
                  signature_item: foodtrucks[8][1],
                  truck_pic: CREOLE.join,
                  yelp_url: "http://www.yelp.com/biz/#{foodtrucks[8][0].gsub(/\s/, '-')}-austin")

names = %w(
  Dane
  Justin
  Matt
  Rob
  Kate
  Ahkeem
  Coop
  Amanda
  James
)

names.each do |name|
  User.create!(name: name, username: "#{name}1", password: "password")
end

100.times do
  Vote.create!(user_id: rand(1..8), foodtruck_id: rand(1..8))
end
