class Paint < ActiveRecord::Base
    attr_accessible :color_family, :name, :hex, :location, :quantity, :additional_info
    belongs_to :user
    
    validates :name, presence: true
    validates :user_id, presence: true
    
    default_scope order: 'paints.created_at DESC'
end
