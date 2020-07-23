class Project < ApplicationRecord
    has_many :addresses

    def addresses_attributes=(addresses_attributes)
        addresses_attributes.values.each do |address_attributes|
            self.addresses.build(address_attributes)
        end
    end
end
