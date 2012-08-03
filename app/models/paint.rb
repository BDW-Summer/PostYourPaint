class Paint < ActiveRecord::Base
    PAINT_QUANTITY = %w(.25 .5 .75 1 2 3 4 5)
    
    attr_accessible :family_id, :name, :hex, :location, :quantity, :additional_info
    belongs_to :user
    belongs_to :color_family
    
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 30 }
    validates :hex, presence: true, length: { is: 6 }
    validates :location, presence: true, length: { is: 5 }
    validates :quantity, presence: true
    validates :additional_info, presence: true

    default_scope order: 'paints.created_at DESC'
end
