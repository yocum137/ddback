# Makefile for ddback version 0.9
# Copyright (C) 2006 Dan Yocum <yocum@fnal.gov>
#
# This file is part of ddback
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

VERSION=1.0.0

all:

install: install-core install-doc install-hal

install-core:
	install -d -o root -g root -m 0755 $(ROOT)/sbin
	install -d -o root -g root -m 0755 $(ROOT)/etc
	install -d -o root -g root -m 0755 $(ROOT)/etc/sysconfig
	install -d -o root -g root -m 0755 $(ROOT)/etc/logrotate.d
	install -d -o root -g root -m 0644 $(ROOT)/etc/ddback.d
	install -o root -g root -m 0755 sbin/ddback $(ROOT)/sbin/
	install -o root -g root -m 0644 etc/ddback.conf $(ROOT)/etc/
	install -o root -g root -m 0644 etc/sysconfig/ddback $(ROOT)/etc/sysconfig/
	install -o root -g root -m 0644 etc/logrotate.d/ddback $(ROOT)/etc/logrotate.d/
	install -o root -g root -m 0644 etc/ddback.d/* $(ROOT)/etc/ddback.d

install-doc:
	install -d -o root -g root -m 0644 $(ROOT)/usr/share/doc/ddback-$(VERSION)
	install -o root -g root -m 0644 doc/* $(ROOT)/usr/share/doc/ddback-$(VERSION)/

install-hal:
	install -d -o root -g root -m 0755 $(ROOT)/etc
	install -d -o root -g root -m 0755 $(ROOT)/etc/pam.d
	install -d -o root -g root -m 0755 $(ROOT)/etc/security/console.apps/
	install -d -o root -g root -m 0755 $(ROOT)/usr/bin
	install -o root -g root -m 0644 etc/pam.d/ddback $(ROOT)/etc/pam.d/
	install -o root -g root -m 0644 etc/security/console.apps/ddback $(ROOT)/etc/security/console.apps/
	ln -s /usr/bin/consolehelper $(ROOT)/usr/bin/ddback

uninstall:
	rm -rf $(ROOT)/sbin/ddback $(ROOT)/etc/ddback.conf \
	$(ROOT)/etc/sysconfig/ddback $(ROOT)/etc/ddback.d \
	$(ROOT)/etc/logrotate.d/ddback $(ROOT)/usr/share/doc/ddback-$(VERSION) \
	$(ROOT)/etc/pam.d/ddback $(ROOT)/etc/security/console.apps/ddback \
	$(ROOT)/usr/bin/ddback
