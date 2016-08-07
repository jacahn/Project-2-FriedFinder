Review.destroy_all
Restaurant.destroy_all

restaurants = Restaurant.create([
  {name: "Hitching Post", address: "200 Upshur St NW", url: "http://www.thehpostrestaurant.com/"},
  {name: "Bonchon", address: "2201 N Pershing Dr
Arlington, VA 22201", url: "http://arlingtonva.bonchon.com/"},
  {name: "The Liberty Tavern", address: "3195 Wilson Blvd
Arlington, VA 22201", url: "http://thelibertytavern.com/"}
])

reviews = Review.create([
  {reviewer: "ChickenLuvr", body: "Seriously good fried chicken", rating: 9, restaurant: restaurants[0]},
  {reviewer: "GimmeDatChick49", body: "Nummers", rating: 8, restaurant: restaurants[1]},
  {reviewer: "happy eater", body: "I travel 2 hours every weekend to eat here.", rating: 9, restaurant: restaurants[2]}
])
