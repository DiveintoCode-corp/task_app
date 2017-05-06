class Task < ActiveRecord::Base
  validates :title, presence: true, 
                    length: { maximum: 100 } 
  validates :status, presence: true
  
  belongs_to :user
end
