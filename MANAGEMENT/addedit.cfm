<cftry><cfdump var="#form#" />
    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
    
    <div class="row">
        <div id="main" class="col-9">
            <cfoutput>#mainForm()#</cfoutput>
        </div>

        <div id="leftgutter" class="col-lg-3 order-first">
            <cfoutput>#sideNav()#</cfoutput>
        </div>
    </div>
    <cfcatch type="any">
        <cfoutput>#cfcatch.Message#</cfoutput>
    </cfcatch>
</cftry>

<cffunction name="mainForm">
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13" value="" placeholder="Enter the ISBN13" class="form-control"/>                
                <label for="isbn13">ISBN13:</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="isbn" name="isbn" placeholder="Enter the ISBN" class="form-control"/>
                <label for="title">ISBN10:</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" placeholder="Enter the Book Title" class="form-control"/>
                <label for="title">Book Title</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="weight" name="weight" placeholder="Enter the Book Weight" class="form-control"/>
                <label for="title">Book Weight</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="year" name="year" placeholder="Enter the Year Published" class="form-control"/>
                <label for="title">Year Published</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="pages" name="pages" placeholder="Enter the Amount of Pages" class="form-control"/>
                <label for="title">Amount of Pages</label>
            </div>
          
            <button type="submit" class="btn btn-primary">Add Book</button>
        </form>
    </cfoutput>
</cffunction>

<cffunction name="sideNav">
    <cfset allBooks = addEditFunctions.sideNavBooks()>
    <div>
        Book List
    </div>
    <cfoutput>
        <ul class="nav flex-column">
            <cfloop query="allBooks">
                <li class="nav-item">
                    <a class="nav-link">#trim(allBooks.title)#</a>
                </li>
            </cfloop>
        </ul>
    </cfoutput>
</cffunction>
