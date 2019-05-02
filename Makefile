BASE=models/

.PHONY: tree
tree:
	yangson -p $(shell find models/* -type d | xargs | sed 's/ /:/g') -t models/ntc-models-library.json

.PHONY: tests
tests:
	pytest
