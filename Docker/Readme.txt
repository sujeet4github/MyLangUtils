1. Assignment_*: Bind Mounts

	1. Use a Jekyll "Static Site Generator" to start a local web server
	2. source code under bindmount-sample-1 of C:\S\temp\udemy-docker-mastery

	Start Container using: docker run -p 80:4000 -v $(pwd):/site bretfisher/jekyll-serve
	    docker run -p 80:4000 -v C:/S/temp/MyLangUtils/Docker/Assignment_06-jekyll:/site bretfisher/jekyll-serve

	https://hub.docker.com/r/bretfisher/jekyll-serve

2. Example_Compose: 
	https://www.stubbornjava.com/posts/creating-a-local-development-environment-with-docker-compose
	
	docker-compose up

3. LaTex
	https://gordonlesti.com/building-a-latex-docker-image/
	