class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :foodtruck, counter_cache: true
end
