class Booking < ActiveRecord::Base
  has_one :rv
  has_one :user

  enum status: {
    active: 0,
    completed: 1,
    archived: 2
  }
end
