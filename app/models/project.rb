class Project < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true
    validates(:description, {:length => {:maximum => 150}})

    belongs_to :user
    has_many :addresses
    has_many :service_projects
    has_many :services, through: :service_projects

    accepts_nested_attributes_for :addresses

    def addresses_attributes=(addresses_attributes)
        addresses_attributes.values.each do |address_attributes|
            if address_attributes[:street].present?
                address = Address.create_or_find_by(address_attributes)
                if !self.addresses.include?(address)
                    self.addresses << address
                end
            end
        end
    end
end
