BASE=models/

.PHONY: tree
tree:
	yangson -p $(shell find models/* -type d | xargs | sed 's/ /:/g') -t models/ntc-models-library.json

.PHONY: validate
validate:
	yangson -v tests/test1.json -p $(shell find models/* -type d | xargs | sed 's/ /:/g') models/ntc-models-library.json
