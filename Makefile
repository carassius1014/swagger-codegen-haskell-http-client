codegen:
	swagger-codegen generate \
		-i ${spec} \
		-l haskell-http-client \
		-t ${template} \
		-o ${out}
