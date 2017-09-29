#!/bin/bash
#
# FutureGateway configuration settings
#
# This script keeps the whole FutureGateway configuration
#
# Author: Riccardo Bruno <riccardo.bruno@ct.infn.it>
#

# Generic setup configurations

# Setup log file
FGLOG=$HOME/FutureGateway_setup.log            # If empty std-out only reporting for setup

# FutureGateway relies totally on Git repository for its intallation
# Each adopter may use its own forked sources, so that GIT repository must be configured
# properly before to execute the setup
GIT_HOST=https://github.com                   # Git repository host
GIT_RAWHOST=https://raw.githubusercontent.com # Host address for raw content
GIT_REPO=ricsxn/FutureGateway                 # FutureGateway repositoty name
GIT_BASE=$GIT_HOST/$GIT_REPO                  # GitHub base repository endpoint
GIT_BASERAW=$GIT_RAWHOST/$GIT_REPO            # GitHub base for raw content
GIT_TAG="master"                              # GitHub tag/branch name

# Components setup configurations

# APIServerDB
#
# FutureGateway database is the core component of the Science Gateway framework
# It holds any configuration and user activity
# This component requires the following variables
FGDB_HOST=127.0.0.1                  # Database server address
FGDB_HOSTUNAME=futuregateway         # Database host username
FGDB_PORT=3306                       # Database port number
FGDB_NAME=fgapiserver                # Database name
FGDB_ROOTPWD=                        # Leave it empty for no password
FGDB_USER=fgapiserver                # Database username
FGDB_PASSWD=fgapiserver_password     # Database username password
FGDB_SSHPORT=22                      # Database ssh port number
FGDB_GITREPO=FutureGateway           # Database Git repository name
FGDB_GITTAG="master"                 # Database Git repository tag/branch name
FGDB_VARS=$(set | grep ^FGDB_ | awk -F"=" '{ print $1 }')

# API front-end
#
# FutureGateway may have different kind of API front-ends.
# The principal aim of front-ends is to listen and accept incoming rest calls
# in accordance with FutureGateway APIs defined at http://docs.fgapis.apiary.io/#
# The first developed front-end is the fgAPIServer a python+Flask based implementation
#

# fgAPIServer
# This component requires the following variables
FGAPISERVER_SETUP=1                     # Enable this flag to setup fgAPIServer
FGAPISERVER_HOST=127.0.0.1              # fgAPIServer server host address
FGAPISERVER_APPHOST=0.0.0.0             # fgAPIServer server host address
FGAPISERVER_APPHOSTUNAME=futuregateway  # fgAPIServer host username 
FGAPISERVER_PORT=8888                   # fgAPIServer port number (no WSGI)
FGAPISERVER_SSHPORT=22                  # fgAPIServer ssh port number
FGAPISERVER_WSGI=1                      # 0 turn off WSGI configuration (apache)
FGAPISERVER_GITREPO=                    # fgAPIServer Git repository name
FGAPISERVER_GITTAG="master"             # fgAPIServer Git repository tag/branch name
FGAPISERVER_IOPATH=/tmp                 # fgAPIServer I/O sandbox directory
FGAPISERVER_APIVER=1.0                  # FutureGateway API version implemented
FGAPISERVER_DEBUG=True                  # Enable/Disable fgAPIServer debug mode
FGAPISERVER_NOTOKEN=False               # Enable/Disable token mechanism
FGAPISERVER_KEY=                        # Specify here a host certificate key
FGAPISERVER_CRT=                        # Specify here a host certificate
# PTV Settings
FGAPISERVER_PTVFLAG=True                # Enable/Disable PTV (token mode on)
FGAPISERVER_PTVUSER="tokenver_user"     # PTV basic auth username
FGAPISERVER_PTVPASS="tokenver_pass"     # PTV basic auth password
FGAPISERVER_PTVBASE="http://$FGAPISERVER_HOST:8889"
FGAPISERVER_PTVENDPOINT="$FGAPISERVER_PTVBASE/checktoken" 
FGAPISERVER_PTVMAPFILE="fgapiserver_ptvmap.json"
[ "$FGAPISERVER_KEY" != "" -a "$FGAPISERVER_CRT" != "" ] && FGAPISERVER_SEC=1 || FGAPISERVER_SEC=0
[ $FGAPISERVER_SEC -ne 0 ] && FGAPISERVER_PROTO="https://" || FGAPISERVER_PROTO="http://"
FGAPISERVER_BASE=${FGAPISERVER_PROTO}${FGAPISERVER_HOST}:${FGAPISERVER_PORT}/${FGAPISERVER_APIVER}
FGAPISERVER_VARS=$(set | grep ^FGAPISERVER_ | awk -F"=" '{ print $1 }')

# APIServer
#
# FutureGateway may have different API Server daemons
# Daemons extract tasks from the APIServer queue and execute tasks on DCIs
# calling the right executor interface as specified in the queue task record
# The first implemented APIServer is the APIServerDaemon a java application
# making use of JSAGA together with the CSGF Grid and Cloud Engine
#

# APIServerDaemon
# This component requires the following variables
APISERVERDAEMON_SETUP=1                 # Enable this flag to setup APIServerDaemon
APISERVERDAEMON_HOST=127.0.0.1          # APIServerDaemon host address
APISERVERDAEMON_HOSTUNAME=futuregateway # APIServerDaemon host username
APISERVERDAEMON_PORT=8080               # APIServerDaemon port number
APISERVERDAEMON_SSHPORT=22              # APIServerDaemon SSH port number
APISERVERDAEMON_GITREPO=                # fgAPIServer Git repository name
APISERVERDAEMON_GITTAG="master"         # fgAPIServer Git repository tag/branch name

# GridnCloud Engine DB settings (GridnCloud Engine EI)
UTDB_FGAPPID=10000                   # FutureGateway appId in GridnCloud Engine
UTDB_HOST=127.0.0.1                  # Database server address
UTDB_HOSTUNAME=futuregateway         # Database host username
UTDB_PORT=3306                       # Database port number
UTDB_NAME=userstracking              # Database name
UTDB_ROOTPWD=                        # Leave it empty for no password
UTDB_USER=tracking_user              # Database username
UTDB_PASSWD=usertracking             # Database username password

# Executor Interfaces specific Git configuration
# The meaning of Git variable names is like in the general GIT configurations
# above prefixed by a component identifier string

# rOCCI jsaga adaptor (GridnCloud Engine EI)
ROCCI_GIT_HOST=https://github.com
ROCCI_GIT_RAWHOST=https://raw.githubusercontent.com
ROCCI_GIT_REPO=indigo-dc                        
ROCCI_GIT_BASE=$ROCCI_GIT_HOST/$ROCCI_GIT_REPO              
ROCCI_GIT_BASERAW=$ROCCI_GIT_RAWHOST/$ROCCI_GIT_REPO        
ROCCI_GITREPO="jsaga-adaptor-rocci"
ROCCI_GITTAG="master"

#GridnCloudEngnie EI
GNCENG_GIT_HOST=https://github.com
GNCENG_GIT_RAWHOST=https://raw.githubusercontent.com
GNCENG_GIT_REPO=csgf
GNCENG_GIT_BASE=$GNCENG_GIT_HOST/$GNCENG_GIT_REPO
GNCENG_GIT_BASERAW=GNCENG_GIT_BASERAW=$GNCENG_GIT_RAWHOST/$GNCENG_GIT_REPO        
GNCENG_GITREPO="grid-and-cloud-engine"
GNCENG_GITTAG="FutureGateway"

# APIServerDaemon configuration settings used to create
# the .properties file: /web/WEB-INF/classes/it/infn/ct/APIServerDaemon.properties
APISERVERDAEMON_MAXTHREADS=100                  # Maximum number of threads Action/Control queues
APISERVERDAEMON_ASDCLOSETIMEOUT=20              # Waiting timeout before kill thread pools
APISERVERDAEMON_GEPOLLINGDELAY=4000             # Action polling interval
APISERVERDAEMON_GEPOLLINGMAXCOMMANDS=5          # Maximum number of action commands per polling cycle
APISERVERDAEMON_ASCONTROLLERDELAY=10000         # Controller polling interval 
APISERVERDAEMON_ASCONTROLLERMAXCOMMANDS=5       # Maximum number of controller commands per polling cycle
APISERVERDAEMON_ASTASKMAXRETRIES=5              # Maximum number of action retries
APISERVERDAEMON_ASTASKMAXWAIT=1800000           # Delay among two different action retries
APISERVERDAEMON_UTDB_JNDI=jdbc/UserTrackingPool # JNDI connection pool name
APISERVERDAEMON_UTDB_HOST=$UTDB_HOST             # UsersTracking database host
APISERVERDAEMON_UTDB_PORT=$UTDB_PORT            # UsersTracking database port
APISERVERDAEMON_UTDB_USER=$UTDB_USER            # UsersTracking database user
APISERVERDAEMON_UTDB_PASS=$UTDB_PASSWD          # UsersTracking database password
APISERVERDAEMON_UTDB_NAME=$UTDB_NAME            # UsersTracking database name

# ToscaIDC EI configuration settings used to create
# the .properties file: APIServerDaemon/web/WEB-INF/classes/it/infn/ct/ToscaIDC.properties
# Settings below are valid for baseline tester PTV service: fgapiserver_ptv.py
TOSCAIDC_FGAPISRV_FRONTEND=$FGAPISERVER_BASE                 # PTV service endpoint
TOSCAIDC_FGAPISRV_PTVTOKENSRV=$FGAPISERVER_PTVBASE/get-token # PTV get-token service 
TOSCAIDC_FGAPISRV_PTVUSER=$FGAPISERVER_PTVUSER               # PTV access username
TOSCAIDC_FGAPISRV_PTVPASS=$FGAPISERVER_PTVPASS               # PTV access password

# APISERVERDAEMON Environment variables
APISERVERDAEMON_ENVS=$(set | grep '^APISERVERDAEMON_\|^UTDB_\|^ROCCI_\|^GNCENG_\|^TOSCAIDC_' | awk -F"=" '{ print $1 }')

# FGPortal
#
# The FutureGateway can operate with any already existing web portal technology thanks
# to the adoption of the REST APIs. For all those cases were adopting user communities
# do not have any portal, the FutureGateway can provide one of its own supported 
# web portal technologies
# The first supported technology was Liferay6.2 a platform supported by the CSGF
# The second supported technoogy is Liferay7 the platform supported during the 
# indigo-datacloud project
#

# Liferay62
# This component requires the following variables
FGPORTAL_LIFERAY62_SETUP=0                # Enable this flag to support Liferay62 setup
FGPORTAL_LIFERAY62_HOST=127.0.0.1         # Liferay62 portal host address
FGPORTAL_LIFERAY62_HOSTUNAME=liferayadmin # Liferay62 portal host username
FGPORTAL_LIFERAY62_PORT=8080              # Liferay62 portal port number
FGPORTAL_LIFERAY62_SSHPORT=22             # Liferay62 portal ssh port
FGPORTAL_LIFERAY62_DBHOST=$FGDB_HOST      # Liferay62 portal database host 
FGPORTAL_LIFERAY62_DBPORT=$FGDB_PORT      # Liferay62 portal database port 
FGPORTAL_LIFERAY62_DBNAME=lportal         # Liferay62 portal database name
FGPORTAL_LIFERAY62_DBUSER=lportal         # Liferay62 portal database user
FGPORTAL_LIFERAY62_DBPASS=lportal         # Liferay62 portal database password
FGPORTAL_LIFERAY62_DBNAME=lportal         # Liferay62 portal database name
FGPORTAL_LIFERAY62_SDK=0                  # 0 turn off Liferay62 SDK installation
FGPORTAL_LIFERAY62_GITREPO=               # Liferay62 Git repository name
FGPORTAL_LIFERAY62_GITTAG=master          # Liferay62 Git repository tag/branch name
FGPORTAL_LIFERAY62_ENVS=$(set | grep ^FGPORTAL_LIFERAY62_ | awk -F"=" '{ print $1 }')

# Liferay7
# This component requires the following variables
FGPORTAL_LIFERAY7_SETUP=1                # Enable this flag to support Liferay7 setup
FGPORTAL_LIFERAY7_HOST=127.0.0.1         # Liferay7 portal host address
FGPORTAL_LIFERAY7_HOSTUNAME=liferayadmin # Liferay7 portal host username
FGPORTAL_LIFERAY7_PORT=8080              # Liferay7 portal port number
FGPORTAL_LIFERAY7_SSHPORT=22             # Liferay7 portal ssh port
FGPORTAL_LIFERAY7_DBHOST=$FGDB_HOST      # Liferay7 portal database host 
FGPORTAL_LIFERAY7_DBPORT=$FGDB_PORT      # Liferay7 portal database port 
FGPORTAL_LIFERAY7_DBNAME=lportal         # Liferay7 portal database name
FGPORTAL_LIFERAY7_DBUSER=lportal         # Liferay7 portal database user
FGPORTAL_LIFERAY7_DBPASS=lportal         # Liferay7 portal database password
FGPORTAL_LIFERAY7_DBNAME=lportal         # Liferay7 portal database name
FGPORTAL_LIFERAY7_SDK=0                  # 0 turn off Liferay7 SDK installation
FGPORTAL_LIFERAY62_GITREPO=              # Liferay7 Git repository name
FGPORTAL_LIFERAY62_GITTAG=master         # Liferay7 Git repository tag/branch name
FGPORTAL_LIFERAY7_ENVS=$(set | grep ^FGPORTAL_LIFERAY7_ | awk -F"=" '{ print $1 }')

