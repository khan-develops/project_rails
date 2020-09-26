class Service < ApplicationRecord

    validates :name, presence: true

    has_many :service_projects
    has_many :projects, through: :service_projects
    has_many :products
    has_many :details

    accepts_nested_attributes_for :products, :details, allow_destroy: true
    
    

    # def products_attributes=(products_attributes)
    #     products_attributes.values.each do  |product_attributes|
    #         if product_attributes[:name].present?
    #             product = Product.find_or_create_by(product_attributes)
    #             if !self.products.include?(product)
    #                 self.products << product
    #             end
    #         end
    #     end
    # end

    # def details_attributes=(details_attributes)
    #     details_attributes.values.each do |detail_attributes|
    #         if detail_attributes[:title].present?
    #             detail = Detail.find_or_create_by(detail_attributes)
    #             if !self.details.include?(detail)
    #                 self.details << detail
    #             end
    #         end
    #     end
    # end

end
