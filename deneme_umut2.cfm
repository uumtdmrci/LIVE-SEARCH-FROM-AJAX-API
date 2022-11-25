 <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"> </script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

 <style>
    #headersearch input::-webkit-search-decoration,
    #headersearch input::-webkit-search-cancel-button {
      display: none; 
    }
    #headersearch input[type=search] {
      outline: none;
      width: 100%;
      padding-left: 10px;
      color: transparent;
      cursor: pointer;
      background: #fff url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center;
      border: 2px solid #00457e;
      padding: 9px 10px 9px 32px;
      width: 200px;
      
      -webkit-border-radius: 10em;
      -moz-border-radius: 10em;
      border-radius: 10em;
      
      -webkit-transition: all .5s;
      -moz-transition: all .5s;
      transition: all .5s;
    }
    #headersearch input[type=search]:hover {
      background-color: #fff;
    }
    #headersearch input[type=search]:focus {
      width: 50%;
      padding-left: 32px;
      color: #000;
      background-color: #fff;
      cursor: auto;
       background: #fff url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center; <!--- İstersek searche tıklandığındaki iconu değiştirebiliriz. --->
      background-color: #fff;
      border: 2px solid #00457e;
    }
    #headersearch input:-moz-placeholder {
      color: transparent;
     }
    #headersearch input::-webkit-input-placeholder {
      color: transparent;
    }
  .center {
    padding:25px;
    margin: auto;
   }

  .back-to-top {
    position: fixed;
    bottom: 0;
    right: 0;
    display: inline-block;  
    padding: 1em;
    margin: 1em;
    color:white;
    background: #6bb4c1;
    border: 2px solid #000;
  }
  .back-to-top:hover {
    cursor: pointer;
  }
  #pp {
        display: -webkit-box;
        -webkit-line-clamp: 6;
        -webkit-box-orient: vertical;  
        overflow: hidden;      
    }
  .flex-center {z-index: 1;}
</style> 
<cfparam name="attributes.search" default="">

<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<input type="hidden" value="0" name="calisti2" id="calisti2">
<cfhttp url="http://www.omdbapi.com/?s=#attributes.search#&apikey=b96cf171&plot=full" method="get"  result="httpResponseUBL" charset="utf-8">
</cfhttp> 
<cfset xx = "#DeserializeJSON(httpResponseUBL.filecontent)#">
<cfif isDefined("xx.search")>
  <cfset length = arrayLen(xx.search)>
<cfelse>
   <cfset length = 0>
</cfif>
<div class="header" id="page_start" style="margin-top:2%"></div>
 <div class="container" style="margin-bottom:5%" >
  <div class="col-xl-12 bg-white col-xl-12" style="height:1050px" > 
      <div class="center" style="text-align:center">
             
          <cfform name="arama_form" id="headersearch" method="post" action="#request.self#?fuseaction=#module_name#.deneme_umut2">
            <cfif isdefined("attributes.search")>
              <cfinput type="hidden" name="search2" id="search2" value="#attributes.search#">
            </cfif>
              <cfinput type="hidden" name="length2" id="length2" value="4">
              <cfinput type="hidden" name="length" id="length" value="#length#">
            <input type="search" name="search" id="search" placeholder="Bulmak istediğiniz filmin adını yazınız" required>
          </cfform>
        <div class="flex row" style="text-align:center;display: flex;align-items: center;justify-content: center;" >
            <div class="col-xl-12 col-xl-12"  id="live_search" style=";margin-top:0"> 
             
            </div>
        </div>
      </div> 
  </div> 
 
  <div class="col-xl-12 bg-white col-xl-12" style=";margin-top:5%"> 
      <div class="card">
        <div class="card-body">
          <div class="col-md-12 row" style="  border-bottom: 5px solid #6bb4c1;">
              <div class="col-md-6"style="text-align:center" >
                <p class="card-text">   <h3 style="color:#6bb4c1"><cfoutput>#attributes.search#</cfoutput> İçin Sonuçlar </h3> </p>
              </div>
               <div class="col-md-6" style="text-align:center">
                <p class="card-text" > <h4><span id="sonucadet" style="color:gray"></span> <span style="color:gray"> <cfoutput>#length#</cfoutput> Film Bulundu </span></p></h4>
              </div>
           </div>
         </div>
      </div>
      <cfif isdefined("attributes.search") and len(attributes.search)>
      <div class="row" style="text-align:left" id="infinityblog">
        <cfloop from="1" to="4" index="aa">
            <!--- Filmlere Teker Teker Ulaşmak İçin kullandığımız Api--->
              <cfhttp url="http://www.omdbapi.com/?t=#xx.search[aa].title#&apikey=b96cf171&plot=full" method="get"  result="httpResponseUBL" charset="utf-8"> </cfhttp> 
              <cfset movie = "#DeserializeJSON(httpResponseUBL.filecontent)#">
          <!---     <cfif aa eq 1>
                <cfdump var="#movie#">
              </cfif>  --->
            <!--- Filmlere Teker Teker Ulaşmak İçin kullandığımız Api--->
            <div class="col-xl-6 col-md-6 bg-white mx-auto row" style="margin-top:25px">
                <div class="col-xl-6 " style="align:center">
                 <center> <img src="<cfoutput>#movie.poster#</cfoutput>" style="width: 100%;height: 400px;background-size: contain"/> <center>  
                </div>
               
                <div class="col-xl-6  bg-white" >
                  <div class="header"> <br><h5> <cfoutput>#movie.Title#</cfoutput></h5></div>
                    <div  style="margin-top:3rem;">
                        <img src="https://w7.pngwing.com/pngs/181/181/png-transparent-star-shape-icon-blue-star-blue-star-shape-blue-angle-triangle.png" height="25" style="float:left"><span style="color:gray;font-size:20px"> <cfoutput>#movie.imdbRating#</cfoutput> / <span style="font-size:16px">10</span></span>
                         <br> <br> 
                        <b>Dil : </b> <cfoutput>#movie.language#</cfoutput>  <br>
                        <b>Oyuncular : </b>  <cfoutput>#movie.actors#</cfoutput>
                        <a href="https://www.tasarimkodlama.com/" style="text-decoration: ">  <u style="color:black;white-space: pre;"> | Tüm listeyi gör »  </u></a>
                          <br>
                         <p id="pp"> <cfoutput>#movie.plot#</cfoutput></p>
                        <a href="https://www.tasarimkodlama.com/" style="color:black " >  Detaylar » </a>
                     </div>
                 </div>
             </div>  
         </cfloop> 
         
         <div class="col-xl-12 bg-white col-xl-12" style=";margin-top:5%;text-align:center"> <hr>  <br><H5>  <div class="back-to-top">Başa Dön</div></H5> <br> </div>
      </div> 
    </cfif>
  </div>
</div>

<script>
    var $backToTop = $(".back-to-top");
    $backToTop.hide();


    $(window).on('scroll', function() {
      if ($(this).scrollTop() > 100) {
        $backToTop.fadeIn();
      } else {
        $backToTop.fadeOut();
      }
    });

    $backToTop.on('click', function(e) {
      $("html, body").animate({scrollTop: 0}, 500);
    });
</script>

 

 
    <script>
       var typingTimer;                //timer identifier
        var doneTypingInterval = 1000;  //time in ms, 5 second for example
      $('#search').keyup(function(){
          clearTimeout(typingTimer);
          if ($('#search').val) {
            $("#live_search").html(``);
              typingTimer = setTimeout(function(){
                var searchh = $('#search').val();
                $.ajax({
                      url: `http://www.omdbapi.com/?s=${searchh}&apikey=b96cf171&plot=full`,
                      type: "GET",
                      dataType: "json",
                      success: function (data) {
                           for (let i = 0; i < 2; i++) {
                             <!--- İç İçe Ajax --->
                              $.ajax({
                                    url: `http://www.omdbapi.com/?t=${data.Search[i].Title}&apikey=b96cf171&plot=full`,
                                    type: "GET",
                                    dataType: "json",
                                    success: function (data) {
                                          <!--- Append --->
                                            $("#live_search").append(`
                                                  <div class="row" style="margin-top:2%">
                                                    <div class="col-xl-6 col-md-6 bg-light mx-auto row flex-center " style="margin-top:-5px">
                                                        <div class="col-xl-6 " style="align:center;">
                                                          <center> <img src="${data.Poster}"  style="width: 100%;height: 400px;background-size: contain"/> <center>
                                                        </div>
                                                        <div class="col-xl-6  bg-light " >
                                                          <div class="header"> <br><h5> ${data.Title}</h5></div>
                                                            <div  style="margin-top:0;">
                                                                <img src="https://w7.pngwing.com/pngs/181/181/png-transparent-star-shape-icon-blue-star-blue-star-shape-blue-angle-triangle.png" height="25" style="float:left"><span style="color:gray;font-size:20px">${data.imdbRating} / <span style="font-size:16px">10</span></span>
                                                                <br> <br> 
                                                                <b>Dil : </b> ${data.Language} <br>
                                                                <b>Oyuncular : </b>  ${data.Actors}
                                                                <a href="" style="text-decoration: ">  <u style="color:black;white-space: pre;"> | Tüm listeyi gör »  </u></a>
                                                                  <br>
                                                                <p id="pp"> ${data.Plot}</p>
                                                                <a href="" style="color:black " >  Detaylar » </a>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                  </div> 
                                                `
                                              ); 
                                          <!--- Append --->   
                                            if(i ==0)
                                            {
                                              
                                              var add_div = `
                                                  <div class="row">
                                                    <div class="col-xl-6 col-md-6 bg-light mx-auto row flex-center " style="margin-top:-5px">
                                                         <div class="col-xl-12  bg-light " >
                                                          <div class="header"> <br><h5>  Daha Fazla Göster </h5></div>
                                                            <div  style="margin-top:0;">
                                                                
                                                            </div>
                                                        </div>
                                                    </div> 
                                                  </div> 
                                                    `
                                          <!--- Append --->
                                              $("#live_search").append(add_div); 
                                          <!--- Append ---> 
                                        }
                                        },

                                    error: function () {
                                        console.log("Something went wrong");
                                    },
                              });  
                            <!--- İç İçe Ajax --->
                          
                           }
                      },
                      error: function () {
                          console.log("Something went wrong");
                      },
                });  
              }, doneTypingInterval);
          }
      });

    </script>
 

<cfif len(attributes.search)>
<script>

  var i = 2;

      $(document.body).on('touchmove', onScroll); // for mobile
      $(window).on('scroll', onScroll); 

      function onScroll(){ 
          if( $(window).scrollTop() + window.innerHeight >= document.body.scrollHeight ) { 
              
              getir();
          }
      }
  
  function getir(){
    
    if($('#calisti2').val()==1){
      
    }
    else{
      var searchh = $('#search2').val();
      var length = $('#length').val();
      var length2 = $('#length2').val();
      if ($('#search').val) {
      var test="test";    
      var send_address = "http://offtrade.online/index.cfm?fuseaction=offtrade.popup_deneme_umut2_2&search="+ searchh+"&length="+length +"&length2="+length2;
      console.log(send_address);
      var response;
        $.ajax({ 
            type: "POST",   
            url: send_address,   
            async: true,
            data:{
                item_id: i, 
                },
            success : function(text)
            {	  
                console.log(text); 
                  response=text;
                $('#infinityblog').append(text);  
                var a=$('#calisti').val();
                $('#calisti2').val(a);
                
                
            },
            error: function () {
                  alert("Bağlantı Başarısız");
              },
        }); 
        i++; 
      } 
    }
    
  }
</script>
</cfif>
