
<cfhttp url="http://www.omdbapi.com/?s=#attributes.search#&apikey=b96cf171&plot=full" method="get"  result="httpResponseUBL" charset="utf-8">
</cfhttp> 
<cfset xx = "#DeserializeJSON(httpResponseUBL.filecontent)#">
<cfset length2 = attributes.length2 +1>
<cfset length = attributes.length>
<input type="hidden" value="1" name="calisti" id="calisti">

<div class="row" style="text-align:left">
    <cfloop from="#length2#" to="#length#" index="aa">
       <!--- Filmlere Teker Teker Ulaşmak İçin kullandığımız Api--->
        <cfhttp url="http://www.omdbapi.com/?t=#xx.Search[aa].Title#&apikey=b96cf171&plot=full" method="get"  result="httpResponseUBL" charset="utf-8"> </cfhttp> 
        <cfset movie = "#DeserializeJSON(httpResponseUBL.filecontent)#">
          <!--- Filmlere Teker Teker Ulaşmak İçin kullandığımız Api--->
        <div class="col-xl-6 col-md-6 bg-white mx-auto row" style="margin-top:25px">
          <!--- <cfdump var="#movie#"> --->
            <div class="col-xl-6 " style="align:center">
            <center> <img src="<cfoutput>#movie.poster#</cfoutput>" style="width: 100%;height: 400px;background-size: contain"/> <center>  
            </div>
          
            <div class="col-xl-6  bg-white" >
              <div class="header"> <br><h5> <cfoutput>#movie.Title# </cfoutput></h5></div>
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
   
</div>
 