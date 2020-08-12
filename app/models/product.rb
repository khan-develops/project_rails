class Product < ApplicationRecord
    #scope :empty_names, -> { where(name: "") }
    def empty_names?
        if self.name.empty?
            true
        else
            false
        end
    end 
end
