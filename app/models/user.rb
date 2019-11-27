class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_commit :update_user_with_api


  private

  def update_user_with_api
    UpdateUserJob.perform_later(self.id)
  end
end
