#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
echo
echo
echo
echo
echo
echo
echo
'FROM python' >> tempdir/Dockerfile
"RUN pip install flask" >> tempdir/Dockerfile
"COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
"COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
"COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
"EXPOSE 5050" >> tempdir/Dockerfile
"CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile
cd tempdir
docker build -t sampleapp.
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a
