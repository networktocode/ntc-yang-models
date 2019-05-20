BASE=models/
PLUGINS_DIR="/src/oc-pyang/openconfig_pyang/plugins"

MODELS_DOC_PATH=docs/models/dynamic

PYTEST=docker run --rm -v $(PWD):/ntc-yang-models ntc-models-builder pytest
YANGSON=docker run --rm -v $(PWD):/ntc-yang-models ntc-models-builder yangson
CTR=docker run --rm -v $(PWD):/ntc-yang-models ntc-models-builder

.PHONY: build-container
build-container:
	docker build --no-cache -t ntc-models-builder -f Dockerfile .

.PHONY: tree
tree:
	$(YANGSON) -p $(shell find models/* -type d | xargs | sed 's/ /:/g') -t models/ntc-models-library.json

.PHONY: tests
tests:
	$(PYTEST)

.PHONY: _docs
_docs:
	cd docs && make html

.PHONY: docs
docs:
	$(CTR) make _docs

.PHONY: build-model-doc
build-model-doc:
	pyang \
		--plugindir $(PLUGINS_DIR) \
		-f docs \
		--path models \
		--doc-format rst \
		--strip-ns \
		models/$(MODEL)/*.yang > $(MODELS_DOC_PATH)/$(MODEL).rst

.PHONY: pyang-help
pyang-help:
	$(PYANG) \
		--plugindir $(PLUGINS_DIR) \
		--help

.PHONY: lint
lint:
	$(PYANG) \
		--plugindir $(OC_PYANG_PLUGINS_DIR) \
		--path models \
		--doc-format html \
		--doc-title="NTC YANG models" \
		--allowed-prefixes=ntc \
		--openconfig \
		models/*/*.yang
