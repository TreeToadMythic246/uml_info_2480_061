component {
    function processForms( required struct formData ){
        if( formData.keyExists("isbn13") && formData.isbn13.len() == 13 && formData.keyExists("title") && formData.title.len() > 0 ) {
            var qs = new query( datasource = application.dsource );
            qs.setSql( "
            if NOT exists(select * from books where isbn13=:isbn13)
                insert into books (isbn13,title) values (:isbn13,:title) );
                
            UPDATE books SET
                title=:title
                weight=:weight
                pages=:pages
                year=:year
                WHERE isbn13=:isbn13

            " );
            qs.addParam(
                name = "isbn13",
                cfsqltype = "CF_SQL_NVARCHAR",
                value = trim(formData.isbn13),
                null=formData.isbn13.len()!=13
            );
            qs.addParam(
                name = "title",
                cfsqltype = "CF_SQL_NVARCHAR",
                value = trim(formData.title),
                null=formData.title.len()==0
            );
            qs.addParam(
                name = "pages",
                cfsqltype = "CF_SQL_INTEGER",
                value = trim(formData.pages),
                null=!isValid("numeric",formData.pages)
            );
            qs.addParam(
                name = "year",
                cfsqltype = "CF_SQL_INTEGER",
                value = trim(formData.year),
                null=!isValid("numeric",formData.year)
            );
            qs.addParam(
                name = "weight",
                cfsqltype = "CF_SQL_NUMERIC",
                value = trim(formData.weight),
                null=!isValid("numeric",formData.weight)
            );
            qs.execute();
        }
    }

    function sideNavBooks(){
        var qs = new query(datasource=application.dsource);
        qs.setSql("select * from books");
        return qs.execute().getResult();
    }
}