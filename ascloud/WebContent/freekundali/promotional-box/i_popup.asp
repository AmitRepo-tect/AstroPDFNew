<style>
#popup{
        visibility: hidden;
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        text-align: center;
        z-index: 200;
        }
#popup .box-area{
        width: 700px;
        margin: 100px auto;
        background-color: #081010;
        background: -webkit-gradient(radial, center center, 0, center center, 460, from(#081010), to(#086963)); 
        background: -webkit-radial-gradient(circle, #086963, #081010); 
        background: -moz-radial-gradient(circle, #086963, #081010);
        background: -ms-radial-gradient(circle, #086963, #081010);
        border: 5px solid #fff;
        text-align: center;
       -moz-box-shadow: inset 0 0 15px 10px #029a91;
       -webkit-box-shadow: inset 0 0 15px 10px #029a91;
        box-shadow: inset 0 0 15px 10px #029a91;
        border-radius: 5px;
        }
.close{
        margin: -20px -20px 0 0;
        float: right;
        display: block;
        width: 30px;
        height: 30px;
        box-shadow: 0 0 0px #666;
        border-radius: 100%;
        background: url(/promotional-box/images/close-btn1.png)no-repeat;
        }
#popup h2{
        display: block;
        padding: 0;
        margin: 0px auto 10px;
        font-size: 36px;
        color: #fff;
        }
.header-area{
        border-bottom: 0px solid #ddd;
        padding: 10px 0 0;
        }
.footer-area{
        border-top: 0px solid #ddd;
        padding: 10px 0;
        }
.content-area{
        border-left: 0px solid #ddd;
        border-right: 0px solid #ddd;
        padding: 5px;
        margin: 0px 5px;
        }
.col1{
        float: left;
        width: 255px;
        height: 322px;
        box-shadow: 5px 0 25px -5px #802c03;
        }
.col2{
        float: right;
        width: 440px;
        }
 .col1-1{
        float: right;
        width: 250px;
        height: 322px;
       
        }
.col2-2{
        float: left;
        width: 440px;
        }
.content-area ul{
        margin: 0 5px;
        }
.content-area li{
        text-align: justify;
        font-family: Georgia,Times,Times New Roman,serif;
        font-size: 18px;
        line-height: 28px;
        color: #fff;
        font-weight: normal;
        list-style-image: url(/promotional-box/images/bullets.png);
        }
.ui-img img{
        border: 0px solid #fff;
        border-radius: 5px;
       -moz-box-shadow: inset 0 0 15px 10px #029a91;
       -webkit-box-shadow: inset 0 0 15px 10px #029a91;
        box-shadow: inset 0 0 15px 10px #029a91;
        opacity:0.1;
        }
#overlay{
        visibility: hidden;
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        background: #000;
        filter: alpha(Opacity = 70);
        opacity: 0.7;
       -moz-opacity: 0.7;
       -khtml-opacity: 0.7;
        z-index: 1;
        }
 .pro-btn {	
	padding: 0px 25px;	
	height:50px;
	float:left;
	margin:0 10px;
	background: -moz-linear-gradient(top, #ffffff 0%,#ebebeb 50%,#dbdbdb 50%,#b5b5b5);
	background: -webkit-gradient(linear, left top, left bottom,	from(#ffffff),	color-stop(0.50, #ebebeb),	color-stop(0.50, #dbdbdb),	to(#b5b5b5));
   -moz-border-radius: 10px;
   -webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #949494;
	text-decoration:none;
   -moz-box-shadow:0px 1px 3px rgba(000,000,000,0.5),inset 0px 0px 2px rgba(255,255,255,1);
   -webkit-box-shadow:	0px 1px 3px rgba(000,000,000,0.5),	inset 0px 0px 2px rgba(255,255,255,1);
	box-shadow:	0px 1px 3px rgba(000,000,000,0.5),	inset 0px 0px 2px rgba(255,255,255,1);
	text-shadow:0px -1px 0px rgba(000,000,000,0.2),	0px 1px 0px rgba(255,255,255,1);
	}
 .pro-btn a{
    font-family: Helvetica, sans-serif;
	font-size: 24px;
	color: #050505;
	text-decoration:none;
	line-height:50px;
	}

</style>
<script>
    function showPopup() {
        //alert('vijay');       
        ovr = document.getElementById("overlay")
        pop = document.getElementById("popup");
        ovr.style.visibility = (ovr.style.visibility == "visible") ? "hidden" : "visible";
        pop.style.visibility = (pop.style.visibility == "visible") ? "hidden" : "visible";
    }
    function closePopup() {
        document.getElementById("overlay").style.visibility = 'hidden';
        document.getElementById("popup").style.visibility = 'hidden';
    }
</script>

<div id="overlay">
</div>
<div id="popup">
    <div class="box-area">
        <a href="javascript:closePopup()" class="close"></a>
      
        <div class="col2-2">
            <div class="header-area">
                <h2 align="center">
                    <img src="/promotional-box/images/matrimony.png" width="250" /></h2>
                <div style="clear: both">
                </div>
            </div>
            <div class="content-area">
                <ul>
                    <li>Learn astrology with astrology masters</li>
                    <li>Tips on improving life</li>
                    <li>How to achieve success in life with astrology</li>
                    <li>Secrets &amp; mysteries of astrology</li>
                </ul>
                <div align="right" style=" margin:25px; 0;">
                 <div class="pro-btn"><a href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1">Join Now</a></div>
                 <div class="pro-btn"><a href="#">No Thanks</a></div>                 
               </div>
                <div style="clear: both">
                </div>
            </div>
            <div class="footer-area">
            </div>
        </div>
          <div class="col1-1">
            <div align="center" style="margin-top: 30px;">
                <img src="/promotional-box/images/marriage.png" width="235" height="250"/></div>           
        </div>
        <div style="clear: both">
        </div>
    </div>
</div>
