class Team < ApplicationRecord
  has_many :users
  has_many :resources

  validates_presence_of :name
end
