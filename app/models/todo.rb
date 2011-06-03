class Todo < ActiveRecord::Base
  attr_accessible :content, :order, :done

  validates_presence_of :content 

end
