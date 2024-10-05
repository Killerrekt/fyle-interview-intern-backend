test:
	rm -f core/store.sqlite3 && \
	flask db upgrade -d core/migrations/ && \
	pytest -vvv -s tests/

dbreset:
	rm -f core/store.sqlite3 && \
	flask db upgrade -d core/migrations/

server:
	bash run.sh