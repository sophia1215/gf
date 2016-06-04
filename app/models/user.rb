class User < ActiveRecord::Base
  # rolify
  rolify :before_add => :before_add_method
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :users_roles, :dependent => :destroy
  # has_many :roles, :through => :users_roles

  validates_presence_of	:first_name , :last_name, :gender

  def before_add_method(role)
    # do something before it gets added
  end

  def name
     "#{first_name}  #{last_name}"
  end
end
