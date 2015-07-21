class ChargeController < ApplicationController
  before_action :confirm_signned_in
  before_action :find_admin
  before_action :find_monthlybill, :except => [:usrChargeView, :usrChargeDetail, :adminChargeView]

  def adminChargeView
    @charges = Charge.all.where(:buildingNum_id => session[:usr_buildingNum])
  end
  
  def usrChargeDetail
   @charge = Charge.find( params[:id])
   @allBillsOfTheMonth = Bill.where(:monthlybill_id => @charge.monthlybill_id)
  end  

  def usrChargeView
    @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum], :usageType => "کاربر")
    @chs = Charge.all.where(:usr_id => session[:usr_id])
  end

  def computeCharge
    @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum] , :usageType => "کاربر")
    @totalNum = 0
    @usrs.each do |myusr|
      @totalNum = @totalNum + myusr.familyNum
    end
     
    @usrs.each do |myusr|
      @charge = Charge.new()
      @charge.buildingNum_id = myusr.buildingNum
      @charge.usr_id = myusr.id
      @charge.amount = @monthlybill.totalAmount.to_i / @totalNum.to_i
      @charge.amount = @charge.amount.to_i * myusr.familyNum.to_i
      @charge.monthlybill_id = @monthlybill.id
      @charge.chargeMonth = @monthlybill.month
      @charge.chargeYear = @monthlybill.year
      @charge.chargeDescription = @monthlybill.description
      @charge.save 
    end

    flash[:notice] = ".سر ضبظ به همه ارسال شد"
    redirect_to(:action => 'admin', :controller => 'usr')
  end

  private
  def charge_params
      params.require(:charge).permit(:buildingNum_id, :usr_id, :monthlybill_id, :chargeMonth, :chargeYear, :amount, :chargeDescription)
    end  

  def find_admin
    @admin = Usr.find(session[:usr_id])
  end
  def find_monthlybill
    @monthlybill = Monthlybill.find(params[:monthlybill_id])
  end
end
