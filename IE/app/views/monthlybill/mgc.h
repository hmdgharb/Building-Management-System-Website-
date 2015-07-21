    <!DOCTYPE html>
    <html lang="en">
    <head>
	<meta charset="utf-8"> 
    <title>مدیریت ساختمان</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	 <link href="css/bootstrap.css" rel="stylesheet" media="screen">
	</style>

    </head>
    <body style="background:#CCD6F5; background:url('/assets/1.jpg')">
 <div class="container" >
        <div class="navbar navbar-fixed-top-right">
         <div class="navbar-inner ">
          <div class="container myRight">
      <a class="brand myRight" href="#">تنظیمات</a>
   <% if !session[:usr_id].blank?  %>
      <a class="brand myRight myWidth25" href="/usr/signout">خروج</a>
   <% end %>
    </div><!-- /.container -->
  </div><!-- /.navbar-inner -->
</div><!-- /.navbar -->
	  <div class="hero-unit">
	  
    <div id="this-carousel-id" class="carousel slide"><!-- class of slide for animation -->
  <div class="carousel-inner">
    <div class="item active"><!-- class of active since it's the first item -->
      <img src="http://placehold.it/1200x480" alt="" />
      <div class="carousel-caption">
        <p>نظرها پیرامون لابی</p>
      </div>
    </div>
    <div class="item">
      <img src="http://placehold.it/1200x480" alt="" />
      <div class="carousel-caption">
        <p>نظر ها پیرامون راه پله ها</p>
      </div>
    </div>
    <div class="item">
      <img src="http://placehold.it/1200x480" alt="" />
      <div class="carousel-caption">
        <p>نظرها پیرامون حیاط</p>
      </div>
    </div>
    <div class="item">
      <img src="http://placehold.it/1200x480" alt="" />
      <div class="carousel-caption">
        <p>نظرها پیرامون راهروها</p>
      </div>
    </div>
  </div><!-- /.carousel-inner -->
  <!--  Next and Previous controls below
        href values must reference the id for this carousel -->
    <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
</div><!-- /.carousel -->

 </div>


 	<div class="row-fluid">

        <div class=" well pull-right" style="background: #E6EAFA ; width: 23%;">
             <ul class="nav nav-list text-right">
    <li ><a href="/usr/admin">صفحه اصلی مدیر</a></li>
    <li ><a href="/usr/signup">مدیریت اعضا</a></li>
    <li class="active"><a href="/monthlybill/Management_create">مدیریت قبوض</a></li>
    <li><a href="#">مدیریت پیغام ها</a></li>
        <li><a href="#">گزارش پرداخت ها</a></li>


</ul>
         </div>




 
	
        <div class=" well pull-left" style="background: #E6EAFA ; width: 63%; height: 150px;">
 	  <div class="pull-right" style="background: #E6EAFA ; width: 23%;">
             <ul class="nav nav-list text-right">
	    	<li class="active"><a href="/monthlybill/Management_create">ایجاد</a></li>
    		<li><a href="/monthlybill/Management_search">جستجو</a></li>
            </ul>
	  </div>
        <%= form_for(:monthlybill, :url => {:action => 'create' } ) do |f| %>
		 
          <div class="pull-left" > 
                <%= render(:partial => "newMonthlybillForm", :locals => {:f => f}) %> 
                 <%= submit_tag("ذخیره", :class => "btn btn-primary pull-right" ) %> 
                <% end %> 

          </div>

<%if !flash[:notice].blank? %>
        <%= flash[:notice] %>
        <% flash[:notice] = nil %> 
  <% end %>
       
    </div>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script>
  $(document).ready(function(){
    $('.carousel').carousel();
  });
</script>
    </body>
    </html>
