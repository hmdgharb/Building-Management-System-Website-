class ReciptController < ApplicationController
  def usrReciptVeiw
    @recipts = Recipt.all.where(:usr_id => session[:usr_id], :buildingNum_id => session[:usr_buildingNum])
  end

  def usrReciptDetail
     @allBillsOfTheMonth = Bill.all.where(:monthlybill_id => session[:monthlybill_id])
    @recipt = Recipt.find_by_usr_id(params[:usr_id])
    @mbill = Monthlybill.find(@recipt.monthlybill_id)

  end
  
  def reciptCompute
    @monthlybill = Monthlybill.find(session[:monthlybill_id])
    @recipt = Recipt.new(:monthlybill_id => @monthlybill.id, :buildingNum_id => session[:usr_buildingNum], :usr_id => session[:usr_id], :Month => @monthlybill.month, :Year => @monthlybill.year, :amount => session[:amount])
    if @recipt.save
      @charges = Charge.where(:usr_id => session[:usr_id], :buildingNum_id => session[:usr_buildingNum])
      @charge = @charges.find_by_monthlybill_id(session[:monthlybill_id])
      @charge.destroy
      flash[:notice] = "عملیات پرداخت با موفقیت انجام شد"
      redirect_to( :action => 'usrReciptVeiw', :controller => 'recipt')
    else
      flash[:notice] = "عملیات پرداخت ناموفق بود"
      redirect_to( :action => 'usrReciptVeiw', :controller => 'recipt')
    end
  end

  def recipt_params
    params.require(:recipt).permit(:monthlybill_id, :buildingNum_id, :usr_id, :Month, :Year, :amount )
  end

end
