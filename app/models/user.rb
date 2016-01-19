class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :groups, through: :user_groups
  has_many :user_events
  has_many :events, through: :user_events
  has_many :field_conditions

  def timeout_in
    # 30.minutes
  end

end
