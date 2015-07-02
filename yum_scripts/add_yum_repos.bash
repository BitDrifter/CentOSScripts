printf "Adding repofrge\n"
rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

printf "Adding fedoraproject\n"
rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

printf "Adding famillecollect\n"
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

printf "Adding atrpms\n"
rpm --import http://packages.atrpms.net/RPM-GPG-KEY.atrpms
rpm -Uvh http://dl.atrpms.net/el6-x86_64/atrpms/stable/atrpms-repo-6-7.el6.x86_64.rpm

printf "Adding webtatic\n"
rpm -Uvh http://repo.webtatic.com/yum/el6/latest.rpm
