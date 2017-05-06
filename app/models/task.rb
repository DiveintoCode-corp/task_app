class Task < ActiveRecord::Base
  validates :title, presence: true, 
                    length: { maximum: 100 } 
  validates :status, presence: true
  
  belongs_to :auther, class_name: 'User'
  belongs_to :charger, foreign_key: 'charge_id', class_name: 'User'
end
