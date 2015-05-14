ROOT := htdocs
DRUSHMAKE := drush.make
DRUSH := drush

build: clean chmod drushmake patch finish

clean:
	-rm -r $(ROOT)/sites/all
	-rm -r $(ROOT)/includes
	-rm -r $(ROOT)/misc
	-rm -r $(ROOT)/modules
	-rm -r $(ROOT)/scripts
	-rm -r $(ROOT)/themes
	-rm -r $(ROOT)/profiles/minimal
	-rm -r $(ROOT)/profiles/standard
	-rm -r $(ROOT)/profiles/testing
	-rm -r $(ROOT)/vendor
	-rm -f $(ROOT)/web.config
	-rm -r $(ROOT)/.htaccess
	-rm -r $(ROOT)/.gitignore
	-rm $(ROOT)/*.php
	-rm $(ROOT)/*.txt

chmod:
	chmod a+w $(ROOT)/sites/default

drushmake:
	cd $(ROOT) && $(DRUSH) make --no-gitinfofile ../$(DRUSHMAKE) .

patch:
	@echo 'No patches'

finish:
	# remove some files we don't want to keep
	-rm -r $(ROOT)/INSTALL*.txt
	-rm -r $(ROOT)/CHANGELOG.txt
	-rm -r $(ROOT)/COPYRIGHT.txt
	-rm -r $(ROOT)/MAINTAINERS.txt
	-rm -r $(ROOT)/LICENSE.txt
	-rm -r $(ROOT)/README.txt
	-rm -r $(ROOT)/UPGRADE.txt
	-rm -r $(ROOT)/update.php
	-rm -r $(ROOT)/install.php
	-rm -r $(ROOT)/xmlrpc.php
	@echo 'Finished.'
