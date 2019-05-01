BASE=models/

.PHONY: tree
tree:
	@pyang -f tree \
		--path=$(BASE)/vlan \
		--path=$(BASE)/system \
		$(BASE)/network-instance/* \
		$(BASE)/system/*
