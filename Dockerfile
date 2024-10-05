FROM python:3.8-slim-buster

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

#the below 3 lines are to reset the db everything and run the migrations every time a docker compose up build is done
ENV FLASK_APP=core/server.py 
RUN rm -f core/store.sqlite3 
RUN flask db upgrade -d core/migrations/ 

EXPOSE 7755

CMD ["bash","run.sh"]