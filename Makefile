ROOT := htdocs
DRUSHMAKE := drush.make
DRUSH := drush

build: clean chmod drushmake patch finish

clean:
	-rm -rf $(ROOT)/core
	-rm -rf $(ROOT)/sites/all
	-rm -rf $(ROOT)/includes
	-rm -rf $(ROOT)/misc
	-rm -rf $(ROOT)/modules
	-rm -rf $(ROOT)/scripts
	-rm -rf $(ROOT)/themes
	-rm -rf $(ROOT)/profiles/minimal
	-rm -rf $(ROOT)/profiles/standard
	-rm -rf $(ROOT)/profiles/testing
	-rm -rf $(ROOT)/vendor
	-rm -ff $(ROOT)/web.config
	-rm -rf $(ROOT)/.htaccess
	-rm -rf $(ROOT)/.gitignore
	-rm -rf $(ROOT)/*.php
	-rm -rf $(ROOT)/*.txt
	-rm -rf $(ROOT)/example.gitignore
	-rm -rf $(ROOT)/composer.json

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
