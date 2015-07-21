class BillController < ApplicationController
  before_action :confirm_signned_in
  before_action :find_monthlybill

  def viewMbill
    @mbill = Monthlybill.find(params[:monthlybill_id])
    @bills = Bill.all.where(:monthlybill_id => params[:monthlybill_id])
  end

  def addBill
    @bill = Bill.new(:monthlybill_id => params[:monthlybill_id])
  end
  def index
  end

 
  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      flash[:notice] = "قبض جدید ایجاد شد"
      redirect_to( :action => 'viewMbill', :controller => 'bill', :monthlybill_id => @bill.monthlybill_id)
    else
      flash[:notice] = "قبض جدید قابل ایجاد نیست"
      redirect_to( :action => 'viewMbill', :controller => 'bill')
    end
  end
  private

  def bill_params
    params.require(:bill).permit(:monthlybill_id, :billType, :name, :amount, :description)
  end
  def find_monthlybill
      if params[:subject_id]
        @monthlybill = Monthlybill.find(params[:monthlybill_id])
      end
    end

end
