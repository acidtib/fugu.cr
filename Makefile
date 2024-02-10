build/app:
	crystal build --release --static --verbose --stats --progress --time --no-debug -o ./bin/app src/fugu.cr

run:
	crystal run src/fugu.cr

test:
	KEMAL_ENV=test crystal spec