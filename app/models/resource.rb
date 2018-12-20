class Resource < ApplicationRecord
  belongs_to :team, optional: true
  validates_presence_of :album_path, :bucket_name, :bucket_region, :name
end
