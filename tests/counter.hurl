GET http://localhost:3042/counter
HTTP 200

[Asserts]
jsonpath "$.counter" exists 
[Captures]
counter: jsonpath "$.counter"


POST http://localhost:3042/counter
[QueryStringParams]
type: increase

HTTP 200
[Asserts]
jsonpath "$.counter" > {{counter}}

