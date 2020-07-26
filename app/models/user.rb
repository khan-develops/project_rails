class User < ApplicationRecord
    has_secure_password

    validates :email, :password, presence: true
    validates :name, presence: true 
    validates :email, uniqueness: true
    validates(:password, {:length => {:in => 5..12}})
    validates(:name, {:length => {:minimum => 2}})

    has_many :projects
    has_many :details


    scope :is_employee, -> { where(employee: true) }
    scope :completed, -> { joins(:details).merge(Detail.completed)}

end
