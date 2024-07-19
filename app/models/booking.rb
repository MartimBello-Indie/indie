class Booking < ActiveRecord::Base
  has_one :rv
  has_one :user
end
