class MonthlybillController < ApplicationController
  before_action :confirm_signned_in
  def index
    @monthlybills = Monthlybill.all.where(:usr_buildingNum => session[:usr_buildingNum])
  end
  def MonthlyBillBox
   
  end
  def adminMonthlybillManagement
    @monthlybills = Monthlybill.all.where(:usr_buildingNum => session[:usr_buildingNum])
    @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum])
  end

  def Management_all
    @monthlybills = Monthlybill.all.where(:usr_buildingNum => session[:usr_buildingNum])
  end

  def Management_search
    if params[:year] != nil && params[:month] != nil
       @monthlybills = Monthlybill.all.where(:usr_buildingNum => session[:usr_buildingNum], :month => params[:month], :year => params[:year])
    end
    if params[:year] == "*" && params[:month] == "*"
	@monthlybills = Monthlybill.all
    end
    if @monthlybills
       session[:monthlybill_search_respond] = "نتایج جستجو عبارت اند از"
    end
  end
  def Managment_create
  end

  def checkMonthlybill
  end
  def create
    @monthlybill = Monthlybill.new(monthlybill_params)
    if @monthlybill.save
      flash[:notice] = ".سر قبض جدید ایجاد شد"
      redirect_to( :action => 'adminMonthlybillManagement', :controller => 'monthlybill')
    else
      flash[:notice] = ".سر قبض جدید قابل ایجاد نیست"
      redirect_to( :action => 'adminMonthlybillManagement', :controller => 'monthlybill')
    end
  end
  def update
    @monthlybill = Monthlybill.find(params[:id])
    @monthlybill.totalAmount = params[:totalAmount]
    @monthlybill.totalInnerBills = params[:totalInnerBills]
    if params[:description] && @monthlybill.description
      @monthlybill.description = @monthlybill.description + ". " + params[:description]
    else
    @monthlybill.description = params[:description] 
    end
    session[:monthlybill_id] = nil
    if @monthlybill.save
	flash[:notice] = ".سر قبظ آپدیت شد"
        redirect_to(:action => 'adminMonthlybillManagement', :controller => 'monthlybill')
    else
        redirect_to(:action => 'signin', :controller => 'usr')
    end
  end
  private

    def monthlybill_params
      params.require(:monthlybill).permit(:id, :usr_id, :usr_buildingNum, :month, :year, :totalInnerBills, :totalAmount, :totalCash, :description)
    end      
end
