##Shows all Food Trucks, 6 per page, ordered by vote count.
URL: https://warm-brook-49316.herokuapp.com/foodtrucks

Methods: GET, CREATE, UPDATE, DELETE

URL params: foodtrucks/:id #=> shows particular foodtruck
  Example: foodtrucks/1 #=> shows 1st foodtruck
  Example: foodtrucks/17 #=> shows 17th foodtruck
  Note--> the :id is set by order of creation, not by highest-vote (so :id = 1 will likely not correspond to the 1st foodtruck on the site)

URL actions: foodtrucks?page=[page-number]
  Example: foodtrucks?page=1 shows trucks 1-6 (this action is superfluous)
  Example: foodtrucks?page=2 shows trucks 7-12

Data Params:
  {
    foodtrucks : {
      name: [string]
      cuisine: [string]
      signature_item: [string]
      truck_pic: [string]
      yelp_url: [string]
      votes_count: [integer]
      user_id: [integer]
    }
  }

  Success Response
    Code: 200

  Error Response
    Code: 400: { message: "Invalid Input" }
    Code: 401: { message: "You are not authorized to take this action" }
    Code: 404: { message: "Not Found" }
    Code: 500: { message: "Internal Server Error" }

______________________________________________________________________
##Shows all Users, 6 per page
https://warm-brook-49316.herokuapp.com/users

Methods: GET, CREATE, UPDATE, DELETE

URL params: users/:id #=> shows particular users
  Example: users/1 #=> shows 1st user
  Example: users/17 #=> shows 17th user
  Note--> the :id is set by order of creation, not by highest-vote (so :id = 1 will likely not correspond to the 1st user on the site)

URL actions: users?page=[page-number]
  Example: users?page=1 shows users 1-6 (this action is superfluous)
  Example: users?page=2 shows users 7-12

Data Params:
  {
    users : {
      name: [string]
      username: [string]
      password_digest: [string]
      favorites: [string]
      auth_token: [string]
      votes_count: [integer]
    }
  }

Success Response
  Code: 200

Error Response
  Code: 400: { message: "Invalid Input" }
  Code: 401: { message: "You are not authorized to take this action" }
  Code: 404: { message: "Not Found" }
  Code: 500: { message: "Internal Server Error" }

______________________________________________________________________
##Displays Sign Up page

##Displays Sign In page

##Users are restricted from doing anything except viewing the main Food Truck list
