class ApplicationController < ActionController::Base
    include UsersHelper
    include EventsHelper
    include Superadmin::UsersHelper
end
