Summary: Backup to Disk Utility
Name: ddback
Version: 1.0.0
Release: 1
BuildArch: noarch
License: GPL
Group: Applications/Archiving
Source: http://www.sourceforge.net/ddback-%{version}.tgz
URL: http://www.sourceforge.net/ddback-%{version}.tgz
Vendor: Dan Yocum
Packager: Dan Yocum <yocum@fnal.gov>
BuildRoot: /var/tmp/ddback-%{version}
Requires: rsync, nfs-utils, gnome-volume-manager, gconf-editor, usermode

%description 
ddback is simple bash script which uses rsync to create incremental backups to 
a local or NFS mounted filesystem.  It uses hard links to create the incremental
backups.  
 
%prep
rm -rf ${RPM_BUILD_ROOT}

%setup

%install
cd $RPM_BUILD_DIR/ddback-%{version}
make ROOT="$RPM_BUILD_ROOT" install

%files
%doc doc/README
%doc doc/INSTALL
%doc doc/autorun.example
%config /etc/ddback.conf
%config /etc/sysconfig/ddback
%config /etc/ddback.d/bin-excludes
%config /etc/ddback.d/boot-excludes
%config /etc/ddback.d/etc-excludes
%config /etc/ddback.d/home-excludes
%config /etc/ddback.d/lib-excludes
%config /etc/ddback.d/lib64-excludes
%config /etc/ddback.d/opt-excludes
%config /etc/ddback.d/root-excludes
%config /etc/ddback.d/sbin-excludes
%config /etc/ddback.d/usr-excludes
%config /etc/ddback.d/var-excludes
%config /etc/logrotate.d/ddback
%config /etc/pam.d/ddback
%config /etc/security/console.apps/ddback
/sbin/ddback
/usr/bin/ddback


%changelog
* Mon Jan 05 2009 Dan Yocum <yocum@fnal.gov> 1.0.0-1
 - Added SUCCESS and ERROR messages to the log file and email reports

* Tue Oct 14 2008 Dan Yocum <yocum@fnal.gov> 0.9.6-1
 - removed unset path and set the utilities to their natural names
 - added log_entry function to add syslog format log entries

* Mon Sep 08 2008 Dan Yocum <yocum@fnal.gov> 0.9.4-1
 - Fixed some logic to determine the runlevel.

* Tue Aug 19 2008 Dan Yocum <yocum@fnal.gov> 0.9.3-1
 - Fixed several open, minor bugs
 - Still need to fix the rm of incremental versions greater than the magic 
 - number if they exist.

* Fri Jan 12 2007 Dan Yocum <yocum@fnal.gov> 0.9.2-1
 - Fixed some issues with mkdir and the incremental and current dirs on first
 - run.

* Thu Jan 11 2007 Dan Yocum <yocum@fnal.gov> 0.9.1-1
 - Fixed some typos in /sbin/ddback

* Tue Jan 09 2007 Dan Yocum <yocum@fnal.gov> 0.9-3
 - Fixed some typos in the Makefile

* Fri Jan 05 2007 Dan Yocum <yocum@fal.gov> 0.9-1
 - First cut
