class UsrController < ApplicationController

 before_action :confirm_signned_in, :except => [:signin, :checkSignin, :signup, :create, :signout, :temporary, :signupAdmin ]
  
  def error 
  end
  def showUsrs
    @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum], :usageType => "کاربر")
  end
  def index
    @usrs = Usr.all
  end
  def admin
    @usr = Usr.find(session[:usr_id])
  end

  def adminUsrManagement
    @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum], :usageType => "کاربر")
  end

  def signin
    @usr = Usr.new()
  end

  def f 
    @usr = Usr.new()
  end
  def signupAdmin
    @usr = Usr.new()
  end

  def signup
    @usr = Usr.new()
  end

  def signout
    session[:usr_id] = nil
    session[:firstN] = nil
    session[:lastN] = nil
    session[:usr_buildingNum] = nil
    session[:monthlybill_id] = nil
    session[:amount] = nil
    flash[:notice] = "خارج شدید"
    redirect_to(:action => 'signin')
  end

  def household
    @usr = Usr.find(session[:usr_id])
  end

  def checkSignin
     if params[:email].present? && params[:password].present?
       found_user = Usr.where(:email => params[:email]).first
    
       if found_user 
         authorized_user = found_user.authenticate(params[:password])
       end
     end

     if authorized_user
       session[:usr_id] = authorized_user.id
       session[:firstN] = authorized_user.firstN
       session[:sureN] = authorized_user.sureN
       session[:usr_buildingNum] = authorized_user.buildingNum
       if authorized_user.usageType == "کاربر"
         flash[:notice] = ".کاربر عزیز شما با موفقیت به سیستم وارد شدید"
         redirect_to(:action => 'household')
       else
         flash[:notice] = "مدیر عزیز شما با موفقیت به سیستم وارد شدید."
         redirect_to(:action => 'admin')
       end
     end
     if authorized_user == nil
	flash[:notice] = "ترکیب ایمیل و رمز کاربری اشتباه است."
     	redirect_to(:action => 'signin')
     end
  end

  def householdEdit
    @usr = Usr.all.find(session[:usr_id])
  end

  def adminEdit
    @usr = Usr.all.find(session[:usr_id])
  end

  def update
    @usr = Usr.find(session[:usr_id])
    @usr.firstN = params[:firstN]
    @usr.sureN = params[:sureN]
    @usr.telNum = params[:telNum]
    @usr.familyNum = params[:familyNum]
    session[:firstN] = @usr.firstN
    session[:sureN] = @usr.sureN

    if @usr.save
      if @usr.usageType == "کاربر"
         flash[:notice] = ".کاربر عزیز شما با موفقیت به سیستم وارد شدید"
         redirect_to(:action => 'household')
       end
       if @usr.usageType ==  "مدیر"
         flash[:notice] = ".مدیر عزیز شما با موفقیت به سیستم وارد شدید"
         redirect_to(:action => 'admin')
      end
    end     
  end
  
  def create
    @usr = Usr.new(usr_params)
    if @usr.save
      session[:usr_id] = @usr.id
      session[:firstN] = @usr.firstN
      session[:sureN] = @usr.sureN
      session[:usr_buildingNum] = @usr.buildingNum
      if @usr.usageType == "کاربر"
         flash[:notice] = ".کاربر عزیز شما با موفقیت به سیستم وارد شدید"
         redirect_to(:action => 'household')
       end
       if @usr.usageType ==  "مدیر"
         flash[:notice] = ".مدیر عزیز شما با موفقیت به سیستم وارد شدید"
         redirect_to(:action => 'admin')
    end
    else
      flash[:notice] = "!مدیر قابل ایجاد نیست"
      redirect_to(:action => 'index')
      #not completed
    end
  end

  def createUsr
    @usr = Usr.new(usr_params)
    if @usr.save
      flash[:notice] = ".کاربری جدید به سیستم اضافه شد"
      redirect_to(:action => 'signup')
    else
      flash[:notice] = "!ایجاد کاربری جدید غیر ممکن است"
      redirect_to(:action => 'signup')
    end
  end
  def edit
    @usr = Usr.find(params[:id])
  end

  def delete
    @usr = Usr.find(params[:id])
  end
  def destroy
    usr = Usr.find(params[:id]).destroy
    flash[:notice] = "Usr destroyed successfully."
    redirect_to(:action => 'admin')
   end
  private

    def usr_params
      params.require(:usr).permit(:usageType, :firstN, :sureN, :telNum, :familyNum, :email, :password, :password_confirmation, :buildingNum, :cash)
    end
end
