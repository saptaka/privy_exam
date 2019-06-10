**First of all after clone the project**
1. go mod tidy
2. go mod vendor
3. Make sure postgre 11 already installed
4. use pg_dump to restore database based on file privyID_test.sql
5. Set up config.json file

**How to run**
go run .

**API**
this application use port 8988

**How to use the API**
 1. Get Product 
     {url}:{port}/product/{name}
    API to get list product by name
    example result :
        

 2. GET    /category/{name}
 3. GET    /image/{name}
 4. POST   /insertProduct
 5. POST   /insertCategory
 6. POST   /insertImage
 7. PUT    /setProduct/{column}
 8. PUT    /setCategory/{column}
 9. PUT    /setImage/{column}
 10. DELETE /delProduct/{id}
 11. DELETE /delCategory/{id}
 12. DELETE /delImage/{id}

