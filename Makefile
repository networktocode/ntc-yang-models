BASE=models/
OC_PYANG_PLUGINS_DIR="/src/oc-pyang/openconfig_pyang/plugins"

PYANG=docker run --rm -v $(PWD):/ntc-yang-models oc-pyang pyang
PYTEST=docker run --rm -v $(PWD):/ntc-yang-models yangson pytest
YANGSON=docker run --rm -v $(PWD):/ntc-yang-models yangson yangson

.PHONY: build-oc-pyang-container
build-oc-pyang-container:
	docker build -t oc-pyang -f Dockerfile.oc-pyang .

.PHONY: build-yangson-container
build-yangson-container:
	docker build -t yangson -f Dockerfile.yangson .

.PHONY: tree
tree:
	$(YANGSON) -p $(shell find models/* -type d | xargs | sed 's/ /:/g') -t models/ntc-models-library.json

.PHONY: tests
tests:
	$(PYTEST)

.PHONY: docs
docs:
	$(PYANG) \
		--plugindir $(OC_PYANG_PLUGINS_DIR) \
		-f docs \
		--path models \
		--doc-format html \
		--doc-title="NTC YANG models" \
		models/arp/*.yang > docs/arp.html
	$(PYANG) \
		--plugindir $(OC_PYANG_PLUGINS_DIR) \
		-f docs \
		--path models \
		--doc-format html \
		--doc-title="NTC YANG models" \
		models/system/*.yang > docs/system.html
	$(PYANG) \
		--plugindir $(OC_PYANG_PLUGINS_DIR) \
		-f docs \
		--path models \
		--doc-format html \
		--doc-title="NTC YANG models" \
		models/vlan/*.yang > docs/vlan.html
	$(PYANG) \
		--plugindir $(OC_PYANG_PLUGINS_DIR) \
		-f docs \
		--path models \
		--doc-format html \
		--doc-title="NTC YANG models" \
		models/vrf/*.yang > docs/vrf.html

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
