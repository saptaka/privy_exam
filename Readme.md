**Installation Program **
1. Install Golang in your OS (https://golang.org/doc/install)
2. Install Postgre in your OS (https://www.postgresql.org/docs/11/tutorial-install.html)
3. Restore Database to your Postgre Database ( use pg_dump to restore database based on file privyID_test.sql)
4. Git Clone https://github.com/saptaka/privy_exam.git
5. Have Fun


**First of all after clone the project**
1. go mod tidy
2. go mod vendor
3. Make sure postgre 11 already installed
4. use pg_dump to restore database based on file privyID_test.sql
5. Set up config.json file

**How to run**
go run .

**How to Build**
go build


**API**
this application use port 8988

**How to use the API**
 1. Get Product {url:port}/category/{name}
    API to get list product by name
        

 2. GET    {url:port}/category/{name}
  API to get list category by name

 3. GET    {url:port}/image/{name}
  API to get list image by name

 4. POST   {url:port}/insertProduct
  API to post data product using json format

 5. POST   {url:port}/insertCategory
  API to post data category using json format

 6. POST   {url:port}/insertImage
 API to post data image using json format

 7. PUT    {url:port}/setProduct/{column}
  API to update product data in database

 8. PUT    {url:port}/setCategory/{column}
 API to update category data in database

 9. PUT    {url:port}/setImage/{column}
   API to update image data in database

 10. DELETE {url:port}/delProduct/{id}
  API to delete product by id

 11. DELETE {url:port}/delCategory/{id}
   API to delete delete by id

 12. DELETE {url:port}/delImage/{id}
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