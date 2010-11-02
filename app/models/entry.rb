class Entry < ActiveRecord::Base 
	validates :pointer, :presence => true 
	#validates :title, :presence => true, 
	#	:length => { :minimum => 5 } 
end 
