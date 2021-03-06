# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@delivery_place_1 = DeliveryPlace.create(
  name: 'Stołówka',
  delivery_time: '14:15',
  delivery_order_time: '10:00',
  ahead_of_time: true
)
@delivery_place_2 = DeliveryPlace.create(
  name: 'Szkoła',
  delivery_time: '12:10',
  delivery_order_time: '8:00',
  ahead_of_time: true
)
@delivery_place_3 = DeliveryPlace.create(
  name: 'Biuro', delivery_time: '15:00',
  delivery_order_time: '12:20',
  ahead_of_time: false
)
@delivery_place_4 = DeliveryPlace.create(
  name: 'Przedszkole',
  delivery_time: '12:40',
  delivery_order_time: '9:00',
  ahead_of_time: true
)
@delivery_place_5 = DeliveryPlace.create(
  name: 'Sklep',
  delivery_time: '13:20',
  delivery_order_time: '12:00',
  ahead_of_time: false
)
@menu1 = Menu.create(
  date: '2019-06-16',
  delivery_place_id:
  @delivery_place_1.id,
  order_before_at: '2019-06-16 10:00:00'
)
@menu2 = Menu.create(
  date: '2019-06-17',
  delivery_place_id: @delivery_place_1.id,
  order_before_at: '2019-06-17 10:00:00'
)
@menu3 = Menu.create(
  date: '2019-06-19',
  delivery_place_id: @delivery_place_1.id,
  order_before_at: '2019-06-19 10:00:00'
)
@menu4 = Menu.create(
  date: '2019-06-16',
  delivery_place_id: @delivery_place_2.id,
  order_before_at: '2019-06-16 08:00:00'
)
@menu5 = Menu.create(
  date: '2019-06-18',
  delivery_place_id: @delivery_place_2.id,
  order_before_at: '2019-06-18 08:00:00'
)
@menu6 = Menu.create(
  date: '2019-06-19',
  delivery_place_id: @delivery_place_2.id,
  order_before_at: '2019-06-19 08:00:00'
)
@menu7 = Menu.create(
  date: '2019-06-16',
  delivery_place_id: @delivery_place_3.id,
  order_before_at: '2019-06-16 12:20:00'
)
@menu8 = Menu.create(
  date: '2019-06-18',
  delivery_place_id: @delivery_place_3.id,
  order_before_at: '2019-06-18 12:20:00'
)
@menu9 = Menu.create(
  date: '2019-06-19',
  delivery_place_id: @delivery_place_3.id,
  order_before_at: '2019-06-19 12:20:00'
)
@menu10 = Menu.create(
  date: '2019-06-16',
  delivery_place_id: @delivery_place_4.id,
  order_before_at: '2019-06-16 09:00:00'
)
@menu11 = Menu.create(
  date: '2019-06-16',
  delivery_place_id: @delivery_place_5.id,
  order_before_at: '2019-06-16 12:00:00'
)
@dish1 = Dish.create(
  name: 'Pierogi ruskie',
  price: 9.30,
  menu_id: @menu1.id
)
@dish2 = Dish.create(
  name: 'Zupa pomidorowa',
  price: 7.50,
  menu_id: @menu1.id
)
@dish3 = Dish.create(
  name: 'Sok pomarańczowy',
  price: 5.30,
  menu_id: @menu1.id
)
@dish4 = Dish.create(
  name: 'Pierogi z grzybami',
  price: 6.30,
  menu_id: @menu2.id
)
@dish5 = Dish.create(
  name: 'Zupa brokułowa',
  price: 7.50,
  menu_id: @menu2.id
)
@dish6 = Dish.create(
  name: 'Sok pomarańczowy',
  price: 5.30,
  menu_id: @menu2.id
)
@dish7 = Dish.create(
  name: 'Pierogi z mięsem',
  price: 6.30,
  menu_id: @menu3.id
)
@dish8 = Dish.create(
  name: 'Zupa jarzynowa',
  price: 6.30,
  menu_id: @menu3.id
)
@dish9 = Dish.create(
  name: 'Pierogi z jagodami',
  price: 8.20,
  menu_id: @menu4.id
)
@dish10 = Dish.create(
  name: 'Chili burger',
  price: 18.50,
  menu_id: @menu5.id
)
@dish11 = Dish.create(
  name: 'Cola',
  price: 5.20,
  menu_id: @menu5.id
)
@dish12 = Dish.create(
  name: 'Sprite',
  price: 5.20,
  menu_id: @menu6.id
)
@dish13 = Dish.create(
  name: 'Polędwiczki wołowe',
  price: 24.00,
  menu_id: @menu6.id
)
@dish14 = Dish.create(
  name: 'Woda mineralna',
  price: 2.20,
  menu_id: @menu7.id
)
@dish15 = Dish.create(
  name: 'Kluski serowe',
  price: 14.00,
  menu_id: @menu7.id
)
@dish16 = Dish.create(
  name: 'Woda mineralna',
  price: 2.20,
  menu_id: @menu8.id
)
@dish17 = Dish.create(
  name: 'Naleśniki ze szpinakiem',
  price: 12.00, menu_id:
  @menu8.id
)
@dish18 = Dish.create(
  name: 'Kompot',
  price: 6.20,
  menu_id: @menu9.id
)
@dish19 = Dish.create(
  name: 'Kotlet schabowy',
  price: 20.00,
  menu_id: @menu9.id
)
@dish20 = Dish.create(
  name: 'Zupa Grzybowa',
  price: 10.20,
  menu_id: @menu10.id
)
@dish21 = Dish.create(
  name: 'Kotlet drobiowy',
  price: 16.00,
  menu_id: @menu10.id
)
@dish22 = Dish.create(
  name: 'Kompot',
  price: 6.20,
  menu_id: @menu10.id
)
@dish23 = Dish.create(
  name: 'Zupa Pomidorowa',
  price: 9.20,
  menu_id: @menu10.id
)
@dish24 = Dish.create(
  name: 'Rolada drobiowa',
  price: 22.00,
  menu_id: @menu10.id
)
@dish25 = Dish.create(
  name: 'Sok jabłkowy',
  price: 6.20,
  menu_id: @menu10.id
)
