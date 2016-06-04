class Faq < ActiveRecord::Base
	resourcify
	validates_presence_of :question, :answer
end
