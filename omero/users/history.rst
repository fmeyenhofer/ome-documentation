CHANGELOGS
==========


Links to decoupled repositories
===============================

Starting from OMERO 5.5, the following repositories have been decoupled.

omero-build:
------------

- omero-gateway-java :java_gateway_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-blitz :blitz_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-server :server_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-renderer :renderer_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-romio :romio_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-common :common_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-model :model_source:`CHANGELOG.md<CHANGELOG.md>`

omero clients:
--------------
- omero-matlab :matlab_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-insight :insight_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-py :py_source:`CHANGELOG.md<CHANGELOG.md>`
- omero-web :web_source:`CHANGELOG.md<CHANGELOG.md>`

.. Content for this page should be opened as a PR against
.. https://github.com/ome/openmicroscopy/blob/develop/history.rst
.. initially and transferred to this page via the autogen job

OMERO version history
=====================

5.6.9 (October 2023)
--------------------

This release includes the following upgrade of the OMERO.server Java components:

- omero-gateway-java 5.8.2
- omero-blitz 5.7.1
- omero-server 5.6.9
- omero-renderer 5.5.14
- omero-romio 5.7.4
- omero-common 5.6.3
- omero-model 5.6.12


Improvements include:

- remove support for ADH and let Ice choose the default SSL protocol.
- revert "Java client init: no "anon" among jdk.tls.disabledAlgorithms" 
- an upgrade of Bio-Formats to version 7.0.0

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

This version of the OMERO.server has been tested with:

- OMERO.py 5.16.0
- OMERO.web 5.22.1
- OMERO.dropbox 5.6.2

5.6.8 (July 2023)
-----------------

This release includes the following upgrade of the OMERO.server Java components:

- omero-gateway-java 5.8.1
- omero-blitz 5.6.3
- omero-server 5.6.8
- omero-renderer 5.5.13
- omero-romio 5.7.3
- omero-common 5.6.2
- omero-model 5.6.11


Improvements include:

- support histogram for tiled images and fix generation of histogram for float images
- add default scanning period in logback.
- an upgrade of Bio-Formats to version 6.14.0

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.
We also recommend to re-index the database especially if the OMERO server has a large number of High Content Screening data.

This version of the OMERO.server has been tested with:

- OMERO.py 5.14.0
- OMERO.web 5.22.0
- OMERO.dropbox 5.6.2

5.6.7 (March 2023)
------------------

This release includes the following upgrade of the OMERO.server Java components:

- omero-gateway-java 5.8.0
- omero-blitz 5.6.2
- omero-server 5.6.7
- omero-renderer 5.5.12
- omero-romio 5.7.2
- omero-common 5.6.1
- omero-model 5.6.10


Improvements include:

- address performance issues when indexing fileset
- add ``omero.search.max_fileset_size`` property to indicated the maximum size of the fileset to be considered for indexing
- run the PixelDataThread Application events in SYSTEM Thread pool
- declare logback-classic as explicit dependency and set to 1.2.x
- an upgrade of Bio-Formats to version 6.12.0

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.
We also recommend to re-index the database especially if the OMERO server has a large number of High Content Screening data.

This version of the OMERO.server has been tested with:

- OMERO.py 5.13.1
- OMERO.web 5.19.0
- OMERO.dropbox 5.6.2

5.6.6 (December 2022)
---------------------

This release includes the following upgrade of the OMERO.server Java components:

- omero-gateway-java 5.7.0
- omero-blitz 5.6.0
- omero-server 5.6.5
- omero-renderer 5.5.11
- omero-romio 5.7.1
- omero-common 5.6.0
- omero-model 5.6.9

as well as the upgrade of omero-scripts to version 5.7.1.

Improvements include:

- enhancement of the Java Command line importer developer user experience
- the option for ``omero.server.nodedescriptors`` to be queried from a client
- a new property ``omero.qa.feedback`` to configure the QA system the feedback is submitted to.
- an upgrade of Bio-Formats to version 6.11.1

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

This version of the OMERO.server has been tested with:

- OMERO.py 5.13.1
- OMERO.web 5.16.0
- OMERO.dropbox 5.6.2


5.6.5 (June 2022)
-----------------

This release includes the following upgrade of the OMERO.server Java components:

- omero-gateway-java 5.6.10
- omero-blitz 5.5.12
- omero-server 5.6.4
- omero-renderer 5.5.10
- omero-romio 5.7.0
- omero-common 5.5.10
- omero-model 5.6.7

as well as the upgrade of omero-scripts to version 5.7.0.

Improvements include:

-  a new server configuration allowing to control the pyramidal requirement for floating-point images
-  an upgrade of Bio-Formats to version 6.10.0
-  the inclusion of the OMEZarrReader version 0.3.0 for reading OME-NGFF data

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

This version of the OMERO.server has been tested with:

- OMERO.py 5.11.2
- OMERO.web 5.14.1
- OMERO.dropbox 5.6.2

5.6.4 (April 2022)
------------------

This release improves and expands integration testing to handle Django 3.2.x.
It also removes obsolete code.
More importantly, it has been tested with:

- omero-blitz 5.5.10
- omero-gateway-java 5.6.9
- omero-py 5.11.1
- omero-web 5.14.0
- omero-dropbox 5.6.2
- omero-scripts 5.6.2

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

5.6.3 (October 2020)
--------------------

This release improves and expands integration testing and removes
obsolete code. More importantly, it has been tested with:

- omero-blitz 5.5.8
- omero-gateway-java 5.6.5
- omero-py 5.8.1
- omero-web 5.8.1
- omero-dropbox 5.6.2

5.6.2 (July 2020)
-----------------

This release adds installation documentation for server and web on
CentOS 8 and Ubuntu 20.04.
We have dropped support for Ubuntu 16.04 and removed the corresponding
installation instructions.

This version has been tested with:

- omero-blitz 5.5.7
- omero-gateway-java 5.6.4
- omero-py 5.7.1
- omero-web 5.7.0
- omero-dropbox 5.6.2

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

5.6.1 (March 2020)
------------------

Security release focused on fixing :secvuln:`vulnerabilities <>`
2019-SV1 through 2019-SV6. This version has been tested with:

- omero-blitz 5.5.6
- omero-gateway-java 5.6.3
- omero-py 5.6.2
- omero-web 5.6.3
- omero-dropbox 5.6.1

**Note:** This upgrade will invalidate the Bio-Formats Memoizer cache. Please
see the upgrade guide for further information.

5.6.0 (January 2020)
--------------------

First release of OMERO with support for Python 3. All Python
code has been removed from the distributed ZIP file and will
need to be installed from PyPI. This version has been tested
with:

- omero-blitz 5.5.5
- omero-gateway-java 5.6.2
- omero-py 5.6.0
- omero-web 5.6.1
- omero-dropbox 5.6.1

5.5.1 (July 2019)
-----------------

Bug fix release focusing on installation issues that were seen with 5.5.0 as
well as an upgrade of Bio-Formats to 6.1.1.

- web:
   - Allow the customization of the web logo
   - Allow overriding server configuration
   - Dynamically look up client download links
   - Fix description in new Project, Dataset etc.
   - Fix layout of the user account form

- Java gateway:
   - New methods added to allow change group of objects
   - New methods added to load objects (datasets, etc.) by name
   - New methods added to get original and repository paths of images
   - Minor fixes in createDataset and getPixelSize methods

- import:
   - Add import target support for creating Projects

- scripts:
   - Enable annotating Projects and Datasets with the Populate Metadata script

- server:
   - Fix SSL cipher issue to allow Insight to be used from Fedora 30
   - Fix issue with loading Hibernate’s DTD when offline
   - Properly close OMERO.tables which kept sessions alive

Note: Due to the stricter closing of OMERO.tables, it may be necessary to
update plugins like omero-metadata which previously were leaking files.


5.5.0 (June 2019)
-----------------

This version **does not** require a database upgrade.

For more information about the aim of the 5.5 series and future plan, please read our `blog post <https://blog.openmicroscopy.org/>`_.

This release focuses on dropping support for Java 7, Python 2.6 and Ice 3.5,
adding support for Java 11 and PostgreSQL 10, and on decoupling the Java components to new,
separate repositories, each with a new `Gradle <https://gradle.org>`_ build system:

- https://github.com/ome/omero-dsl-plugin
- https://github.com/ome/omero-model
- https://github.com/ome/omero-common
- https://github.com/ome/omero-romio
- https://github.com/ome/omero-renderer
- https://github.com/ome/omero-server
- https://github.com/ome/omero-blitz
- https://github.com/ome/omero-gateway-java
- https://github.com/ome/omero-blitz-plugin
- https://github.com/ome/omero-insight
- https://github.com/ome/omero-matlab
- https://github.com/ome/omero-javapackager-plugin
- https://github.com/ome/omero-api-plugin

This has the goal of enabling more fine-grained releases.

A new restriction is that the names of server configuration properties
may include only letters, numbers and the symbols ".", "_", "-".

New plugins like omero-artifact-plugin allow reducing the boilerplate
code in the build scripts of the decoupled repositories.
Though initially disruptive, we hope this modernization and modularization will ease participation in the development of OMERO.

Additionally, this release improves the Web interface when OMERO is opened to the public
and contains some useful CLI improvements.

- build:
   - Remove the generation of Ivy dependencies.html files

- web:
   - Introduce Advanced Search to allow and/or search options
   - Fix description in new Project, Dataset etc.
   - Allow user to create new Map Annotations for multiple selected objects at once
   - Fix date display
   - Remove / from 3rdparty in ome.viewportImage.js
   - Remove usage of deprecated calls
   - Remove apache config
   - Do not break display of Tag dialog when large font size is configured in browser
   - Disable refresh button while existing refresh in progress
   - Improve public user support
   - Add ability to customize incorrect login text

- cli:
   - Disable foreground indexing
   - Improve logging of error when importing data via cli command
   - Clearly indicate empty log files when running a diagnostic
   - Fix bug when running `config load` passing a directory instead of a file
   - Add option to delete keys from map annotations
   - Add error code discovery
   - Deprecate the CLI upload module and plugin

5.4.10 (January 2019)
---------------------

This release addresses a login issue for Java clients such as
OMERO.insight. New releases of Java include a change to the
``java.security`` file that disables anonymous cipher suites. This
change causes ``SSLHandshakeException`` when the client attempts to
authenticate to OMERO.blitz. The OMERO 5.4.10 release has some clients
check the security property ``jdk.tls.disabledAlgorithms`` for the value
"anon" and remove it if present thus allowing authentication to proceed.

5.4.9 (October 2018)
--------------------

This release addresses a critical import issue where files can be silently
skipped.

Import improvements include:

- ``ImportCandidates`` returns filesets even when files are shared between
  several filesets independently of the scanning order
- insight: bug fixes for the lightweight importer UI

Other improvements include:

- BlitzGateway: new API to read ``OriginalFile`` as file-like objects
- server: add code to dispose of `Graphics` objects in the server
- Javadoc: add links to developer documentation for graph operations

5.4.8 (September 2018)
----------------------

This release focuses on a number of import performance
improvements while including several other fixes as
well as an upgrade of Bio-Formats.

Import improvements include:

- cli: new experimental `--parallel-upload` and
  `--parallel-fileset` flags to the `import` command
- cli: new `fs importtime` cli command
- cli: add support for `--skip`, `--parallel-upload`, 
  `--parallel-fileset` and `--readers` options in bulk
  import configuration files
- insight: new options for skipping various import steps
  to speed up the process (match cli's `--skip` option)
- insight: supporting imports with thousands of files
  by providing a lightweight UI
- insight: new loading placeholder when browsing data to
  show when an image is busy being processed and not
  ready to generate a thumbnail
- insight: added error placeholder when browsing data to
  indicate a failed import
- server: preventing recalculation of checksums for upload
- server: providing better performance logging,
  accessible to users via `fs logfile`
- as well as preservation of Bio-Formats' knowledge of
  channel colors where provided.

Other client changes include:

- web: better handling of large numbers of channels
- web: fixed socket leakage on unclosed web sessions
- web: fixed issue with bulk annotation table handling
- cli: deprecating `admin sessionlist` and `config list`

Sysadmin improvements include:

- new `%thread%` option for `omero.fs.repo.path`
  as well as fix a few bugs for dealing with
  parallel imports
- new `omero.threads.background_threads` property
  to limit the number of simultaneous imports

This release also upgrades the version of Bio-Formats which OMERO
uses to 5.9.2.

5.4.7 (July 2018)
-----------------

This is a security release which also includes a number of
bug fixes. **It is highly recommended that you upgrade your
server**.

See the :secvuln:`security advisories <>` page for details on
2018-SV1, 2018-SV2 and 2018-SV3.

Impacts of the security vulnerability fixes include:

- omero.security.password_required=false no longer applies for
  administrators: their correct password is always required
- administrators can no longer change the password of other
  administrators who are more privileged in any way
- administrators can no longer reset their password and receive the new
  one by e-mail: they must instead have another administrator who is at
  least as privileged set a new password manually
- cli: the session UUID has been removed from the standard output when
  logging in but can still be retrieved using `bin/omero sessions key`

Improvements include:

-  web: fix loss of privileges when editing full admins
-  web: fix exceptions on invalid connections
-  web: fix CSS in group/user search element
-  web: fix error when public user is disabled
-  web: gray out user role when editing root user
-  insight: permit open_with on original files
-  read-only: reduce error logging for scripts and pixel data
-  scripts: improve error messages for invalid MATLAB
-  as well as various documentation improvements

Sysadmin improvements include:

-  log locale and time zone information on startup

Developer updates include:

-  cli: clean up "communicator not destroyed" logging
-  cli: don't hang when incorrect password passed in a script
-  java: add a map annotation example
-  java: throw a clear exception when -1 is used for all groups
-  web: fix @render_response when extending base templates
-  matlab: contributions from Kouichi Nakamura for working with annotations

This release also upgrades the version of Bio-Formats which OMERO
uses to 5.9.0. **Note:** this is a significant upgrade and will
invalidate the Bio-Formats Memoizer cache. Please see the upgrade
guide for further information.

5.4.6 (May 2018)
----------------

This introduces a significant new subsystem for read-only operation with which
servers can be configured not to make changes to the database, the filesystem, or both. 
The goal is to permit horizontal scaling of OMERO by running multiple servers in parallel
to increase the throughput of data and metadata for large-scale analysis or publishing.
Additionally, a read-only copy of an existing OMERO can be opened safely to the public
for experimentation. For example, this infrastructure supports the public OMERO web
and the Jupyter environment of the 
`Image Data Resource <https://idr.openmicroscopy.org/>`_.
Information on how to configure a read-only server
is available at :doc:`/developers/Server/Clustering`.

Further improvements include:

-  enabled big image support in ImageJ/Fiji
-  reduced the number of threads used by OMERO.web
-  fixed other bugs in OMERO.web including:

   - broken History tab
   - handling of script params
   - pagination calculations
   - public user login
   - browsing to user's data in IE
-  fixed the chosen login ports for OMERO.cli

Developer updates include:

-  a new command to set custom physical pixel size using OMERO.cli
-  deprecated Repository::pixels, TinyImportFixture and OMEROImportFixture
-  improved test infrastructure
-  reduced background events in the center panel plugin when not displaying Thumbnails
-  added extra controls when specifying map and gamma in the rendering engine

This release also upgrades the version of Bio-Formats which OMERO
uses to 5.8.2. **Note:** this is a significant upgrade and will
invalidate the Bio-Formats Memoizer cache. Please see the upgrade
guide for further information.

5.4.5 (March 2018)
------------------

This is a bug-fix release reactivating the thumbnail cache
inadvertently disabled in 5.4.4 while fixing a pyramid issue.

Improvements include:

-  reactivated thumbnail caching
-  improved removepyramids help
-  fixed display of thumbnails when searching for images by ID
-  increased OMERO.web log size
-  fixed CLI config list subcommand
-  fixed leaking services in OMERO.py
-  improved rendering of non-tile large images using OMERO.py and webgateway

This release does not upgrade the version of Bio-Formats which OMERO uses,
which remains at 5.7.3.

5.4.4 (March 2018)
------------------

This is a bug-fix release which also introduces some new functionality.

It includes a security fix for :secvuln:`2017-SV6 <2017-SV6-job-file-link>`. **It is highly
recommended that you upgrade your server**.

Improvements include:

-  images can now be filtered by Tag in the center panel of OMERO.web
-  enabled search by "File" and "Tag" annotations separately in OMERO.web, as
   opposed to only being able to search by All annotations
-  fixed switching between grid display and thumbnail display in OMERO.web
-  fixed the image preview and disabled projection in OMERO.insight when
   trying to project an image with all the channels turned off
-  fixed parsing of polygons and polyline ROIs so they can be opened in ImageJ
-  fixed creation of OMERO pyramids for little-endian files
-  improved error message when login fails for OMERO.insight
-  improved handling of idle connections in OMERO.insight
-  improved loading speed of LUT
-  OMERO.insight and OMERO.importer are now compatible with Java 9

Sysadmin improvements include:

-  improved installation documentation for OMERO.web, and OMERO.server on
   Debian 9, Ubuntu 16.04 and CentOS 7
-  added an admin command and script to allow deletion of corrupted pyramids
   created by a bug introduced with OMERO 5.2 (new uncorrupted pyramids can
   then be generated - see :doc:`/sysadmins/server-upgrade` for details)
-  allowed enforcement of a secure connection when importing data
-  added commands to the CLI sessions plugin to enable the creation and
   removal of user sessions

Developer updates include:

-  improved test infrastructure and coverage
-  allowed filtering by namespace (ns) in webclient, API and annotations
-  added support for more rendering parameters to the API
-  added the option to respect a specific tile size
-  added a method to load planes using JavaGateway
-  added an example to the documentation for using "sudo" to create sessions
   for others with the JavaGateway
-  documentation is now compatible with Sphinx 1.7

This release does not upgrade the version of Bio-Formats which OMERO uses,
which remains at 5.7.3.

5.4.3 (January 2018)
--------------------

This is a bug fix release for a resource leak in omero.gateway.BlitzGateway
introduced with 5.4.2 that caused long-running processes to hang. No other
changes are included.

5.4.2 (January 2018)
--------------------

This is a bug-fix release.

Improvements include:

-  added documentation on a complete workflow for publishing data from
   OMERO.server
-  added references to the new OMERO pyramid format documentation (within the
   OME Data Model and File Formats documentation)
-  faster loading of thumbnails for large Plates after a recent regression
-  made projecting images belonging to another user only possible for users
   with the required permissions to save the new images
-  improved the public user experience for password-less access
-  updated SwingX library version used by OMERO.insight to stop insight-ij
   plugin crashing in Fiji
-  CLI updates:

   * ``import --target`` into a container without the necessary permissions now
     fails before file upload starts and more transparently
   * ``admin mail`` timeout is now configurable via ``--wait``
   * added ``admin log`` command for inserting statements to the server log

Sysadmin changes include:

-  added warning about the need to regenerate your NGINX config for every
   upgrade
-  fixed documentation bug affecting OMERO-version-specific guidance
-  improved OMERO.tables startup stability
-  server performance improvements and reduction in ERROR logging

Developer updates include:

-  extended Python and Java examples to include Map Annotations and histograms
-  added methods for updating OMERO.tables
-  Java Gateway fixes for sessions and rendering
-  fixed retrieval of Plate thumbnail URLs
-  improved 'Editing OMERO.web' documentation
-  improved Slice documentation for API deprecations
-  added instructions to :doc:`/developers/cli/extending` on how to
   create CLI plugins that are ``pip`` installable
-  substantial effort to make third-party repositories easily testable;
   see `omero-test-infra <https://github.com/ome/omero-test-infra>`_
   for more information

This release also upgrades the version of Bio-Formats that OMERO uses to
5.7.3.

5.4.1 (November 2017)
---------------------

This is a bug-fix release.

Improvements include:

-  labeled zoom slider bars in the UI to differentiate from horizontal
   scrollbars and make clear thumbnails can be zoomed (including Plate and
   Well thumbnails)
-  fixes for installation walkthrough documentation - installation of script
   dependencies and gunicorn, and clarification of which user account to use
   for ``pip install`` actions
-  fixed checking of "guest" user
-  update to fetch third-party artifacts over https to allow OMERO to build
   even without a local Maven cache already populated
-  added ``javax.activation`` dependency to allow OMERO.insight to work with
   Java 9
-  import of files reporting extreme pixel sizes now fail rather than hanging
-  pyramid-making now aborts when a tile fails
-  various test fixes
-  CLI fixes:

   * improved help output for graphs commands to make it clearer that
     ``--include`` and ``--exclude`` expect class names not object IDs
   * allowed setting the ``OMERO_PASSWORD`` environment variable instead of
     using the ``-w`` command-line option
   * made passwords hidden by default when running ``omero config get``
   * fixed the CLI metadata tablestest plugin to not use an empty list of
     Columns

This release also upgrades the version of Bio-Formats that OMERO uses to
5.7.2.

5.4.0 (October 2017)
--------------------

A full, production-ready release of OMERO 5.4.0; featuring a new configurable
user role "Restricted Administrators"; further improvements to OMERO.web;
additions to OMERO.cli; and many fixes and performance improvements:

-  added :doc:`/sysadmins/restricted-admins` to allow sysadmins to delegate
   management tasks to facility managers without granting them full system
   admin privileges, or to allow trusted users such as image analysts to carry
   out tasks on behalf of all other users
-  fixed color conversion to RGBA
-  added support for exporting images in a plate as OME-TIFF
-  improved creation of rendering settings for images without any stats
   e.g. 32bit images
-  improved performance for moving large Plates
-  fixed projection of images if the range of timepoints specified is not
   the full range
-  added support for transfering ownership of all the data of a given user
   using CLI
-  renamed "Reverse Intensity" command to "Invert" in image viewers
-  added support for ImageColumn with Screen and Plate targets in the
   populate_metadata script
-  OMERO.web UI fixes:

   * improved display of Plates and Wells
   * fixed label position for Wells
   * added the ability to display Image and Well metadata in the Tables
     section for the same Plate
   * improved copy/paste of rendering settings workflow
   * improved layout of left-hand panel including the position of the search
     panel
   * added support for administrators with restricted privileges to create
     Project/Dataset for other users
   * rolled back the display of tables in the viewer
   * fixed forgotten password functionality

Sysadmin changes include:

-  added support for the creation of administrators with restricted privileges
   in OMERO.web admin panel
-  added method to create administrators with restricted privileges specifying
   a password
-  added specific installation instructions for Debian 9
-  added configuration to limit queries that public users can do in OMERO.web
-  created minimal NGINX configuration file that can be included in a fixed
   file to allow custom NGINX options to be defined only once (e.g. SSL
   options)
-  installed django-redis by default
-  CLI improvements and fixes:

   * fixed admin plugin so "cleanse" can handle larger directories
   * added to chown plugin ability to target all of given users' data
   * adjusted handling of standard input 
   * added infrastructure to load external CLI plugins
   * dropped support for command ``admin ports``
 
Developer updates include:

-  added method to JavaGateway to manipulate admin privileges
-  fixed issue with JSONP decorator
-  removed SciPy dependency
-  adjusted OMERO.blitz API to allow some query results to be cached
-  added support to the rendering engine to update a series of settings in one 
   call
-  added method to OMERO.py to manipulate advanced rendering settings
-  allowed the Maven repository to be overridden
-  removed unused 3rd party libraries in OMERO.web
-  added support for PyTables version 3.4+
-  deprecated Path Object in OMERO Model
-  updated the documentation for server installation on Mac OS to no longer
   use the homebrew formulae from https://github.com/ome/homebrew-alt (these
   are not working and will not be fixed)

Further changes to the Python BlitzGateway are described in
:doc:`/developers/whatsnew`.

This release also upgrades the version of Bio-Formats which OMERO uses to `5.7.1 <https://www.openmicroscopy.org/2017/09/20/bio-formats-5-7-1.html>`_.

5.3.5 (October 2017)
--------------------

This is a security release - see the
:secvuln:`security advisory <2017-SV4-guest-user>` for further details.

It is highly recommended that you upgrade your server.

5.3.4 (September 2017)
----------------------

This is a security release - see the
:secvuln:`security advisory <2017-SV5-filename-2>` for further details.

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.5.3 <https://www.openmicroscopy.org/2017/07/05/bio-formats-5-5-3.html>`_.

It is highly recommended that you upgrade your server.

5.3.3 (June 2017)
-----------------

This is a bug-fix release.

Improvements include:

- support for two new lookup tables from `Janelia <https://www.janelia.org/>`_
- fixed loading of Well in right-panel when browsing Well under Tag tree or from search results
- fixed rotation of labels in figure scripts

Sysadmin changes include:

- clarified the upgrade of the "Open With" option
- allowed installation of OMERO.web with ice 3.5
- fixed recursive loading of feedback in OMERO.web
- provided patch for OMERO.server installation on OS using OpenSSL 1.1.0 e.g. Debian 9
  see :doc:`/sysadmins/troubleshooting`


Developer updates include:

- added an example of how to retrieve shapes from a ROI using batch querying for scalability
- improved logging of errors during deletion
- added new methods to Java Gateway
- improved login options in Java Gateway
- specified an image's dataset in its URL to give more context to OMERO.web apps 


This release also upgrades the version of Bio-Formats which OMERO uses to
`5.5.2 <https://www.openmicroscopy.org/2017/06/15/bio-formats-5-5-2.html>`_.


5.3.2 (May 2017)
----------------

This is a bug-fix release.

Improvements include:

- improved populate_metadata plugin
- fixed deletion of a range of objects from CLI
- textual annotations without a namespace can now be added at import using the CLI
- improved thumbnails retrieval in OMERO.web
- added "Open With" option to the right-hand panel in OMERO.web
- private group owners are now not offered the ability to annotate other
  people's data in OMERO.web UI, an action which was not permitted by the
  server anyway
- preview of wells now available in the right-hand panel

Sysadmin changes include:

- made the Django middleware classes configurable using a new property
- added property to allow connections from specified origins (CORS)
- administrators can now use the CLI to move data between groups without belonging to those groups
- for OMERO.web apps to be available via "Open With" option, administrators need to use
  the "omero.web.open_with" configuration option

Developer updates include:

- exposed more enumerations from ome-model
- added ROIs support to the Web API

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.5.0 <https://www.openmicroscopy.org/2017/05/08/bio-formats-5-5-0.html>`_.

5.3.1 (April 2017)
------------------

This is a bug-fix release focusing on shares.

Improvements include:

- enabled viewing images in share
- enabled importing hidden image files (Windows client issue)
- clarified installation of OMERO.web
- saved polygon and polyline as defined in the OME model
- fixed viewing of images without pixels size
- added support for large image export as jpeg/png from OMERO.insight

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.4.1 <https://www.openmicroscopy.org/2017/04/13/bio-formats-5-4-1.html>`_.

5.3.0 (March 2017)
------------------

A full, production-ready release of OMERO 5.3.0; featuring a major reworking
of OMERO.web and web apps; dropping support for Windows for the server and for
deploying OMERO.web using Apache; and introducing new user features and many
fixes and performance improvements:

-  improved support for many file formats via Bio-Formats 5.4.0
-  introduced ROI Folders
-  new UI for displaying Screen Plate Well data in OMERO.web and OMERO.insight
-  support for lookup tables and reverse intensity rendering
-  color mapping for multiple channels without set colors has been improved to
   use RGBRGB rather than RGBBB (i.e. to loop through red, green, blue rather
   than setting all later channels to blue)
-  support for histograms in the clients and server
-  ability to filter by ratings in OMERO.web
-  added 'Open With...' functionality to OMERO.web
-  color of shapes is now handled according to the data model, using RGBA
   rather than ARGB format (an sql script is available to upgrade existing
   shapes; this will not happen automatically as part of the OMERO upgrade)
-  improved performance for moving and deleting data
-  Wells can now be annotated and searched by annotations
-  enabled downloading/exporting of plate data
-  improved reading of tables data
-  script improvements including ability to create tiled images from big ROIs,
   fixes for creating standard images from ROIs, and to stop the
   Combine_Images script from ignoring pixel sizes set on the target images
-  names for plates and images set in the metadata read by Bio-Formats are now
   imported into OMERO and the filename (which was previously used) is only
   used where an alternative has not been set
-  many bug fixes

Sysadmin changes include:

-  added support for Ice 3.6.3
-  official OMERO.web apps are now all installable from PyPI
-  OMERO.web has been decoupled from the server and can now be deployed
   separately
-  dropped support for Windows for OMERO.server
-  OMERO.web deployment via Apache is no longer supported
-  OMERO.web also now requires Python 2.7
-  CLI improvements including updates to the import output to make it more
   usable by scripts etc.
-  options added for customizing the tree in OMERO.web
-  introduced hide-password option in CLI
-  new options added to ``omero config``
-  removed deprecated client menu properties

Developer updates include:

-  performed major code cleanup
-  major Web API rework
-  adjustment to support the upcoming Java 1.9
-  made python testing package public so it can be used by external clients
-  improved build system integration with local Maven
-  made Scripts repository and official OMERO.web apps pep8 and flake8
   compatible
-  removed restriction on name length
-  added support for enumeration changes
-  utils script classes deprecated
-  deprecated shares
-  deprecated search bridges
-  disabled jquery cache

Further details on breaking changes are available on
`What's new for OMERO 5.3 for developers <https://docs.openmicroscopy.org/omero/5.3.0/developers/whatsnew.html>`_. Work
on the Web API is ongoing and will include moving away from the use of JSONP
and introducing Django CORS.

5.2.8 (March 2017)
------------------

This is a security release including three security vulnerability fixes.

:secvuln:`2017-SV1-filename` prevents users from accessing and manipulating
other people's data by creating an original file and changing its path to
point to another user's file on the underlying filesystem.

:secvuln:`2017-SV2-edit-rw` prevents users in read-write groups from
editing official scripts.

:secvuln:`2017-SV3-delete-script` prevents the deletion of official
scripts by users without the correct permissions to do so.

It is highly recommended that you upgrade your server.

5.2.7 (December 2016)
---------------------

This is a release aimed at system administrators or developers wanting to
build OMERO with Ice 3.6.3.

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.1.10 <https://www.openmicroscopy.org/2016/05/09/bio-formats-5-1-10.html>`_.

All scripts handling Regions of Interest (ROIs) now support ROI not linked to
any plane as defined by the OME Model.

5.2.6 (October 2016)
----------------------

This is a bug-fix release focusing on services closure and a DB upgrade fix.
Improvements include:

-  fixed closure of session in Java when using Ice 3.5
-  fixed memory leak where services were not correctly closed
-  added a DB upgrade patch to fix errors only affecting DBs that have been
   upgraded from OMERO 4.4
-  fixed a MATLAB regression introduced in 5.2.2, casting error.
-  fixed error in logs on getProjectedThumbnail

Support for OMERO.web deployment using Apache has also been deprecated and is
likely to be removed during the 5.3.x line.

5.2.5 (August 2016)
-------------------

This is a security release to fix the access privileges of the share function,
which were potentially allowing users to access private data belonging to
other users via the API.

See :secvuln:`2016-SV2-share` for details. Shares will now respect user
privileges as set by the group permission level. Note that Shares now
**only** support images even when used via the API.

It is highly recommended that you upgrade your server. For those not in a
position to do so as a matter of urgency, a workaround is provided which
deletes all shares and disables their creation.

5.2.4 (May 2016)
----------------

This is a security release to fix the cleanse.py script used by the "bin/omero
admin cleanse" command, which was not properly respecting user permissions and
may lead to data loss.

See :secvuln:`2016-SV1-cleanse` for details. The script and command have now
been made admin-only.

It is highly suggested that you upgrade your server or apply the patch
available from the security page.

5.2.3 (May 2016)
----------------

A bug-fix release. Improvements include:

-  fixed problem with float images
-  all scripts currently exposed to users via our website have been reviewed
   and fixed where necessary so they are all now 5.2.x compatible, and a new
   omero-install workflow has been developed to ensure these are reviewed
   regularly going forward
-  better support for metadata annotations in clients including tag/tagset
   support and performance issues
-  fixes in OMERO.web for deleting MIFs
-  improvements to the navigation of large datasets and display of plates in
   OMERO.web
-  other OMERO.web bug fixes
-  OMERO.insight and CLI import improvements
-  other OMERO.insight bug fixes, including for downloading data

Developer updates include:

-  Java gateway improvements

System administrator updates include:

-  Ice 3.6.2 support for UNIX-like systems, including specific installation
   walkthroughs
-  redis support for websessions caching
-  a fix to allow OMERO.web to be run in a Docker container
-  improved OMERO.web configuration
-  warnings added regarding the
   `end of Windows support in the 5.3.0 release <https://blog.openmicroscopy.org/tech-issues/future-plans/deployment/2016/03/22/windows-support/>`_
   (note that we will be preparing a guide for migrating from Windows for
   existing servers and adding it to the documentation as soon as we can)

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.1.9 <https://www.openmicroscopy.org/2016/04/18/bio-formats-5-1-9.html>`_.

5.2.2 (February 2016)
---------------------

A bug-fix release which also introduces some new client features. Improvements
include:

-  display of ROI masks in OMERO.web image viewer
-  display of OMERO.tables data for Wells in the OMERO.web right hand panel
-  'Populate Metadata' script to enable generation of OMERO.tables for
   Wells is now usable from both OMERO.web and OMERO.insight (note this is
   still in development and has some limitations)
-  measurement tool fixes
-  fixed pixel size metadata and scalebar in OMERO.web image viewer for images
   with pixel size units other than micrometer
-  fixed OMERO.web handling of turning off interpolation of pixels
-  previous and next buttons fixed in OMERO.web image viewer
-  delete and change group performance improvements
-  better handling of dates in search
-  client support for map annotations in OME-TIFF
-  disabled orphaned container feature
-  OMERO.web clean-up to remove obsolete volume viewer

Developer updates include:

-  Python API examples for creating Polygon and Mask shapes
-  Python API example for "Populate Metadata" to create OMERO.tables for
   Wells
-  OMERO.tables documentation extended
-  updated 'What's New for developers' to clarify that ``pojos`` has been
   renamed as ``omero.gateway.model``
-  dynamic scripts functionality documented
-  dynamic loading of omero.client server settings into HTTP sessions

System administrator updates include:

-  clarification of OMERO.web documentation for nginx deployment, including an
   experimental solution to resolve download issues
-  documentation of hard-linking issues for in-place import on linux systems

Note that the OMERO Virtual Appliance has been discontinued and will not be
updated for version 5.2.2 or any later releases.

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.1.8 <https://www.openmicroscopy.org/2016/02/15/bio-formats-5-1-8.html>`_.

5.2.1 (December 2015)
---------------------

A bug-fix release focusing on improving installation documentation and
workflows. Other improvements include:

-  bug fix for missing hierarchy when viewing High Content Screening data
-  improvements to the right-hand panel in OMERO.insight
-  measurement tool fixes
-  OMERO.web fix for displaying size units

System administrator updates include:

-  improved installation documentation, including detailed walkthroughs for
   specific OS
-  OMERO.web deployment fixes

Developer updates include:

-  OMERO Javadocs now link to the relevant version of Bio-Formats Javadocs for
   inherited methods
-  clean-up of server dependencies
-  jstree clean-up
-  CLI graph operation improvements for deleting
-  minimal-omero-client and pom-omero-client clean-up

This release also upgrades the version of Bio-Formats which OMERO uses to
`5.1.7 <https://www.openmicroscopy.org/2015/12/07/bio-formats-5-1-7.html>`_.

5.2.0 (November 2015)
----------------------

A full, production-ready release of OMERO 5.2.0; dropping support for Java
1.6; featuring major upgrading of OMERO.web; re-working of the Java Gateway;
and introducing new user features and many fixes and performance improvements:

-  improved support for many file formats via Bio-Formats 5.1.5
-  faster import for images with a large number of ROIs
-  performance improvements for OMERO.web including faster data tree loading
-  Java Web Start has been dropped, it is no longer possible to launch the
   desktop clients from the web
-  reworked display of metadata and annotations in both UI clients
-  many bugs fixed

Developer and system administrator updates include:

- the OMERO web framework no longer bundles a copy of the Django package, this
  dependency must be installed manually
- updated jstree to 3.08 and now using json for all tree loading to
  substantially improve performance
- removed FastCGI support, OMERO.web can be deployed using WSGI
- configuration property :property:`omero.graphs.wrap` which allowed
  switching back to the old server code for moving and deleting data has now
  been removed. You should migrate to using the new graph request operations
  before 5.3 when the old request operations will be removed
- introduced new Java Gateway to facilitate the development of Java
  applications
- aligned OMERO Rect with OME-XML schema for ROI. Clients using the
  OMERO.blitz server API to work with ROIs will need to be updated


5.1.4 (September 2015)
----------------------

A bug-fix release covering all components. Improvements include:

-  channel buttons fixed in OMERO.web
-  improved UI experience when moving annotated data between groups in
   OMERO.web
-  improved performance for loading annotations in the right-hand panel of
   OMERO.web
-  much better handling of ROIs covering large planes in OMERO.insight
-  rendering setting fixes for copy and paste actions in OMERO.insight
-  rendering fixes for floating point data
-  Admins can now configure whether the clients interpolate images by default
-  better formatting of Delta-T and exposure times in the clients
-  directories are now preserved when downloading multiple original files
-  various improvements to the OMERO-ImageJ handling of ROIs and measurements,
   including the ability to name measurement tables
-  current session key can now be returned via the CLI
-  other CLI improvements including usability of 'chmod' for downgrading group
   permissions, and listing empty tagsets
-  added support for groups in OMERO.matlab methods

Developer updates include:

-  improvements to web logging to log full request and status code
-  fixed joda-time version mismatch
-  cleanup of old insight code to remove remaining references to OMERO.editor

Support for deployment of OMERO.web using FastCGI has also been deprecated in
this release and is scheduled to be removed in 5.2.0. Sysadmins should move to
using WSGI instead. We are also intending to stop distributing Java Webstart
for launching OMERO.insight from your browser, as security concerns mean
browsers are increasingly moving away from supporting this type of
application. You can read further information regarding this decision on our `Web Start blog post <https://blog.openmicroscopy.org/tech-issues/future-plans/2015/09/23/java-web-start/>`_.

5.1.3 (July 2015)
-----------------

A bug-fix release which also introduces some new functionality. Improvements
include:

-  tagging actions extended; you can now use tag sets to tag images on import
-  tagging ome-tiff images at import has also been fixed
-  greatly improved workflow and bug fixes for the Share functionality in
   OMERO.web which enables you to share images with users outside of your
   group (including removal of part of the UI)
-  group admins and owners can now change ownership of data via the CLI
-  better reporting for the 'delete' and 'chgrp' functionality in the CLI
-  fixed display of images in plates with multiple acquisitions
-  fixed export of results as .xls files from OMERO.insight
-  improved workflow for ImageJ and OMERO interactions
-  support for WSGI OMERO.web deployment
-  fixed OMERO.mail service for web errors
-  fixes for ROI display in OMERO.web (thanks to Luca Lianas of CRS4)
-  fixes and workflow improvements for running scripts and script dialogs

Developer updates include:

-  OMERO.web clean-up (removal of '-locked')
-  reorganization of the server bundle to move various licenses and 
   dependencies under a new 'share' folder
-  refactoring of 'Chown2', 'Chmod2', 'Chgrp2' and 'Delete2'
-  addition of dynamic scripts
-  the 'rstring' implementation is now more lenient and should better handle
   unicode
-  Bio-Formats submodule removed from OMERO; decoupling effort means OMERO now
   consumes the Bio-Formats release build from the artifactory

This release also includes the fix for the Java security issue, as discussed
in the
`recent blog post <https://blog.openmicroscopy.org/tech-issues/2015/07/21/java-issue/>`_. Testing
suggests this fix should not have any performance implications. You should
upgrade your Java version to take advantage of the security fix.

5.1.2 (May 2015)
----------------

A bug-fix release which also introduces some new functionality. Improvements
include:

-  support for Read-Write groups
-  the LDAP plugin can now set users as group owners whether on creation or
   via the improved sync_on_login option
-  users logged into the webclient can now automatically log in via webstart
-  results tables from ImageJ/Fiji can be attached to images in OMERO and
   the ImageJ/Fiji workflow has been improved
-  better delete functionality and warnings in the UI
-  improved graph operations like 'delete' and 'chgrp', as well as the new
   'chmod' operation (for changing group permissions), are now used across the
   clients including the CLI
-  an API for setting and querying session timeouts is now available via the
   CLI
-  magnification now reflects microscopy values (e.g. 40x) rather than a
   percentage in both clients
-  more readable truncation of file names in the OMERO.insight data tree
-  OMERO.web fixes and improvements including:

   * interpolation
   * optimization of plate grid and right-hand panel
   * option to download single original files
   * significant speed-up in loading large datasets
   
-  deployment fixes include:

   * new default permissions on the var/ directory
   * better checks of the DropBox directory permissions
   * new and some deprecated environment variables
   * a startup check for lock files on NFS
   * use /var/run for omero.fcgi

Critical bugs which were fixed include:

-  the in-place import file handle leak (which was a regression in 5.1.1)
-  various unicode and unit failures were corrected


5.1.1 (April 2015)
------------------

A bug-fix release focusing on user-facing issues and cleaning resources
for developers. Improvements include:

For OMERO.web:

-  significant review of the web share functionality
-  correction of thumbnail refreshing
-  fixes to the user administration panel
-  fix for embedding of the Javascript image viewer

For OMERO.insight:

-  improved open actions
-  tidying of the menu structure
-  correction of the mouse zoom behavior
-  fix for the Drag-n-Drop functionality

Other updates include:

-  overhaul of the CLI session log-in logic
-  cleaning and testing of all code examples
-  further removal of the use of deprecated methods

5.1.0 (April 2015)
------------------

A full, production-ready release of OMERO 5.1.0; updating the Data Model to
the January 2015 schema, including support for units and new more
flexible user-added metadata; and introducing new user features, new supported
formats and many fixes and performance improvements:

-  support for units throughout the Data Model allowing for example, pixel
   sizes for electron microscopy to be stored in nanometers rather than being
   set as micrometers
-  new, searchable key-value pairs annotations for adding experimental
   metadata (replacing OMERO.editor, which has been removed)
-  improved workflow for rendering settings in the UI and parity between the
   clients
-  import images to OMERO from ImageJ and save ROIs and overlays from ImageJ
   to OMERO
-  importing as another user, previously only available for administrators, is
   now usable by group owners as well, allowing you to import data that will
   then be owned by the user you import it for
-  improved performance for moving and deleting data
-  removed the auto-levels calculation for initial rendering settings to
   substantially speed up performance, by using the min/max pixel intensities,
   or defaulting to full pixel range where min/max is unavailable
-  import times are much improved for large datasets such as HCS and SPIM data
-  improved performance for many file formats and new supported formats via
   Bio-Formats (now over 140)
-  new OMERO.mail feature lets admins configure the server to email users
-  support for configuring the server download policy to control access to
   original file download for public-facing OMERO.web deployments
-  many developer updates such as removal of deprecated methods, and updates
   to OMERO.web and the C++ implementation (see the 5.1.0-m1 to 5.1.0-m5
   developer preview release details below and the 'What's New' for developers
   page)

5.1.0-m5 (March 2015)
---------------------

Developer preview release - **only intended as a developer preview for
updating code before the full public release of 5.1.0. Use at your own risk**.

Changes include:

-  implementation of OMERO.mail for emailing users via the server
-  performance improvements for importing large datasets
-  support for limiting the download of original files
-  various fixes for searching and filtering map annotations and converting
   between units
-  deprecation of IUpdate.deleteObject API method
-  versioning of all JavaScript files to fix browser refresh problems
-  clarifying usage of OMERO.web views and templates including RequestContext

5.1.0-m4 (February 2015)
------------------------

Developer preview release - **only intended as a developer preview for
updating code before the full public release of 5.1.0. Use at your own risk**.

Changes include:

-  final Database changes - image.series is now exposed in Hibernate
-  improved deletion performance
-  client bundle clean-up
-  other clean-up work including pep8 and removal of deprecated methods and
   components
-  new Map annotations are now included in the UI and search functionality
-  ImageJ plugin updates which allow

   * importing of images and saving ROIs to OMERO from within the plugin
   * viewing images stored in OMERO and their ROIs generated within OMERO from
     within the plugin
   * updating ROIs on OMERO-stored images within the plugin and saving these
     back to OMERO without needing to re-import the image

-  OMERO.matlab updates re: annotations
-  OMERO.tables internal HDF5 format has changed

With thanks to Paul Van Schayck and Luca Lianas for their contributions.

5.0.8 (February 2015)
---------------------

This is a bug-fix release for one specific issue causing OMERO.insight to
crash when trying to open the Projection tab for an image with multiple
z-stacks.

5.0.7 (February 2015)
---------------------

This is a bug-fix release covering a number of issues:

-  rendering improvements including 32-bit and float support
-  vast improvements in Mac launching (separate clients for your Java version)
-  faster import of complex plates
-  OMERO.dropbox improvements
-  ROI and measurement tool fixes
-  OMERO.matlab updates

5.1.0-m3 (December 2014)
------------------------

Developer preview release - 3 of 4 development milestones being released in
the lead up to 5.1.0. **Only intended as a developer preview for updating code
before the full public release of 5.1.0. Use at your own risk**.

Changes affecting developers include:

-  implementation of units in the OMERO clients
-  conversions between units
-  OMERO.web updates
-  server-side Graph work to improve speed for moving and deleting
-  OMERO.insight bug-fixes especially for ROIs

5.1.0-m2 (November 2014)
------------------------

Developer preview release - 2 of 3 development milestones being released in
the lead up to 5.1.0. **Only intended as a developer preview for updating code
before the full public release of 5.1.0. Use at your own risk**.

Model changes include:

-  units support, meaning units now have real enums
-  minor fixes for model changes introduced in m1

The units changes mean that the following fields have changed:

-  Plane.PositionX, Y, Z; Plane.DeltaT; Plane.ExposureTime
-  Shape.StrokeWidth; Shape.FontSize
-  DetectorSettings.Voltage; DetectorSettings.ReadOutRate
-  ImagingEnvironment.Temperature; ImagingEnvironment.AirPressure
-  LightSourceSettings.Wavelength
-  Plate.WellOriginX, Y
-  Objective.WorkingDistance
-  Pixels.PhysicalSizeX, Y, Z; Pixels.TimeIncrement
-  StageLabel.X, Y, Z
-  LightSource.Power
-  Detector.Voltage
-  WellSample.PositionX, Y
-  Channel.EmissionWavelength; Channel.PinholeSize;
   Channel.ExcitationWavelength
-  TransmittanceRange.CutOutTolerance; TransmittanceRange.CutInTolerance;
   TransmittanceRange.CutOut; TransmittanceRange.CutIn
-  Laser.RepetitionRate; Laser.Wavelength

Other changes that may affect developers include:

-  ongoing C++ implementation improvements
-  ongoing work to add unit support in OMERO.insight
-  further flake8 work
-  removal of webtest app from OMERO.web to a separate repository
-  removal of deprecated methods in IContainer and RenderingEngine
-  removal of deprecated services IDelete and Gateway
-  Blitz gateway fixes
-  CLI fixes
-  ROI and tables work

5.0.6 (November 2014)
---------------------

This is a critical security fix for two vulnerabilities:

-  :secvuln:`2014-SV3-csrf`
-  :secvuln:`2014-SV4-poodle`

It is strongly suggested that you upgrade your server and
follow the steps outlined on the security vulnerability
pages.

Additionally, a couple of bug fixes for system administrators are included in
this release.

5.1.0-m1 (October 2014)
-----------------------

Developer preview release - 1 of 3 development milestones being released in
the lead up to 5.1.0. **Only intended as a developer preview for updating code
before the full public release of 5.1.0. Use at your own risk**.

Model changes include:

-  channel value has changed from an int to a float
-  acquisitionDate on Image is now optional
-  Pixels and WellSample types are no longer annotatable
-  the following types are now annotatable: Detector, Dichroic, Filter,
   Instrument, LightSource, Objective, Shape
-  introduction of a "Map" type which permits storing key-value pairs, and a
   Map annotation type which allows linking a Map on any annotatable object

Other changes that may affect developers include:

-  strict flake8'ing of all Python code
-  C++ build is now based on CMake and is hopefully much more user-friendly
-  new APIs: SendEmail and DiskUsage
-  the password table now has a "changed" field

5.0.5 / 4.4.12 (September 2014)
-------------------------------

This is a critical security fix for two vulnerabilities:

-  :secvuln:`2014-SV1-unicode-passwords`
-  :secvuln:`2014-SV2-empty-passwords`

It is highly suggested that you upgrade your server and
follow the steps outlined on the security vulnerability
pages.

5.0.4 (September 2014)
----------------------

This is a bug-fix release for the Java 8 issues. It also features a fix for
uploading masks in OMERO.matlab.

You need to upgrade your OMERO server if you want to take advantage of
further improvements in Bio-Formats support for ND2 files.

5.0.3 (August 2014)
-------------------

This is a bug-fix release addressing a number of issues including: 

-  improved metadata saving in MATLAB
-  many bug fixes for ND2 files
-  several other bug fixes to formats including LZW, CZI, ScanR, DICOM, InCell
   6000
-  support for NDPI and Zeiss LSM files larger than 4GB
-  export of RGB images in ImageJ
-  search improvements
-  group owner enhancements
-  Webclient updates including multi-file download

To take advantage of improvements in Bio-Formats support for ND2 files, you
need to upgrade your OMERO.server as well as your clients.

5.0.2 (May 2014)
----------------

This is a bug-fix release addressing a number of issues across all components,
including:

-  import improvements for large image datasets
-  shared rendering settings
-  better tagging workflows
-  disk space usage reporting for OMERO.web admins
-  OMERO.matlab annotation handling
-  custom Web Start intro page templates
-  searching by image ID

To take advantage of improvements in Bio-Formats support for .czi files, you
need to upgrade your OMERO.server as well as your clients.

4.4.11 (April 2014)
-------------------

This is a bug-fix release for the Java Web Start issue. You only need to
upgrade if this is a blocker for you and you cannot upgrade to 5.0.x as yet.
Also note that the OMERO.insight-ij plugin version 4.4.x no longer works for
Fiji, we are working on a fix for this. Plugin version 5.0.x is unaffected.

5.0.1 (April 2014)
------------------

This is a bug-fix release addressing a number of issues across all components,
including:

-  code signing to fix the Java Web Start issues
-  stability improvements to search
-  MATLAB fixes
-  improvements to groups, user menus, file name settings etc
-  new import scenario documentation covering 'in-place' importing.

5.0.0 (February 2014)
---------------------

This represents a major change in how the OMERO server handles files at import
compared with all previous versions of OMERO. Referred to as 'OMERO.fs', this
change means that OMERO uses Bio-Formats to read your files directly from the
filesystem in their original format, rather than converting them and
duplicating the pixel data for storage. In addition, it continues our effort
to support new multidimensional images. The changes are especially important
for sites working with large multi-GB datasets, e.g. long time lapse, HCS and
digital pathology data.

4.4.10 (January 2014)
---------------------

This is a bug-fix release addressing a number of issues across all components,
including:

-  improved tile-loading
-  better network-disconnect handling
-  more flexible
-  webapp deployment
-  Ice 3.5.1 support (except Windows)
-  improved modification of metadata, users and groups

4.4.9 (October 2013)
--------------------

This is a bug-fix release addressing a number of issues across all components,
also including:

-  Ice compatibility issues
-  new scripting sharing service 
-  new user help website
-  new partner project pages.

The minimum system requirement is Java 1.6 (Java 1.5 is no longer supported).

A security vulnerability was identified and resolved, meaning that we strongly
recommend all users upgrade their OMERO clients and servers.

4.4.8p1 (July 2013)
-------------------

This is a patch release addressing a network connection problem in the clients
introduced by a new version of Java.

4.4.8 (May 2013)
----------------

This is bug-fix release addressing two specific issues: a problem with the
OMERO.insight client for Linux, and image thumbnails not loading for
Screens/Plates in Private/Read-Only groups in OMERO.web. You only need to
upgrade if you are an OMERO.insight user on Linux or you are using OMERO.web
to view HCS data in Private or Read-Only groups.

4.4.7 (April 2013)
------------------

This is a point release including several new features and fixes across all
components. This includes improvements in viewing of 'Big' tiled images, new
permission features, new OMERO.web features, and several utility functions in
OMERO.matlab.

4.4.6 (February 2013)
---------------------

This is bug-fix release addressing a number of issues across all components.
This includes a major fix to repair the C++ binding support for Ice 3.4. There
has also been a potentially breaking update to the CLI.

4.4.5 (November 2012)
---------------------

This is bug-fix release focusing on improvements to the OMERO clients.
OMERO.web now supports "batch de-annotation", filtering of images by name and
improved export to OME-TIFF and JPEG. OMERO.insight has fixes to thumbnail
selection and image importing and exporting.

4.4.4 (September 2012)
----------------------

This is a bug-fix release addressing a number of issues across all components.

-  OMERO.insight fixes include connection and configuration options and
   tagging on import.
-  OMERO.web improvements include big image and ROI viewer fixes,
   improved admin and group functionality and rendering/zooming fixes.
-  OMERO.server now has improved LDAP support and VM and homebrew deployments
   as well as fixes for file downloads above 2GB, permissions, memory leaks
   and JDK5.

4.4.3 (August 2012)
-------------------

This is a critical security fix for:

-  :secvuln:`2012-SV1-ldap-authentication`

Anyone using OMERO 4.4.2 or earlier with LDAP
authentication should immediately upgrade to 4.4.3.

4.4.2 (August 2012)
-------------------

This release is a major bug fix for archiving files larger than 2 GB. If you
do not archive files larger than 2 GB, you do not need to upgrade your clients
or your server. There is also a minor fix for an OMERO.imagej plugin security
issue, but it is only necessary to update the version of Bio-Formats that is
installed in ImageJ.

4.4.1 (July 2012)
-----------------

This is a minor release which fixes two import issues. See :ticket:`9372`
and :ticket:`9377`. If you are not using BigTIFF or PerkinElmer .flex files,
then you do not need to upgrade.

4.4.0 (July 2012)
-----------------

This is a major release, which focuses on providing new
functionality for controlling access to data, as well as significant
improvements in our client applications.

The major theme of 4.4.0 is what we refer to as "Permissions", the system by which users control access to their data. It is now possible to move data
between groups, and much, much more.

We also added a few more things for users in 4.4.0, like:

-  OMERO.insight webstart
-  Importing from OMERO.insight is now complete
-  Better integration of OMERO.insight with ImageJ
-  A bottom-to-top reworking of the OMERO.web design

For developers and sysadmins, there are a few things as well:

-  Support for Ice 3.4
-  Removed support for PostgreSQL 8.3

Beta 4.3.4 (January 2012)
-------------------------

This is a point release is a security update to address an LDAP vulnerability.

Beta 4.3.3 (October 2011)
-------------------------

This point release is a short follow on to 4.3.2 to handle various issues
found by users.

Beta 4.3.2 (September 2011)
---------------------------

This is a point release, focusing on fixes for OMERO.web, export, and
documentation. A couple of LDAP fixes were also added, following requests from
the community. We also included something many of you have asked for some
time, OMERO on virtual machines.

Beta 4.3.1 (July 2011)
----------------------

This point release focuses on fixes for Big Images, OMERO.web and others.

Beta 4.3.0 (June 2011)
----------------------

This is a major release, focusing on new functionality for large,
tiled images, and significant improvements in our client applications.

The major theme of 4.3.0 is what we refer to as "Big Images", namely images
with X,Y images larger that 4k x 4k. With this release, OMERO's server and
Java and web clients support tiling and image pyramids. This means we have the
functionality you have probably seen in online map tools, ready for use in any
image file format supported by OMERO (and obviously Bio-Formats). This is
especially important for digital pathology, and other uses of stitched 
imaging.

While the major focus of 4.3.0 was Big Images, there are a number of other new
updates. For users, we have worked hard to synchronise functionality and
appearance across the OMERO clients. This includes viewing of ROIs in
OMERO.web. We are not done, but we have made a lot of progress. Moreover, data
import is now MUCH faster and available from within OMERO.insight.

Beta 4.2.2 (December 2010)
--------------------------

Fixes blocker reported using 4.2.1. Starting with this milestone, all tickets
for the insight client are managed on Trac.

Beta 4.2.1 (November 2010)
--------------------------

This is a point release, focusing on fixes for delete functionality, and
significant improvements in the way OMERO.web production server is deployed.

Beta 4.2.0 (July 2010)
----------------------

This release is a major step for OMERO, enabling a number of critical features
for a fully functional data management system:

-  User and Group Permissions and data visibility between users
-  updates to the OME SPW Model and improvements in HCS data visualisation
-  SSL connection between OMERO clients and server;
-  full scripting system, accessible from command line and within 
   OMERO.insight, including Figure Export and FLIM Analysis
-  ROIs generated in OMERO.insight stored on server
-  extended use of OMERO.Tables for analysis results
-  performance improvements for import and server-side import histories
-  revamped, fully functional OMERO.web web browser interface
-  upgrade of Backend libraries in OMERO.server

Beta 4.1.1 (December 2009)
--------------------------

This release fixes a series of small bugs in our previous Beta 4.1 release.

Beta 4.1 (October 2009)
-----------------------

Improved support for metadata, especially for confocal microscopy; OMERO
supports all of the file formats enabled by Bio-Formats. Export to OME-TIFF
and QuickTime/AVI/MPEG from OMERO. Various improvements to OMERO clients to
improve workflow and use.

This release introduces OMERO.qa - a feedback mechanism, to allow us to
communicate more effectively with our community. OMERO.qa supports uploading
of problematic files, and tracking of responses to any user queries. Moreover,
OMERO.qa includes a demo feature: in collaboration with Urban Liebel at
Karlsruhe Institute of Technology, we are providing demo accounts for OMERO.
Use the Demo link at qa to contact us if you are interested in this.

For users who have had problems with memory-based
crashes in OMERO.insight, the new OpenGL-based ImageViewer may be of interest.
Also, we are now taking advantage of our modeling of HCS data, and releasing
our first clients that support Flex, MIAS, and InCell 1000 file formats.
OMERO.dropbox has been substantially extended, and now supports all the file
formats supported by OMERO.

Beta 4.0.1 (April 2009)
-----------------------

A quick patch release that fixes some bugs and adds some new functionality:

-  Fixed Windows installation and updated docs.
-  Bug fixes (scriptingEngine, importer).
-  Fix .lif import, add Li-Cor 2D (OMERO does gels!).
-  API .dv and OME .ome.tiff now supported by OMERO.fs.
-  Support negative pixel values in Rendering Engine.
-  Archived images are now fully supported in OMERO.
-  OMERO.web merged with OmeroPy in distribution.

Beta 4.0 (March 2009)
---------------------

This release consists of a major change in the remoting infrastructure,
complete migration of existing OMERO clients to the ICE framework, two new
OMERO clients, and integration of OMERO.editor into OMERO.insight.

OMERO.server updates:

-  remove JBOSS, and switch all remoting to ICE
-  improve session management, supporting creation of many thousands of
   session
-  addition of an import service for server-side importing
-  DB upgrades to support the metadata completion facilities
-  substantial improvement to the interaction between the indexing engine and
   the rest of server.

OMERO.importer updates:

-  migration to Blitz interface, giving much faster performance
-  more efficient importing, complete metadata support for Zeiss LSM510, Leica
   LIF, Zeiss ZVI, Applied Precision DV, and MetaMorph STK
-  addition of command line importer for batch import

OMERO.insight updates:

-  migration to Blitz interface, giving much faster performance
-  updates to metadata display, include complete support for OME Data Model
-  much expanded integration of protocol management via OMERO.editor, within
   OMERO.insight
-  support for image delete
-  refinement of Projection Interface

OMERO.web: all new browser-based client for OMERO. Enables sharing of images
with colleagues with an account on server.

OMERO.editor: a management tool for experimental protocols, now fully
integrated with OMERO.insight, so that protocols and experimental descriptions
can be saved along with images and datasets. Includes a new parameters
function, so that protocols in traditional documents can be easily imported
into OMERO. Supports, tables and .xls files. Also runs as a standalone
application.

OMERO.fs: a new OMERO client, that monitors a specific directory and enables
automatic imports. In its first incarnation, has quite limited functionality,
supporting automatic import of LSM510 files only.

Beta 3.2 (November 2008)
------------------------

The final update in the Beta3.x series. A number of fixes:

-  faster thumbnailing and better support for large numbers of thumbnails
-  improved handling of Leica .lei and Zeiss .zvi files
-  extended support for reading OMERO.editor files in OMERO.insight
-  measurement tool fixes in OMERO.insight
-  fixed memory problem in OMERO.insight on Windows
-  fixed thumbnailing and session bugs on OMERO.server
-  fixed DB upgrades for older PostgreSQL versions

Beta 3.0 (June 2008)
--------------------

This release of OMERO is a major update of functionality. In OMERO.server, we
have added support for StructuredAnnotations a flexible data management
facility that allows essentially any kind of accessory data to be linked to
images and experiments stored in OMERO. Alongside this, we provide an indexing
engine, that provides a flexible searching facility for essentially any text
stored in an installation of OMERO.server. Finally, we are releasing our first
examples of clients that use the OMERO.blitz server, a flexible, distributed
interface that supports a range of client environments. One very exciting
addition is OMERO matlab, a gateway that can be used to access OMERO from
MATLAB®.

OMERO Beta3.0 includes a substantial reworking of our clients as well.
OMERO.insight has been substantially updated, with an updated interface to
provide a more natural workflow and support for many different types of
annotations, through the StructuredAnnotations facility. The new search
facilities are supported with smart user interfaces, with auto-complete, etc.
New file formats have been added to OMERO.importer, including support for
OME-XML, and an improved import history facility is now available. Finally,
Beta3.0 includes the first release of our experimental electronic notebook
tool, OMERO.editor. This represents our recent efforts to capture as much
metadata around an experiment as possible.

Beta 2.3.3 insight (April 2008)
-------------------------------

A new Beta 2.3.3 OMERO.insight has been released, this adds rotation to
ellipse figure, and new format for saving intensity values.

Note: this version saves the ROIs in a format which is incompatible with
previous saved ROIs.

Beta 2.3.1 importer (February 2008)
-----------------------------------

A new Beta 2.3.1 OMERO.importer has been released which includes a number of
new formats: Zeiss AxioVision ZVI (Zeiss Vision Image), Nikon NIS-Elements
.ND2 , Olympus FluoView FV1000, ICS (Image Cytometry Standard), PerkinElmer
UltraView, and Jpeg2000.

The OMERO downloads for Beta 2.3 include a number of new options: a
new import history feature, a Windows server installation, and a new tagging
feature for OMERO.insight.

Note: milestone:3.0-Beta2.3 and prior Mac OS X installers for OMERO.server do
not work on Mac OS X Leopard (10.5). Please follow the UNIX-based platform
manual install instructions. Mac OS X installers for OMERO.insight and
OMERO.importer work just fine under Leopard and can be used.

Beta 2.3 (December 2007)
------------------------

This is a patch release for OMERO.server to fix a memory problem. In
OMERO.insight, updating of the tagging facility, viewing of others' rendering
settings and support for server-side compression of images before transport to
client.

Beta 2.2 (November 2007)
------------------------

In this release we have updated OMERO.server to run a newer version of JBOSS
and provided support for copying display settings across a range of images.
More new file formats. OMERO.insight has been updated to support copying
display settings across many images. Image Viewer has been substantially
updated.

Beta 2.1 (August 2007)
----------------------

This is a client-only release. OMERO.insight now supports basic ROI
measurements and a series of new file formats have been added. The OMERO
downloads for Beta 2.0 have been simplified. OMERO.insight and OMERO.importer
have been combined into a single download file called 'OMERO.clients' and the
user documentation is now included inside of the server and client downloads.

Beta 2.0 (June 2007)
--------------------

Note: this version will still work with the Beta 1 server release.

This major update provided our first support for multiple platforms via
OMERO.Blitz. OMERO.insight now supports viewing work of multiple users. Beta 2
is our first release of the Web2.0-like 'tag' system developed in
collaboration with Usable Image from Dundee University Computing department.
This version addresses issues with using our tools under Java 1.6

Beta 1.1 (March 2007)
---------------------

Patch release to fix time-out issues.

Beta 1 (January 2007)
---------------------

The first public OMERO release, providing simple data management. Limited file
format support (DV, STK, TIFF). Simple data visualization and management.

Milestone M3 (November 2006)
----------------------------

Rendering and compression API and client-side import. Access control and
permissions system. Importer based on Bio-Formats.

Milestone M2 (July 2006)
------------------------

The stateful rendering service is functional and all rendering code moved from
Shoola Java client to the server. Also, the stateless services
(IQuery,IUpdate,IPojos) are frozen and testing and documentation is checked
and solidified.

Milestone M1 (April 2006)
-------------------------

Contains minimal functionality needed to run Shoola Java client without Perl
server to demonstrate acceleration of metadata access. Application deployed on
JBoss (https://www.jboss.org). No ACLs or permissions.
