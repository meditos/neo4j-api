#!/bin/bash

curl 'http://localhost:8080/movies/by-title' -i -X GET -d $'{"value": "Aeon Flux"}'
