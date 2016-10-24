class SessionsController < ApplicationController

def login
  @user = User.all
  User.authenticate(params[:email], params[:password])
end

def logout

end

end
