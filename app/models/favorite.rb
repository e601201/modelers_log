class Favorite < ApplicationRecord
  belongs_to :workspace
  belongs_to :project
end
