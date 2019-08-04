class Player < ApplicationRecord
    has_many :datum
    has_many :pets
end
