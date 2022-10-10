class Recipe < ApplicationRecord

validates :title, presence: true, uniqueness: true
validates :instructions, length: {minimum: 50}

end
