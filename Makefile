# MAINTAINER: Frank Mariette <frankmariette@carfax.com>

CHARTS = $(shell ls -d */ | grep -v charts)

package:
	helm package $(CHARTS) -d charts
	helm repo index charts --merge charts/index.yaml
