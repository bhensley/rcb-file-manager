class Resource < ApplicationRecord
  belongs_to :team, optional: true
end
