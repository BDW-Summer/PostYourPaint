class Paint < ActiveRecord::Base
    attr_accessible :color_family, :name, :hex, :location, :quantity, :additional_info
    belongs_to :user
    
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 50 }
    validates :hex, presence: true, length: { is: 6 }
    validates :location, presence: true, length: { is: 5 }
    validates :quantity, presence: true
    validates :additional_info, presence: true

    default_scope order: 'paints.created_at DESC'
end
