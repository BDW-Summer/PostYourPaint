# == Schema Information
#
# Table name: paints
#
#  id              :integer         not null, primary key
#  color_family    :string(255)
#  name            :string(255)
#  hex             :string(255)
#  available       :boolean
#  location        :integer
#  quantity        :integer
#  additional_info :text
#  user_id         :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#
class Paint < ActiveRecord::Base
    attr_accessible :color_family, :name, :hex, :location, :quantity, :additional_info
    belongs_to :user
    
    validates :user_id,         presence: true
    validates :color_family,    presence: true
    validates :name, presence: true
    validates :hex, presence: true, length: { is: 6 }
    validates :location, presence: true, length: { is: 5 }
    validates :quantity, presence: true
    validates :additional_info, presence: true

    default_scope order: 'paints.created_at DESC'
end
