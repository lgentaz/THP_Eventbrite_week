module Superadmin::UsersHelper
    
  def check_if_superadmin(user)
    user.is_superadmin == "t"
  end

end
