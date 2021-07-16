curl -X "PUT" "http://localhost:8080/movies" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{"title": "Aeon Flux", "description": "Reactive is the new cool"}'