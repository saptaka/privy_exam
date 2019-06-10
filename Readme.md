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
    API to get list product by name
        

 2. GET    /category/{name}
  API to get list category by name

 3. GET    /image/{name}
  API to get list image by name

 4. POST   /insertProduct
  API to post data product using json format

 5. POST   /insertCategory
  API to post data category using json format

 6. POST   /insertImage
 API to post data image using json format

 7. PUT    /setProduct/{column}
  API to update product data in database

 8. PUT    /setCategory/{column}
 API to update category data in database

 9. PUT    /setImage/{column}
   API to update image data in database

 10. DELETE /delProduct/{id}
  API to delete product by id

 11. DELETE /delCategory/{id}
   API to delete delete by id

 12. DELETE /delImage/{id}
    API to delete image by id


Format JSON

Product :

{
    "id":"1234",
    "name":"sapta",
    "Description":"human being",
    "enable":"true"
}

Category :

{
    "id":"4321",
    "name":"human",
    "enable":"false"
}

Image :

{
    "id":007",
    "name":"Photos",
    "File":"signature.jpeg",
    "enable":"true"
}