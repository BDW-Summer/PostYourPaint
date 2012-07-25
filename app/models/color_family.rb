class ColorFamily < ActiveRecord::Base
    has_many :paints
    
    attr_accessible :family
end
