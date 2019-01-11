1. folder: test_install
	Go Setup Test - Hello.go - hello world print as described in:
	https://golang.org/doc/install?download=go1.11.4.windows-386.zip

2. REST api in Go. MongoDB interaction in Go.
https://dzone.com/articles/build-restful-api-in-go-and-mongodb?edition=347131&utm_source=Zone%20Newsletter&utm_medium=email&utm_campaign=integration%202017-12-28
https://github.com/mlabouardy/movies-restapi

The operations that our endpoints will allow are:
GET /movies
GET /movies/:id
POST /movies    create new
PUT /movies     update
DELETE /movies

Dependencies:
go get github.com/BurntSushi/toml gopkg.in/mgo.v2 github.com/gorilla/mux

toml: Parse the configuration file (MongoDB server & credentials)
mux: Request router and dispatcher for matching incoming requests to their respective handler
mgo: MongoDB driver

First version:
app.go
```go
package main

import (
    "fmt"
    "log"
    "net/http"
    "github.com/gorilla/mux"
)



func AllMoviesEndPoint(w http.ResponseWriter, r * http.Request) {

    fmt.Fprintln(w, "not implemented yet !")

}



func FindMovieEndpoint(w http.ResponseWriter, r * http.Request) {

    fmt.Fprintln(w, "not implemented yet !")

}



func CreateMovieEndPoint(w http.ResponseWriter, r * http.Request) {

    fmt.Fprintln(w, "not implemented yet !")

}



func UpdateMovieEndPoint(w http.ResponseWriter, r * http.Request) {

    fmt.Fprintln(w, "not implemented yet !")

}



func DeleteMovieEndPoint(w http.ResponseWriter, r * http.Request) {

    fmt.Fprintln(w, "not implemented yet !")

}



func main() {

    r: = mux.NewRouter()

    r.HandleFunc("/movies", AllMoviesEndPoint).Methods("GET")

    r.HandleFunc("/movies", CreateMovieEndPoint).Methods("POST")

    r.HandleFunc("/movies", UpdateMovieEndPoint).Methods("PUT")

    r.HandleFunc("/movies", DeleteMovieEndPoint).Methods("DELETE")

    r.HandleFunc("/movies/{id}", FindMovieEndpoint).Methods("GET")

    if err: = http.ListenAndServe(":3000", r);err != nil {

        log.Fatal(err)

    }
}
```

To run:
go run app.go
http://localhost:3000/movies
