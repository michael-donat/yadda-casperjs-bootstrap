NO_COLOR=\x1b[0m
ERROR_COLOR=\x1b[31;03m

ERROR_STRING=$(ERROR_COLOR)Error:$(NO_COLOR)

build: check-deps
	npm install

check-deps:
	@command -v npm > /dev/null 2>&1 || { echo  "$(ERROR_STRING)" 'You need npm to build this project'; exit 1; }

test:
	PHANTOMJS_EXECUTABLE="`pwd`/node_modules/phantomjs/bin/phantomjs" ./node_modules/casperjs/bin/casperjs test --fail-fast --concise test.js
