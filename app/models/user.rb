class User < ApplicationRecord
   belongs_to :company_employee, optional: true
   has_many :histories
   
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def domain
    "#{email.slice!(/@.*/)}"
  end

end
