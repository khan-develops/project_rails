class Detail < ApplicationRecord

    validates :title, :role, presence: true

    belongs_to :user
    belongs_to :service

    scope :completed, -> { where(completed: true) }

end
