Rails.application.routes.draw do
  # routes for user CRUD operations
  get 'user', to: 'user#show_all_users'
  get 'user/:id', to: 'user#show_user'
  post 'user', to: 'user#create_user'
  put 'user/:id', to: 'user#update_user'

  # routes for bookings crud operations
  get 'rv', to: 'rv#show_all_rvs'
  get 'rv/:id', to: 'rv#show_rv'
  post 'rv', to: 'rv#create_rv'
  put 'rv/:id', to: 'rv#update_rv'

  # routes for bookings crud operations
  get 'booking', to: 'booking#show_all_bookings'
  get 'booking/:id', to: 'booking#show_booking'
  post 'booking', to: 'booking#create_booking'
  put 'booking/:id', to: 'booking#update_booking'

end
