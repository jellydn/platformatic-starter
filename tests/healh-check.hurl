GET http://localhost:3042/health/check

HTTP 200
[Asserts]
jsonpath "$.ok" == true
