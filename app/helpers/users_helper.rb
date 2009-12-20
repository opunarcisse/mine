module UsersHelper
  
    def show_user_name 
      @user = User.find(params[:id])
      return @user.firstname + " " + @user.lastname
  end
end
