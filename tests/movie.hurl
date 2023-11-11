GET http://localhost:3042/movies

HTTP 200
[Asserts]
jsonpath "$" exists
jsonpath "$" count == 0
