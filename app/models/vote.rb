class Vote < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :foodtruck, counter_cache: true
end
