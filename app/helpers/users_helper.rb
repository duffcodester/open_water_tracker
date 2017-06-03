module UsersHelper
  USER_PARAMS = [:id,
                 :email,
                 :first_name,
                 :last_name,
                 :phone_number,
                 :dealer_id,
                 :admin,
                 :password,
                 :password_confirmation
                ]

  def user_params
    params.require(:user).permit(USER_PARAMS)
  end
end
