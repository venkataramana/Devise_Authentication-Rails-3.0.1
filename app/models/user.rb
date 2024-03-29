class User < ActiveRecord::Base
        has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  def self.create_with_omniauth(auth)
          create! do |user|
                    user.provider = auth["provider"]
                    user.uid = auth["uid"]
                    user.name = auth["user_info"]["name"]
          end
   end
end

