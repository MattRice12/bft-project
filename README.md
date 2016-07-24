##Show all Food Trucks, 6 per page, ordered by vote count.
URL: https://warm-brook-49316.herokuapp.com/foodtrucks

Method: GET

URL params: foodtrucks/:id #=> shows particular foodtruck
  Example: foodtruck/1 #=> shows 1st foodtruck
  Example: foodtruck/17 #=> shows 17th foodtruck
  Note--> the :id is set by order of creation, not by highest-vote (so :id = 1 will likely not correspond to the 1st foodtruck on the site)

URL actions: ?page=[page-number]
  Example: ?page=1 shows trucks 1-6 (this action is superfluous)
  Example: ?page=2 shows trucks 7-12

Data Params:
  {
    Foodtrucks : {
      t.string   "name" null: false
      t.string   "cuisine",                    null: false
      t.string   "signature_item"
      t.string   "truck_pic"
      t.string   "yelp_url"
      t.integer  "votes_count",    default: 0
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
      t.text     "comments"
      t.integer  "user_id"
    }
  }


##Displays second 3 Food Trucks
https://warm-brook-49316.herokuapp.com/foodtrucks?page=2


##Displays specific Food Truck
https://warm-brook-49316.herokuapp.com//foodtrucks/1


  ##epic --> show 5 users who also liked this truck


##Displays first 3 Users (ordered by top voters the most)
https://warm-brook-49316.herokuapp.com/users

##Displays specific User (w/ info: name, username, also_likes: [...])
https://warm-brook-49316.herokuapp.com/users/1

##Displays Sign Up page


##Displays Sign In page


##Users are restricted from doing anything except viewing the main Food Truck list
