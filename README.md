# mkcert is useful for initial cert setup

# Cert info
1.  Create named volume
    docker volume create internal-cert-data
2.  Create initial set of internal certs to be used
    docker run -v internal-cert-data:/ ***finishme***
3.  the mkcert container can be removed and does not need to be re-ran unless the named volume is deleted.
#Copy files to the volume
docker run -v internal-cert-data:/certs --name tempcp busybox true
docker cp ./<file(s)> helper:/certs
rm tempcp


# Links
https://codewithhugo.com/docker-compose-local-https/
https://stackoverflow.com/questions/37468788/what-is-the-right-way-to-add-data-to-an-existing-named-volume-in-docker
https://github.com/vishnudxb/docker-mkcert