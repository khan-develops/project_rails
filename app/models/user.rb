class User < ApplicationRecord
    has_secure_password

    def self.from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.email = auth['info']['email']
            u.name = auth['info']['name']
            u.password = SecureRandom.hex(12) 
        end
    end

    validates :email, presence: true
    validates :name, presence: true
    validates :email, uniqueness: true

    has_many :projects
    has_many :details

    scope :is_employee, -> { where(employee: true) }
    scope :completed, -> { joins(:details).merge(Detail.completed)}

end
