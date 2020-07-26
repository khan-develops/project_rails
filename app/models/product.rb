class Product < ApplicationRecord
    scope :empty_names, -> { where(name: "") }
end
