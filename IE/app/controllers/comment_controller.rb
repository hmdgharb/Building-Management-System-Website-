class CommentController < ApplicationController
       
  def goodRatingCompute
    @rating = Rating.where(:clicker_id => session[:usr_id]).find_by_commentid(params[:id])

    if @rating == nil  
        @rt = Rating.new(:commentid => params[:id], :clicker_id => session[:usr_id], :buildingNum_id => session[:usr_buildingNum])
        @rt.save
        @comment = Comment.all.find(params[:id])
        @comment.likePoint = @comment.likePoint + 1
        @comment.save
    end
    if params[:commentType] == 'usrelevator'
      redirect_to(:action => 'usrElevator')
    elsif  params[:commentType] == 'usrgarden'  
      redirect_to(:action => 'usrGarden')
    elsif  params[:commentType] == 'usrLoby'  
      redirect_to(:action => 'usrLoby')
    elsif  params[:commentType] == 'adminElevator'  
      redirect_to(:action => 'adminElevator')
    elsif  params[:commentType] == 'adminGarden'  
      redirect_to(:action => 'adminGarden',:controller => 'comment')
    elsif  params[:commentType] == 'adminLoby'  
      redirect_to(:action => 'adminLoby')
    end
   
  end

  def notgoodRatingCompute
    @rating = Rating.where(:clicker_id => session[:usr_id]).find_by_commentid(params[:id])

    if @rating == nil  
        @rt = Rating.new(:commentid => params[:id], :clicker_id => session[:usr_id], :buildingNum_id => session[:usr_buildingNum])
        @rt.save
        @comment = Comment.all.find(params[:id])
        @comment.dislikePoint = @comment.dislikePoint + 1
        @comment.save
    end
    if params[:commentType] == 'usrelevator'
      redirect_to(:action => 'usrElevator')
    elsif  params[:commentType] == 'usrgarden'  
      redirect_to(:action => 'usrGarden')
    elsif  params[:commentType] == 'usrLoby'  
      redirect_to(:action => 'usrLoby')
    elsif  params[:commentType] == 'adminElevator'  
      redirect_to(:action => 'adminElevator')
    elsif  params[:commentType] == 'adminGarden'  
      redirect_to(:action => 'adminGarden')
    elsif  params[:commentType] == 'adminLoby'  
      redirect_to(:action => 'adminLoby')
    end
  end

  def usrLoby
    @allCommentsOfLoby = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'loby')
  end

  def usrGarden
    @allCommentsOfGarden = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'garden')
  end

  def adminLoby
    @allCommentsOfLoby = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'loby')
  end

  def usrElevator
    @allCommentsOfElevator = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'elevator')
  end

  def adminElevator
    @allCommentsOfElevator = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'elevator')
  end


  def adminGarden
    @allCommentsOfGarden = Comment.all.where(:buildingNum_id => session[:usr_buildingNum], :commentType => 'garden')
  end

  def update
    @comment = Comment.new()
    @comment.buildingNum_id = session[:usr_buildingNum]
    @comment.usr_id = session[:usr_id]
    @comment.message = params[:message]
    @comment.usr_firstN = session[:firstN]
    @comment.likePoint = 0
    @comment.dislikePoint = 0
    @comment.commentType = params[:commentType]

    if params[:commentType] == 'admingarden' ||  params[:commentType] == 'usrgarden' 
     @comment.commentType = 'garden'
    elsif params[:commentType] == 'adminloby' ||  params[:commentType] == 'usrloby'  
     @comment.commentType = 'loby'
    elsif params[:commentType] == 'adminelevator' || params[:commentType] == 'usrelevator'
     @comment.commentType = 'elevator'
    end
    if @comment.save
      flash[:notice] = "نظر شما ثبت شد"
    else
      flash[:notice] = "نظر شما ثبت نشد"
    end

    if params[:commentType] ==  "usrgarden"
       redirect_to(:action => 'usrGarden')
    elsif params[:commentType] == "usrelevator"
      redirect_to(:action => 'usrElevator')
    elsif params[:commentType] == "usrloby"
      redirect_to(:action => 'usrLoby')
    elsif params[:commentType] ==  "admingarden"
       redirect_to(:action => 'adminGarden')
    elsif params[:commentType] == "adminelevator"
      redirect_to(:action => 'adminElevator')
    elsif params[:commentType] == "adminloby"
      redirect_to(:action => 'adminLoby')
    end
    
  end

  private

    def comment_params
      params.require(:comment).permit(:buildingNum_id, :usr_id, :usr_firstN, :message, :likePint, :dislikePoint, :commentType)
    end
  
  
end
