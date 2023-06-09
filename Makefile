.PHONY: generate

RELEASE_VERSION=$(or ${version}, "")

generate:
	@if [ ${RELEASE_VERSION} = "" ]; then\
		echo "Please specify release version with 'make version=[VERSION]'";\
		exit 1;\
	fi
	VERSION=${RELEASE_VERSION} envsubst < ./template/falco.rb > ./Formula/falco.rb

clean:
	rm ./Formula/falco.rb

