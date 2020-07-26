class Address < ApplicationRecord
    belongs_to :project

    validates :street, :city, :state, :zipcode, presence: true
    
end
