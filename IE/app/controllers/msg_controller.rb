class MsgController < ApplicationController
  before_action :confirm_signned_in
  before_action :find_usr

  def adminMessageManagement
   @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum], :usageType => "کاربر")
  end

  def usrMessageManagement
   @usrs = Usr.all.where(:buildingNum => session[:usr_buildingNum])
  end

  def usrSendNewMsg
    if params[:recipient_email] != nil
      @hasReciver = params[:recipient_email]
    end
  end

  def usrSeeMsgList
   @sendedMsgs = Msg.all.where(:sender_id => session[:usr_id], :sender_buildingNum => session[:usr_buildingNum])
   @recievedMsgs = Msg.all.where(:recipient_id => session[:usr_id], :recipient_buildingNum => session[:usr_buildingNum])
  end

  def adminSendNewMsg
    if params[:recipient_email] != nil
      @hasReciver = params[:recipient_email]
    end
    @msg = Msg.new(:sender_id => params[:sender_id], :sender_buildingNum => session[:usr_buildingNum])
  end

  def adminSeeMsgList
   @sendedMsgs = Msg.all.where(:sender_id => session[:usr_id], :sender_buildingNum => session[:usr_buildingNum])
   @recievedMsgs = Msg.all.where(:recipient_id => session[:usr_id], :recipient_buildingNum => session[:usr_buildingNum])
  end

  def usrViewMsg
    @msg = Msg.find(params[:id])
  end

  def adminViewMsg
    @msg = Msg.find(params[:id])
  end
 
  def update
    @sender = Usr.find(session[:usr_id])
    @recipient = Usr.find_by_email(params[:recipient_email])
    @msg = Msg.new()
    @msg.subject = params[:subject]
    @msg.sender_id = session[:usr_id] 
    @msg.sender_buildingNum = session[:usr_buildingNum]
    @msg.sender_email = @sender.email
    @msg.recipient_id = @recipient.id
    @msg.recipient_buildingNum = @recipient.buildingNum
    @msg.recipient_email = params[:recipient_email]
    @msg.body = "" + params[:attachment]
    @msg.body += params[:body]
    if @msg.save
      flash[:notice] = "پیغام جدید ارسال شد"
    else
      flash[:notice] = "پیغام جدید ارسلا نشد"
    end
  
    if @usr.usageType ==  "مدیر"
       redirect_to(:action => 'adminSeeMsgList')
    else
      redirect_to(:action => 'usrSeeMsgList')
    end
  end


  private

  def msg_params
    params.require(:msg).permit(:subject, :sender_id, :sender_buildingNum, :sender_email, :recipient_id, :recipient_buildingNum, :recipient_email, :body , :attachment)
  end
  def find_usr
      @usr = Usr.find(session[:usr_id])
  end
end
