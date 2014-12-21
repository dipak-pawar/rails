module SessionsHelper


def sign_in user
  session[:user_id]= user.id
  
end
=begin
def current_user
    @current_user ||= User.find_by(id: session[:user_id])
end
=end
def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

def signed_in?
   !current_user.nil?
end

def sign_out
  forget(current_user)
  session.delete :user_id
  @current_user = nil
end


def remember(user)
  user.remember
end

 # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

=begin
  def sign_in user
    cookies.permanent[:remember_token] = user.remember_token
    #The purpose of this line is to create current_user , accessible in both controllers and
    #views, which will allow constructions such as <%= current_user.name %>, redirect_to current_user
    self.current_user= user

  end

  def current_user= (user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
   !current_user.nil?
  end

  def sign_out
  self.current_user = nil
  cookies.delete :remember_token
  end
=end
end
