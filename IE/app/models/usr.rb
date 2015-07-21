class Usr < ActiveRecord::Base
	has_secure_password
	has_many :monthlybills
	has_many :charges
	has_many :msgs
end
