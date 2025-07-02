.PHONY: prerequisites lint clean all build-image ansible

prerequisites: build-image
	@docker --version || (echo "Docker is required but not installed." && exit 1)

build-image: prerequisites
	docker build -t ansible-toolbox .

lint: build-image
	docker run --rm -v $(PWD):/workdir/ilo -w /workdir ansible-toolbox ansible-lint

ansible: build-image
	docker run --rm -it -v $(PWD):/workdir/ilo -w /workdir ansible-toolbox ansible "$$@"

all: lint

clean:
	# No virtualenv to clean, but you can add custom cleanup here if needed
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
