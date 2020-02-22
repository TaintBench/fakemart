Changes from Ant 1.8.2 TO Ant 1.8.3
===================================

Changes that could break older environments:
-------------------------------------------

 * The Enumeration returned by AntClassLoader#getResources used to
   return null in nextElement after hasNextElement would return false.
   It has been changed to throw a NoSuchElementException instead so
   that it now adheres to the contract of java.util.Enumeration.
   Bugzilla Report 51579.

Fixed bugs:
-----------

 * Removed buggy duplicate JAR list in RPM mode.
   Bugzilla Report 52556.

 * Launcher fixed to pass the right class loader parent.
   Bugzilla Report 48633.

 * <junitreport> mishandled ${line.separator}.
   Bugzilla Report 51049.

 * <junitreport> did not work in embedded environments on JDK 7.
   Nor did <xslt> when using Xalan redirects.
   Bugzilla Report 51668, 52382.

 * Encoding of unicode escape sequences by the property file task
   Bugzilla Report 50515.

 * The code that implicitly sets the -source switch if only -target
   has been specified in <javac> was broken for Java 5 and 6.
   Bugzilla Report 50578.

 * MailLogger ignore the Maillogger.starttls.enable property.
   Bugzilla Report 50668.

 * Delete task example does not work
   Bugzilla Report 50816.

 * <splash>'s proxy handling has been delegated to <setproxy>
   internally so the two tasks are consistent.  <splash>'s way of not
   setting a proxy caused problems with other Java libraries.
   Bugzilla Report 50888.

 * Include task breaks dependencies or extension-points for multiple
   files.
   Bugzilla Report 50866.

 * Read on System.in hangs for forked java task.
   Bugzilla Report 50960.

 * FileResource specified using basedir/name attributes was non-functional.

 * Resource collection implementation of mapped PropertySet returned
   unusable resources.

 * The hasmethod condition failed with a NullPointerException when
   ignoresystemclasses is true and Ant tried to load a "restricted
   class" - i.e. a class that the Java VM will only accept when loaded
   via the bootclassloader (a java.* class).
   It will now fail with a more useful error message.
   Bugzilla Report 51035.

 * Exec task may mix the stderr and stdout output while logging it
   Bugzilla Report 50507.

 * Missing space between "finished" and timestamp in task/target 
   finish message from ProfileLogger.
   Bugzilla Report 51109.

 * Redirecting the output of a java, exec or apply task could print in the
   error output stream some "Pipe broken" errors.
   Bugzilla Report 48789.

 * ZipFile failed to clean up some resources which could lead to
   OutOfMemoryException while unzipping large archives.
   A similar problem in ZipArchiveOutputStream has been fixed as well.
   Bugzilla Report 42696.

 * quiet attribute added to the copy and move tasks, to be used together
   with failonerror=false, so warnings won't get logged 
   Bugzilla Report 48789.

 * System.in was closed and not readable anymore by the DefaultInputHandler 
   when Ant is used via its Java API.
   Bugzilla Report 51161

 * <sync> only supported a single non-fileset resource collection even
   though the manual said it could be multiple.

 * <sync> didn't work properly when working on resource collections.
   Bugzilla Report 51462.

 * <augment> cause a NullPointerException if it was used in a target
   that was invoked by multiple targets from the command line.
   Bugzilla Report 50894.

 * The ZipFile class could read past the start of the file if the
   given file is not a ZIP archive and it is smaller than the size of
   a ZIP "end of central directory record".

 * <javac> would create the empty package-info.class file in the wrong
   directory if no destdir was specified.  Note it may still pick the
   wrong directory if you specify more than one source directory but
   no destDir.  It is highly recommended that you always explicitly
   specify the destDir attribute.
   Bugzilla Report 51947.

 * packagemapper now honors the handleDirSep attribute.
   Bugzilla Report 51086.

 * the attributes of macrodef tasks had their values run through
   property expansion twice. Still true by default, but can be disabled.
   Bugzilla Report 42046.

 * jvc doesn't like it if source file names in argument files are
   quoted.
   Bugzilla Report 31667.

 * ZipFile didn't work properly for archives using unicode extra
   fields rather than UTF-8 filenames and the EFS-Flag.

 * Access to DirectoryScanner's default excludes wasn't synchronized.
   Bugzilla Report 52188.

 * When a Project instance was created by a custom tasks its
   createTask method didn't work.
   Bugzilla Report 50788.

Other changes:
--------------

 * -f/-file/-buildfile accepts a directory containing build.xml.

 * The <javacc>, <jjtree> and <jjdoc> now support a new maxmemory
   attribute.
   Bugzilla Report 50513.

 * the documented inputstring attribute of sshexec has been
   implemented and the actually existing attribute inputproperty
   documented.
   Bugzilla Report 50576.

 * The concat task now permits the name of its exposed resource
   by means of its 'resourcename' attribute.

 * The expandproperties filter now accepts a nested propertyset
   which, if specified, provides the properties for expansion.
   Bugzilla Report 51044.

 * <junit filtertrace="true"/> will no longer filter out the very
   first line of the stacktrace containing the original exception
   message even if it matches one of the filter expressions.

 * Upgraded to Apache AntUnit 1.2

 * Provide read access to Mkdir.dir.  Bugzilla Report 51684.

 * <delete> and <move> have a new attribute performGCOnFailedDelete
   that may - when set to true - help resolve some problems with
   deleting empty directories on NFS shares.
   Bugzilla Report 45786.

 * <loadfile> and <loadresource> used to log at level INFO to signal a
   property hasn't been set when the resource was empty even if the
   quiet attribute was set to true.  They will now use VERBOSE
   instead.
   Bugzilla Report 52107.

 * <javac> has a new attribute createMissingPackageInfoClass that can
   be set to false to prevent Ant from creating empty dummy classes
   used for up-to-date-ness checks.
   Bugzilla Report 52096.

 * URLResources#isExists has become less noisy.
   Bugzilla Report 51829.

 * The <retry> task has a new optional attribute retryDelay that can
   be used to make the task sleep between retry attempts.
   Bugzilla Report 52076.

 * <signjar> has new attributes that control the signature and digest
   algorithms.
   Bugzilla Report 52344.

 * Initial support for Java 8.

 * <sshexec> can optionally create a pseudo terminal (like ssh -t)
   Bugzilla Report 52554.

Changes from Ant 1.8.1 TO Ant 1.8.2
===================================

Changes that could break older environments:
-------------------------------------------

 * Prior to Ant 1.8.0 the <copy> task and several other tasks would
   overwrite read-only destination files.  Starting with 1.8.0 they
   would only do so under special circumstances.  Ant 1.8.2 now
   consistently won't replace a read-only file by default. The same is
   true for a number of other tasks.
   The <copy>, <move> and <echo> tasks now have a new force attribute
   and <concat> has a new forceReadonly attribute that can be used to
   make the task overwrite read-only destinations.
   Bugzilla Report 49261.

 * Removed ant-nodeps.jar; it is now merged into ant.jar.

 * DOMElementWriter#encode used to employ special code before encoding
   ampersands so that &#123; remained &#123; rather than being turned
   into &amp;#123;.  This is no longer the case, ampersands will now
   be encoded unconditionally.
   Also DOMElementWriter#encodeData will treat CDATA sections containing a
   literal "]]>" sequence different now - it will split the CDATA
   section between the second "]" and ">" and create two sections.
   This affects <echoxml> task as well as the XML logger or JUnit
   formatter where ampersands will now always get encoded.
   In addition DOMElementWriter will now replace the characters \t, \r
   and \n in attribute values by entity references.
   Bugzilla Report 49404.

 * The list elements returned by ProjectHelper#getExtensionStack are
   now String arrays of length 3 rather than 2 in order to support the
   onMissingExtensionPoint attribute.
   Bugzilla Report 49473.

 * When using <property file="..." prefix="..."/> properties defined
   inside the same file will only get used in expansions if the ${}
   reference uses the same prefix.  This is different from Ant 1.8.1
   but is the same behavior Ant 1.8.0 and earlier exhibited.
   A new attribute prefixValues can be used to re-enable the behavior
   of Ant 1.8.1.
   Bugzilla Report 49373.

 * The files and directories used by Git, Mercurial and Bazaar to
   store their information are now excluded by the defaultexcludes.
   Bugzilla Report 49624.

 * The <junit> task no longer generates TestListener events - which
   have been introduced in ant 1.7.0 - by default.  The task has a new
   attribute enableTestListenerEvents and a new "magic" property
   ant.junit.enabletestlistenerevents has been added that can be used
   to reinstate the old behavior.

Fixed bugs:
-----------

 * hostinfo now prefers addresses with a hostname over addresses without 
   a hostname, provided the addresses have the same scope.
   For local lookup, no IP address will be put in NAME / DOMAIN anymore.
   For remote lookup, if a host name was provided and only an IP address is 
   found, the IP address will no longer overwrite the host name provided to the
   task.
   Bugzilla Report 49513

 * mmap-based file copy problems under JDK 1.4 on Linux.
   Bugzilla Report 49430.

 * The Sun JVM tries to mmap the entire file during a copy. 
   For large files this is not feasible. 
   We now explicitly request to copy at most 16 MiB per request.
   Bugzilla Report 49326.

 * DemuxInputStream.read() should return unsigned values
   Bugzilla Report 49279.

 * The MIME mailer ignored the port parameter when using SSL.
   Bugzilla Report 49267.

 * <xslt> ignored the classpath when using the default TraX processor.
   Bugzilla Report 49271.

 * <checksum>'s totalproperty only worked reliably if the same file
   name didn't occur inside more than one directory.
   Bugzilla Report 36748.

 * <ftp> could fail to download files from remote subdirectories under
   certain circumstances.
   Bugzilla Report 49296.

 * <junit> will now produce better diagnostics when it fails to delete
   a temporary file.
   Bugzilla Report 49419.

 * Ant would often scan directories even though there were known to
   only hold excluded files when evaluating filesets.  This never
   resulted in wrong results but degraded performance of the scan
   itself.
   Bugzilla Report 49420.

 * <javac> failed for long command lines on OS/2.
   Bugzilla Report 49425.

 * <junitreport> did not handle encodings well for stdout/stderr.
   Bugzilla Report 49418.

 * <junit> could issue a warning about multiple versions of Ant on the
   CLASSPATH if two CLASSPATH entries differed in case on a
   case-insensitive file system.
   Bugzilla Report 49041.

 * The <restrict> resource collection was checking every resource even if
   we actually just want the first one, like in the example of use of
   resourcelist in the documentation (getting the first available resource
   from a mirror list).

 * A race condition could lead to build failures if multiple <mkdir>
   tasks were trying to create the same directory.
   Bugzilla Report 49572.

 * the toString() method of the Resources class - and thus any
   ${toString:} expansion of a reference to a <resources> element -
   didn't iterate over its nested elements if it hadn't done so prior
   to the toString invocation already.
   Bugzilla Report 49588.

 * <apply> in parallel mode didn't work together with a nested
   <redirector> if maxparallel was <= 0 (the default) or no source
   files matched.
   Bugzilla Report 49594.

 * <jar filesetmanifest="merge"> didn't work for manifests added via
   <zipfileset>s that used the prefix or fullpath attributes.
   Bugzilla Report 49605.

 * <tempfile createfile="true"> would cause an error unless the prefix
   attribute has been specified.
   Bugzilla Report 49755.

 * If forked, after finished <java> was still reading the input stream
   for a bunch of characters, then stealing them from a following <input>.
   Bugzilla Report 49119.

 * Ant could be leaking threads for each forked process (started by
   <exec>, <apply>, <java> or similar tasks) that didn't receive input
   from a resource or string explicitly.
   Bugzilla Report 49587.

 * Project#setDefault threw an exception when null was passed in as
   argument, even though the Javadoc says null is a valid value.
   Bugzilla Report 49803.

 * runant.py would swallow the first argument if CLASSPATH wasn't set.
   Bugzilla Report 49963.

 * <taskdef> failed to load resources from jar files contained in a
   directory that has a "!" in its name.
   Bugzilla Report 50007.

 * ant.bat exit strategy improvements and issues
   make the exit codes work in environments where 4NT or MKS are installed
   Bugzilla Report 41039.

 * <signjar> would fail if used via its Java API and the File passed
   into the setJar method was not "normalized" (i.e. contained ".."
   segments).
   Bugzilla Report 50081.

 * <delete> ignored <fileset>'s errorOnMissingDir attribute
   Bugzilla Report 50124.

 * <symlink> failed to close files when reading a list of symbolic
   links from a properties file.
   Bugzilla Report 50136.

 * <parallel> could allow tasks to start executing even if a task
   scheduled to run before them timed out.
   Bugzilla Report 49527.

 * If a <junit> batch with multiple tests times out Ant logs a message
   about a test named Batch-With-Multiple-Tests since 1.8.0 but the
   logic that determined the Java package of this pseudo-test has been
   wrong.
   Bugzilla Report 45227.

 * <propertyfile> didn't preserve the original linefeed style when
   updating a file.
   Bugzilla Report 50049.

 * <zip>'s whenEmpty behavior never consulted the non-fileset
   resources so the task could fail even though resources have been
   provided using non-fileset resource collections.
   Bugzilla Issue 50115.

*  ftp chmod could throw a NPE.
   Bugzilla report 50217.

*  The project help (-p option in the command line) will now print
   the dependencies of the targets in debug mode (-d on the command
   line)

Other changes:
--------------

 * <concat>'s force attribute has been deprecated in favor of a new
   overwrite attribute that is consistent with <copy>'s attribute
   names.

 * You can now specify a list of methods to run in a JUnit test case.
   Bugzilla Report 34748.

 * properties in files read because of the -propertyfile command line
   option will now get resolved against other properties that are
   defined before the project starts executing (those from the same or
   earlier -propertfiles or defined via the -D option).
   Bugzilla Report 18732.

 * <pathelement>s can now contain wildcards in order to use wildcard
   CLASSPATH entries introduced with Java6.
   The wildcards are not expanded or even evaluated by Ant and will be
   used literally.  The resulting path may be unusable as a CLASSPATH
   for Java versions prior to Java6 and likely doesn't mean anything
   when used in any other way than a CLASSPATH for a forked Java VM. 
   Bugzilla Report 46842.

 * A new attribute allows targets to deal with nonexistent extension
   points, i.e. they can extend an extension-point if it has been
   defined or silently work as plain targets if it hasn't.  This is
   useful for targets that get included/imported in different
   scenarios where a given extension-point may or may not exist.
   Bugzilla Report 49473.

 * Ant now logs a warning message if it fails to change the file
   modification time in for example when using <touch> or preserving
   timestamps in various tasks.
   Bugzilla Report 49485.

 * ProjectHelpers can now be installed dynamically via the <projecthelper>
   Ant task.

 * <import> is now able to switch to the proper ProjectHelper to parse
   the imported resource. This means that several kinds of different build
   files can import each other.

 * <copy tofile=""> now also works for non-filesystem resources.
   Bugzilla Report 49756.

 * The <linecontainsregexp> filter now supports a casesensitive
   attribute.

 * The <containsregexp> selector now supports casesensitive, multiline
   and singleline attributes.
   Bugzilla Report 49764.

 * A new <cutdirsmapper> can be used like wget's --cut-dirs option to
   strip leading directories from file names.

 * <javah> now supports the GNU project's gcjh compiler.
   Bugzilla Report 50149.

 * <checksum> supports additional views of a file's path as elements
   for a custom pattern.
   Bugzilla Report 50114.

 * JUnit XMLResultAggregator logs the stack trace of caught IO exceptions
   in verbose runs.
   Bugzilla Report 48836.

 * StringUtils.parseHumanSizes() should turn parse failures into
   BuildExceptions.
   Bugzilla Report 48835.

 * New task <bindtargets> to make a list of targets bound to some
   specified extension point.

 * Initial support for OpenJDK7 has been added.

 * Ant now uses java.net.CookieStore rather than
   java.util.ServiceLocator to detect whether the environment is a
   Java 1.6 system.  This means releases of gcj/gij at the time of
   this release of Ant are detected as Java 1.5 and not 1.6.
   Bugzilla Report 50256.

 * It is now possible to write a compiler adapter for <javac> that
   compiles sources with extensions other than .java (but that still
   compile to .class files).
   Bugzilla Report 48829.

 * The performance of VectorSet#add(Object) has been improved which
   should also benefit any operation that scans directories in Ant.
   Bugzilla Report 50200.

Changes from Ant 1.8.0 TO Ant 1.8.1 
===================================

Changes that could break older environments:
-------------------------------------------

 * ant-trax.jar is no longer produced since TrAX is included in JDK 1.4+.

 * Ant no longer ships with Apache Xerces-J or the XML APIs but relies
   on the Java runtime to provide a parser and matching API versions.

 * The stylebook ant task and the ant-stylebook.jar are removed.

Fixed bugs:
-----------

 * Tasks that iterate over task or type definitions, references or
   targets now iterate over copies instead of the live maps to avoid
   ConcurrentModificationExceptions if another thread changes the
   maps.
   Bugzilla Report 48310.

 * The filesmatch condition threw a NullPointerException when
   comparing text files and the second file contained fewer lines than
   the first one.
   Bugzilla Report 48715.

 * Regression: The <ear> task would allow multiple
   META-INF/application.xml files to be added.
   Bugzilla Report 6836.

 * VectorSet#remove(Object) would fail if the size of the vector
   equaled its capacity.

 * Regression : ant -diagnostics was returning with exit code 1
   Bugzilla Report 48782

 * Fix for exec task sometimes inserts extraneous newlines
   Bugzilla Report 48746

 * SymlinkTest#testSymbolicLinkUtilsMethods failing on MacOS
   Bugzilla Report 48785.

 * If <concat>'s first resourcecollection child is a <resources>,
   any subsequently added child resourcecollection joins the first.
   Bugzilla Report 48816.

 * <get> with an invalid URL could trigger an NPE in some JVMs.
   Bugzilla Report 48833

 * Broken Pipe issue under Ubuntu Linux
   Bugzilla Report 48789

 * Properties wrongly read from file or not update during read
   Bugzilla Report 48768

 * AntClassLoader in Ant 1.8.0 has been considerably slower than in
   1.7.1
   Bugzilla Report 48853

 * ANT_CMD_LINE_ARGS are rippling through lower level Ant usage 
   Bugzilla Report 48876

 * email : IO error sending mail with plain mimetype
   Bugzilla Report 48932

 * the complete-ant-cmd.pl script failed to create a proper cache of
   target if "ant -p" failed.
   Bugzilla Report 48980

 * <rmic>'s sourcebase attribute was broken.
   Bugzilla Report 48970

 * <copy>'s failonerror didn't work as expected when copying a single
   element resource collection to a file.
   Bugzilla Report 49070

 * <get> no longer followed redirects if the redirect URL was relative
   and not an absolute URL.
   Bugzilla Report 48972

 * fixed a performance degradation in the code that expands property
   references.
   Bugzilla Reports 48961 and 49079

 * <jar filesetmanifest="merge"> was broken on Windows.
   Bugzilla Report 49090

 * <symlink> delete failed if the link attribute was a relative path
   to a link inside the current directory without a leading ".".
   Bugzilla Report 49137

 * <telnet> and <rexec> failed to find the expected strings when
   waiting for responses and thus always failed.
   Bugzilla Report 49173

Other changes:
--------------

 * Project provides new get methods that return copies instead of the
   live maps of task and type definitions, references and targets.

 * Ant is now more lenient with ZIP extra fields and will be able to
   read archives that it failed to read in earlier versions.
   Bugzilla Report 48781.

 * The <zip> family of tasks has been sped up for bigger archives.
   Bugzilla Report 48755.

 * Add removeKeepExtension option to NetRexxC task.
   Bugzilla Report 48788.

 * Add prefix attribute to loadproperties task.

 * Add resource attribute to length task.

 * PropertyResource will effectively proxy another Resource if ${name}
   evaluates to a Resource object.

 * Added forcestring attribute to equals condition to force evaluation
   of Object args as strings; previously only API-level usage of the
   equals condition allowed Object args, but Ant 1.8.x+ property
   evaluation may yield values of any type.

 * BuildFileTest.assertPropertyUnset() fails with a slightly more 
   meaningful error message
   Bugzilla Report 48834

 * <junit> will now throw an exception if a test name is empty.  This
   used to manifest itself in unrelated errors like
   Bugzilla Report 43586.

 * A change that made <exec> more reliable on Windows (Bugzilla Report
   5003) strongly impacts the performance for commands that execute
   quickly, like attrib.  Basically no single execution of a command
   could take less than a second on Windows.
   A few timeouts have been tweaked to allow these commands to finish
   more quickly but still they will take longer than they did with Ant
   1.7.1.
   Bugzilla Report 48734.

 * Added SimpleBigProjectLogger, intermediate between NoBannerLogger and
   BigProjectLogger.

 * <mappedresources> supports new attributes enablemultiplemappings
   and cache.

 * Added the augment task to manipulate existing references via Ant's basic
   introspection mechanisms.

Changes from Ant 1.8.0RC1 TO Ant 1.8.0
======================================

Changes that could break older environments:
-------------------------------------------

 * the appendtolines filter has been renamed to suffixlines.

Fixed bugs:
-----------

 * stack traces were not reported at all by <junit/>
   when filtertrace="on", which is the default.

 * ant.bat can now also process the -noclasspath switch when it is 
   the first switch on a command line.
   Bugzilla Report 48186.

 * <fixcrlf> now tries to delete the created temporary files earlier.
   Bugzilla Report 48506.

 * the implementation of <zip> had been changed in a way that broke
   the jarjar links task and protentially other third-party subclasses
   as well.
   Bugzilla Report 48541.

 * <scp> task didn't report build file location when a remote operation failed
   Bugzilla Report 48578.

 * <propertyfile> would add the same comment and a date line each time
   it updated an existing property file.
   Bugzilla Report 48558.

 * <sound> didn't work properly in recent Java VMs.
   Bugzilla Report 48637.

Other changes:
--------------

Changes from Ant 1.7.1 TO Ant 1.8.0RC1
======================================

Changes that could break older environments:
-------------------------------------------

 * if and unless attributes (on <target> as well as various tasks and other
   elements) have long permitted ${property} interpolation. Now, if the result
   evaluates to "true" or "false" (or "yes", "no", "on", "off"), that boolean
   value will be used; otherwise the traditional behavior of treating the value
   as a property name (defined ~ true, undefined ~ false) is used. Existing
   scripts could be broken if they perversely defined a property named "false"
   and expected if="false" to be true, or used if="true" expecting this to be
   triggered only if a property named "true" were defined.

 * Ant now requires Java 1.4 or later.

 * Improved handling of InterruptException (lets suppose someone/thing
   is trying to kill the thread when we receive an
   InterruptException), when an InterruptException is received, we do
   not wait anymore in a while loop till the end time has been
   reached.
   Bugzilla Report 42924.

 * Refactor PropertyHelper and introspection APIs to make extension
   more granular and support setting task/type attribute values to
   objects decoded by custom PropertyEvaluator delegates. Also add
   <propertyhelper> task for registering delegates and/or replacing
   the registered PropertyHelper instance.
   Bugzilla Report 42736.

 * Added a restricted form of typedef called <componentdef>. This
   allows definition of elements that can only be within tasks or
   types. This method is now used to define conditions, selectors,
   comparators and filterreaders. This means that tasks may now have
   nested conditions just by implementing the Condition interface,
   rather than extending ConditionBase. It also means that the use of
   namespaces for some of the selectors introduced in Ant 1.7.0 is no
   longer necessary.  Implementing this means that the DynamicElement
   work-around introduced in Ant 1.7.0 has been removed.
   Bugzilla Report 40511.

 * In the <touch> task when a <mapper> is used, the millis and
   datetime attributes now override the time of the source resource if
   provisioned.
   Bugzilla Report 43235.

 * Remove fall-back mechanism for references that are not resolved
   during normal runtime execution.

 * FileUtils.createTempFile now actually creates the file.
   The TempFile task still does not create the file by default, can be
   instructed to do so however using a new parameter.
   Bugzilla Report 33969.

 * A lock in Project ensured that a BuildListener's messageLogged
   method was only ever executed by a single thread at a time, while
   all other methods could be invoked by multiple threads
   simultaniously (while within <parallel>, for example).  This lock
   is no longer in place, messageLogged should be made thread-safe
   now.

 * <sql>'s onError="stop" no longer fails the build if an error
   occurs,  this is the main difference between stop and error and
   matches what the documentation implied.
   Bugzilla Report 24668.

 * Ant's configuration introspection mechanisms have been modified to prefer
   Resource and FileProvider attributes to plain java.io.File attributes;
   however the configuration-from-String behavior remains equivalent, rendering
   a FileResource.

 * CBZip2InputStream will now throw an IOException if
   passed in a null or empty InputStream to read from.
   Bugzilla Reports 32200.

 * <unzip> will now fail when trying to extract certain broken
   archives that would have been silently ignored in earlier version.
   Bugzilla Report 35000.

 * Ant's <zip> family of tasks tries to preserve the existing Unix
   permissions when updating archives or copying entries from one
   archive to another.
   Since not all archiving tools support storing Unix permissions in
   the same way that is used by Ant, sometimes the permissions read by
   Ant seem to be 0, which means nobody is allowed to do anything to
   the file or directory.
   If Ant now encounters a permission set of 0 it will assume that
   this is not the intended value and instead apply its own default
   values.  Ant used to create entries with 0 permissions itself.
   The <zip> family of tasks has a new attribute preserve0permissions
   that can be set to restore the old behavior.
   Bugzilla Report 42122.

 * If a batch containing multiple JUnit tests running inside a forked
   Java VM caused the VM to crash (or caused a timeout), the
   formatters would receive an error message for the last test in the
   batch.
   Ant will now pass in a test with the name "Batch-With-Multiple-Tests"
   instead - this is supposed to show more clearly that the last test
   may not have started at all.
   Bugzilla Report 45227.

 * If the number of minutes a build takes is bigger then 1000 Ant will
   no longer print a thousands separator in the "elapsed time"
   message.  It used to be the thousands separator of the current
   locale.
   Bugzilla Report 44659.

 * <symlink action="delete"> used to fail if the link was broken (i.e.
   pointing to a file or directory that no longer existed).  It will now
   silently try to remove the link.
   Bugzilla Report 41285.

 * <delete file="..."> used to log a warning and not delete broken
   symbolic links.  <delete dir="..."/> didn't even log a warning.
   The task will now try to delete them in both cases.
   Bugzilla Report 41285.

 * if the dir attribute of a <fileset> points to a symbolic link and
   followsymlinks is set to false, the fileset will no longer be
   scanned and always seem empty.
   Bugzilla Report 45741.

 * the .NET tasks that have been deprecated since Ant 1.7.0 have been
   removed, please use the stand-alone Antlib you can find at
   http://ant.apache.org/antlibs/dotnet/index.html
   instead.

 * the logic of closing streams connected to forked processes (read
   the input and output of <exec> and friends) has been changed to
   deal with cases where child processes of the forked processes live
   longer than their parents and keep Ant from exiting.
   It is unlikely but possible that the changed logic breaks stream
   handling on certain Java VMs.
   Bugzilla issue 5003.

 * <checksum>'s totalproperty was platform dependent because it relied
   on java.io.File#compareTo.  It has now been made platform
   independent, which means that totalPropery values obtained on
   Windows (and other systems where the sort order of File is not case
   sensitive) can be different from the values obtained with earlier
   versions of Ant.
   Bugzilla Report 36748.

 * globmapper didn't work properly if the "to" or "from" patterns
   didn't contain a "*".  In particular it implicitly added a * to the
   end of the pattern(s).  This is no longer the case.  If you relied
   on this behavior you will now need to explicitly specify the
   trailing "*".
   Bugzilla Report 46506.

 * <copy> silently ignored missing resources even with
   failOnError="true".  If your build tries to copy non-existant
   resources and you relied on this behavior you must now explicitly
   set failOnError to false.
   Bugzilla Report 47362.

 * Ant now prefers the java.runtime.version system property over
   java.vm.version for the Created-By Manifest attribute.
   Bugzilla Report 47632.

 * The <image> task now supports a nested mapper.  In order to
   implement this, the Java API of the task had to change so any
   custom subclass overriding the processFile method will need to
   adapt (by overriding the new two-arg processFile method).
   Bugzilla Report 23243.

 * A new property syntax can be used to set attributes from
   references: ${ant.ref:some-reference}

   In most cases this will yield the exact same result as 
   ${toString:some-reference} - only when an attribute setter method
   accepts an object type other than string and the project's
   reference is an Object of matching type the new syntax will pass in
   that object.

   If your build file already contains properties whose name starts
   with "ant.ref:" there is a potential for collision.  If your
   property has been set, normal property expansion will take
   precedence over the new syntax.  If the property has not been set
   and a reference with the postfix of your property name exists
   (i.e. in a very unlikely event) then the new syntax would yield a
   different result (an expanded property) than Ant 1.7.1 did.

 * A ProjectHelper implementation can now provide the default build file
   name it is expecting, and can specify if they can support a specific build
   file. So Ant is now capable of supporting several ProjectHelper
   implementations, deciding on which to use depending of the input build file.

 * Mapper-aware selectors (depends, different, present) now accept typedef'd
   FileNameMappers.

Fixed bugs:
-----------

 * The default logger was failing to print complete stack traces for
   exceptions other than BuildException when inside <ant> or
   <antcall>, thus omitting often important diagnostic
   information.
   Bugzilla 43398 (continued).

 * Better handling of package-info.class.
   Bugzilla Report 43114.

 * RPM task needed an inserted space between the define and the value.
   Bugzilla Report 46659.

 * Got rid of deadlock between in, out and err in the Redirector. 
   Bugzilla Report 44544.

 * Caused by AssertionError no longer filtered.
   Bugzilla Report 45631.
 
 * <zip> would sometimes recreate JARs unnecessarily.
   Bugzilla Report 45902.

 * <symlink> task couldn't overwrite existing symlinks that pointed to
   nonexistent files
   Bugzilla Report 38199.

 * <symlink> task couldn't overwrite files that were in the way of the symlink.
   Bugzilla Report 43426.

 * <symlink> task failonerror="false" does not stop build from failing
   when 'ln' command returns non-zero.
   Bugzilla Report 43624

 * <touch> task couldn't differentiate between "no resources
   specified" and "no resources matched."
   Bugzilla Report 43799.

 * ManifestClassPath failed when a relative path would traverse the
   file system root.
   Bugzilla Report 44499.

 * <globmapper> had an indexoutofbounds when the prefix and postfix
   overlapped.
   Bugzilla Report 44731.

 * <typedef> and <taskdef> failed to accept file names with #
   characters in them.
   Bugzilla Report 45190

 * A deadlock could occur if a BuildListener tried to access an Ant property
   within messageLogged while a different thread also accessed one.
   Bugzilla Report 45194

 * Handle null result of system getProperty() in CommandlineJava.
   Similar to Bugzilla Report 42334.

 * Length task did not process nonexistent Resources even though these might
   conceivably still carry file length information.
   Bugzilla Report 45271.

 * <javac>'s includeJavaRuntime="false" should work for gcj now.  Note
   that you may need to set includeAntRuntime to false in order to
   have full control.
   Bugzilla Report 34638.

 * <sql> would fail if the executed statment didn't return a result
   set with some JDBC driver that dissalow Statement.getResultSet to
   be called in such a situation.
   Bugzilla Report 36265 

 * if the executed statement in <sql> returned a result set and an
   update count, the count would be lost.

 * if an executed statement in <sql> mixes update count and result set
   parts, some result sets wouldn't get printed.
   Bugzilla Report 32168.

 * XmlLogger could lose messages if <parallel> is used.
   Bugzilla Report 25734.

 * <scp> creates remoteToDir if it doesn't exist.
   Bugzilla Report 42781

 * CBZip2OutputStream threw an exception if it was closed prior to
   writing anything.
   Bugzilla Reports 32200, 45836

 * The IPlanetDeploymentTool didn't use the configured DTD locations.
   Bugzilla Report 31876.

 * The ant shell script printed a warning under Cygwin if JAVA_HOME
   was not set.
   Bugzilla Report 45245.

 * <filterset> sometimes incorrectly flagged infinite recursions of
   filter tokens
   Bugzilla Report 44226.

 * failures were treated as errors in forked JUnit tests when JUnit 4
   was used.
   Bugzilla Report 43892.

 * <jar> and <manifest> disallowed manifest attributes whose name
   contained the character '8'.
   Bugzilla Report 45675.

 * BigProjectLogger would set the project's basedir to the current
   working directory.
   Bugzilla Report 45607.

 * only <formatter>s that logged to a file were notified if forked VM
   crashed or a timeout occured in <junit>.
   Bugzilla Report 37312.

 * ant -v -version would print the version information twice.
   Bugzilla Report 45695.

 * when nested into builds that have been invoked by <ant> tasks
   <subant> might set the wrong basedir on the called projects.
   Bugzilla Report 30569.

 * If the message of the failed assertion of a forked JUnit test
   contained line feeds some excess output ended up in Ant's log.
   Bugzilla Report 45411.

 * <symlink action="delete"> failed to delete a link that pointed to
   a parent directory.
   Bugzilla Report 45743.

 * <symlink action="delete"> failed if ant lacked permission to rename
   the link's target.
   Bugzilla Report 41525.

 * when checking whether a jar is signed, <signjar> ignored the
   sigfile attribute.
   Bugzilla Report 44805.

 * When using JavaMail all <mail> tasks used the same mail host
   regardless of their configuration.
   Bugzilla Report 37970.

 * <signjar> and <issigned> didn't handle aliases with characters other
   than numbers, letters, hyphen or underscore properly.
   Bugzilla Report 45820.

 * <filterset> could miss multi-character begin tokens in some cases.
   Bugzilla Report 45094.

 * <depend> didn't close JARs that were part of the classpath.
   Bugzilla Report 45955.

 * in some cases <depend> would delete class files even if it didn't
   find the corresponding source files.
   Bugzilla Report 45916.

 * <javadoc> failed if the nested <bottom> or <head> contained line
   breaks.
   Bugzilla Report 43342.

 * encoding="auto" has been broken in <mail> since Ant 1.7.0 and only
   worked if JavaMail was available.
   Bugzilla Report 42389.

 * MailLogger could cause a NullPointerException.
   Bugzilla Report 44009.

 * <junit> didn't recognize failed assertions as failures if they
   caused subclasses of AssertionError to be thrown (like
   org.junit.ComparisonFailure that is thrown when assertEquals
   fails).
   Bugzilla Report 45028.

 * the Unix "ant" wrapper script failed to protect wildcards in
   command line arguments in some cases.
   Bugzilla Report 31601.

 * <cvstagdiff> crippled file names and could miss some entries if
   multiple modules have been specified.
   Bugzilla Report 35301.

 * Tasks with a "public void add(SomeType)" method failed to work as
   TaskContainers at the same time.
   Bugzilla Report 41647.

 * Tasks that implementes DynamicElemen or DynamicElementNS failed to
   work as TaskContainers at the same time.
   Bugzilla Report 41647.

 * combining SSL and authentication in <mail> and MailLogger failed in
   some setups.
   Bugzilla Report 46063.

 * if an error occurs while logging the buildFinished event, the
   original error is now logged to System.err.
   Bugzilla Report 25086.

 * <copy> failed with a NullPointerException when copying a resource
   without a name.  It will now fail with a meaningful error message.
   Bugzilla Report 39960.

 * <xslt> now uses the configured classpath to load the factory (when
   using TraX) before falling back to Ant's own classpath.
   Bugzilla Report 46172.

 * <dependset> complained about files being modified in the future if
   they had been just very recently (within Ant's assumed granularity
   of the file system).
   Bugzilla Report 43665.

 * <sshexec> didn't store the ouput in outputproperty if the remote
   command failed.
   Bugzilla Report 46340.

 * DirectoryScanner's slow-scanning algorithm that is used when you
   ask for excluded or not-included files and/or directories could
   miss some files and directories in the presence of recursive
   exclude patterns.

 * <sort> resource collection kept only one of entries deemed equal by
   the chosen Comparator.
   Bugzilla Report 46527.

 * the ZipFile class used by <unzip> and others could leave the
   archive open (making it undeletable on Windows as long as the java
   VM was running) for files with an unexpected internal structure.
   Bugzilla Report 46559.

 * The zip package now supports the extra fields invented by InfoZIP
   in order to store Unicode file names and comments.

 * The zip package detects the encoding bit set by more modern
   archivers when they write UTF-8 filenames and optionally sets it
   when writing zips or jars.
   Bugzilla Report 45548

 * <sync> could run into a NullPointerException when faced with broken
   symbolic links.
   Bugzilla Report 46747.

 * The ant shell script should now support MSYS/MinGW as well.
   Bugzilla Report 46936.

 * <signjar> has a new force attribute that allows re-signing of jars
   that are already signed.
   Bugzilla Report 46891.

 * <sshexec> now again honors failonerror in the face of connection
   errors.
   Bugzilla Report 46829.

 * The <replacetokens> filter threw an exception if the stream to
   filter ended with a begin token.
   Bugzilla Report 47306.

 * <scriptmapper>, <scriptfilter> and <scriptcondition> didn't support
   the setbeans attribute.
   Bugzilla Report 47336.

 * <loadproperties>' encoding attribute didn't work.
   Bugzilla Report 47382.

 * Ant created tar archives could contain random bytes at the end
   which confused some untar implementations.
   Bugzilla Report 47421.

 * various places where unchecked PrintWriters could hide exceptions
   have been revisited to now check the error status or not use a
   PrintWriter at all.
   Bugzilla Report 43537.

 * filesetmanifest="mergewithoutmain" in <jar> didn't treat inline
   manifests as expected.
   Bugzilla Report 29731.

 * <record> didn't work properly with nested builds.
   Bugzilla Report 41368. 

 * <jar> with filesetmanifest different from skip didn't work if the
   update attribute has been set to true.
   Bugzilla Report 30751.

 * The default stylesheets for <junitreport> failed to properly escape
   XML content in exception stack traces.
   Bugzilla Report 39492.

 * AntClassLoader didn't set the proper CodeSource for loaded classes.
   Bugzilla Report 20174.

 * AntClassLoader.getResourceAsStream would return streams to
   resources it didn't return with getResource and to classes it
   failed to load.
   Bugzilla Report 44103.

 * Logging exceptions without a message would cause a
   NullPointerException.
   Bugzilla Report 47623.

 * WeblogicDeploymentTool could fail on platforms with a file
   separator other than "/".
   Bugzilla Report 35649.

 * The update attribute of the modified selector was ignored.
   Bugzilla Report 32597.

 * <manifest> and <jar> can now merge Class-Path attributes from
   multiple sources and optionally flatten them into a single
   attribute.
   The default behaviour still is to keep multiple Class-Path
   attributes if they have been specified and to only include the
   attributes of the last merged manifest.
   Bugzilla Report 39655.

 * <delete> didn't work correctly with a <modified> selector because
   it was scanning the same filesets more than once.
   Bugzilla Report 43574.

 * when using custom filterreaders with the <filterreader classname="">
   syntax Ant could leak memory.
   The problem didn't occur when using <typedef> or <componentdef> to
   define the filterreader which is the recommended approach.
   Bugzilla Report 45439.

 * Ant didn't set the proper "magic" value for tar entries containing
   long file names in GNU longfile mode.
   Bugzilla Report 47653.

 * The tar task failed to recognize that the archive had to be
   (re-)created in some cases where the sources are filesystem based
   resources but not filesets.
   Bugzilla Report 48035. 

 * <sshexec>'s outputproperty was prefixed by the executed command
   when the command attribute has been used, breaking backwards
   compatibility to Ant 1.7.0.
   Bugzilla Report 48040.

 * different task instances of the same <scriptdef>ed tasks could
   overwrite each others attributes/nested elements.
   Bugzilla Report 41602.

 * The Hashvalue algortihm implementation of the modified task could
   fail to read the file(s) completely.
   Bugzilla Report 48313.

Other changes:
--------------

 * The get task now also follows redirects from http to https
   Bugzilla Report 47433

 * A HostInfo task was added performing information on hosts, including info on 
   the host ant is running on. 
   Bugzilla Reports 45861 and 31164.

 * There is now a FileProvider interface for resources that act as a source
   of filenames. This should be used by tasks that require resources
   to provide filenames, rather than require that all resources
   are instances or subclasses of FileResource.
   Bugzilla Report 43348

 * There is now a URLProvider interface for resources that act as a
   source of URLs. This should be used by tasks that require resources
   to provide URLs, rather than require that all resources are
   instances or subclasses of URLResource.

 * Fixcrlf now gives better error messages on bad directory attributes.
   Bugzilla Report 43936

 * a new property ant.project.default-target holds the value of the
   current <project>'s default attribute.

 * a new property ant.project.invoked-targets holds a comma separated
   list of the targets that have been specified on the command line
   (the IDE, an <ant> task ...) when invoking the current project.

 * The <type> resource selector has had an "any" type added for better
   configurability.

 * Ant should detect the OS as both a Mac and a Unix system when
   running on OpenJDK.
   Bugzilla Report 44889.

 * new protected getConnection and getStatement methods allow
   subclasses of SQLExec more control - or access to the cached
   instances when overriding other methods like runStatements.
   Bugzilla Report 27178.

 * <sql> has a new failOnConnectionError attribute that can be used to
   keep a build going even if the task failed to connect to the
   database.
   Bugzilla Report 36712.

 * A new attribute strictDelimiterMatching can be used to ignore case
   or whitespace differences when <sql> searches for delimiters.
   This is useful if you execute a SQL script that has contains "GO"
   and "go" as delimiters.
   Bugzilla Report 26459.

 * A new showWarnings attribute of <sql> allows warnings to be logged.
   Bugzilla Report 41836.

 * A new treatWarningsAsErrors attribute of <sql> can be used to fail
   a build if a warning occurs.
   Bugzilla Report 41836.

 * Ant now supports scoped properties (see Local task).
   Bugzilla Report 23942.

 * <sql>'s CSV output can be controlled via the new attributes
   csvColumnSeparator and csvQuoteCharacter.
   Bugzilla Report 35627.

 * <ftp>'s logging has been improved.
   Bugzilla Reports 30932, 31743.

 * It is now possible to disable <ftp>'s remote verification.
   Bugzilla Report 35471.

 * <sshexec> now supports input in a way similar to <exec>
   Bugzilla Report 39197.

 * <scp> can now preserve the file modification time when downloading
   files.
   Bugzilla Report 33939.

 * the new task sshsession can run multiple tasks in the presence of
   an SSH session providing (local and remote) tunnels.
   Bugzilla Report 43083.

 * ZipOutputStream has been sped up for certain usage scenarios that
   are not used by Ant's family of zip tasks.
   Bugzilla Report 45396.

 * <echo> supports an "output" Resource attribute as an alternative to "file".

 * <sql> "output" attribute now supports any Resource in addition to a file.

 * <scp> no longer requires a passphrase when using key based
   authentication.
   Bugzilla Report 33718.

 * a new failOnEmptyArchive attribute on <unzip> and <untar> can now
   make the task fail the build if it tries to extract an empty
   archive.

 * <unzip> and <untar> have a new attribute stripAbsolutePathSpec.
   When set to true, Ant will remove any leading path separator from
   the archived entry's name before extracting it (making the name a
   relative file name).
   Bugzilla Report 28911.

 * <unzip> will now detect that it was asked to extract a file that is
   not an archive earlier if the file is big.
   Bugzilla Report 45463.

 * New file and resource selectors <readable/> and <writable/> have
   been added that select file which the current process can read or
   write.
   Bugzilla Report 45081.

 * The filename file selector has a new attribute regex that allows
   files to be selected by matching their names against a regular
   expression.
   Bugzilla Report 45284

 * The name resource selector has a new attribute regex that allows
   resources to be selected by matching their names against a regular
   expression.
   Bugzilla Report 45284

 * Enhanced performance of Project.fireMessageLoggedEvent and DirectoryScanner 
   Bugzilla Reports 45651 and 45665

 * The package list location for offline links can now be specified as
   an URL.
   Bugzilla Report 28881

 * <echoxml> now supports XML namespaces.
   Bugzilla Report 36804.

 * A new listener for <junit> has been added that tries to invoke the
   tearDown method of a TestCase if that TestCase was run in a forked
   VM and the VM crashed or a timeout occured.  See the <junit> task's
   manual page for details.
   Bugzilla Report 37241.

 * The Jar task now supports the addition of a jar index file in update mode.
   Previously the absence of the index was not enough to trigger the rebuild;
   some other update was necessary.
   Bugzilla report 45098.

 * <ant> has a new attribute "useNativeBasedir" that makes the child
   build use the same basedir it would have used if invoked from the
   command line.  No matter what other attributes/properties have been
   set.
   Bugzilla Report 45711.

 * <patch> has a new optional failOnError attribute.
   Bugzilla Report 44772.

 * Antlib descriptors will now be parsed by the configured
   ProjectHelper if the implementation overrides the new
   canParseAntlibDescriptor and parseAntlibDescriptor methods.  If the
   configured helper doesn't override the methods, a new instance of
   ProjectHelper2 will be used just like in Ant 1.7.1.
   Bugzilla Report 42208.

 * It is now possible to explicitly set the executable used by
   <signjar>.
   Bugzilla Report 39189.

 * <compositemapper>'s order of results is now predictable.
   Bugzilla Report 44873

 * a new <firstmatchmapper> has been added, which works similar to
   <compositemapper> but only returns the results of the first nested
   mapper that matches.
   Bugzilla Report 44873

 * <get> has a new maxtime attribute that terminates downloads that
   are taking too long.
   Bugzilla Report 45181.

 * <ftp> now supports selectors for remote directories as well.
   Bugzilla Report 44726.

 * In some cases Ant fails to rename files if the source or target
   file has just recently been closed on Windows.  It will now try to
   delete the offending file once again after giving the Java VM time
   to really close the file.
   Bugzilla Report 45960.

 * two new properties can be used to set the MIME-Type and charset
   used by MailLogger.
   Bugzilla Report 27211.

 * a new attribute of <mail> allows the task to succeed if it can
   reach at least one given recipient.
   Bugzilla Report 36446.

 * two new properties allow MailLogger to send a fixed text instead of
   the log file.
   Bugzilla Report 38029.

 * <cvsversion> is supposed to support CVSNT now.
   Bugzilla Report 31409.

 * <cvs>' port attribute should now work for all clients that use the
   environment variable CVS_PSERVER_PORT instead of the "official"
   CVS_CLIENT_PORT.
   Bugzilla Report 30124.

 * <cvsversion> now works for local repositories as well.

 * <cvstagdiff> has an option to ignore removed files now.
   Bugzilla Report 26257.

 * <cvs> and friends now support modules with spaces in their names
   via nested <module> elements.

 * A new attribute "ignoreEmpty" controls how <concat> deals when
   there are no resources to concatenate.  If it is set to false, the
   destination file will be created regardless, which reinstates the
   behavior of Ant 1.7.0.
   Bugzilla Report 46010.

 * If the new remote attribute is set to true, <cvschangelog> can now
   work against a remote repository without any working copy.
   Bugzilla Report 27419.

 * start and end tags can now be used instead of dates in
   <cvschangelog>.
   Bugzilla Report 27419.

 * MailLogger and <mail> can now optionally enable support for
   STARTTLS.
   Bugzilla Report 46063.

 * <import> has new attributes "as" and "prefixSeparator" that can be
   used to control the prefix prepended to the imported targets'
   names.

 * a new task <include> provides an alternative to <import> that
   should be preferred when you don't want to override any targets.

 * delete has a new attribute removeNotFollowedSymlink.  If set to
   true, symbolic links not followed (because followSymlinks was false
   or the number of symlinks was too big) will be removed.
   Bugzilla Report 36658.

 * the os and osfamily attributes of <chown>, <chgrp>, <chmod> and
   <attrib> can now be used to run the commands on operating systems
   other than their "native" environment, i.e. non-Unix or non-Windows
   operating systems respectively.
   Bugzilla Report 7624.

 * a new resource collection <mappedresources> generalizes the prefix
   and fullpath attributes of <zipfileset> to arbitrary mappers that
   can be applied to arbitrary resource collections.
   Bugzilla Report 4240.

 * <tarfileset> and <zipfileset> have a new attribute
   errorOnMissingArchive that allows "optional" filesets that don't
   break the build if the archive doesn't exist.
   Bugzilla Report 46091.

 * <javadoc> has new attributes that correspond to the
   -docfilessubdirs and -excludedocfilessubdir command line arguments.
   Bugzilla Report 34455.

 * <xslt> now fails early if a specified stylesheet doesn't exist.
   Bugzilla Report 34525.

 * <xslt> now has an option to supress transformer warnings.  This
   option only has an effect for processors that support this feature;
   the "trax" processor included with Ant does support it.
   Bugzilla Report 18897.

 * <xslt> has two new attributes failOnError and
   failOnTransformationError that can be used to not make the build
   process proceed if an error occurs.
   Bugzilla Report 36260.

 * <xslt> has a new attribute failOnNoResources that can be used to 
   make the build fail/continue if the collection of resources to
   transform is empty.
   Bugzilla Report 46274.

 * It is now possible to define system properties that should be set
   during xslt's transformation.  This can be used to enable XInclude
   processing in Xerces, for example.
   Bugzilla Report 36653.

 * a new resource collection <archives> can be used to specify
   collections of ZIP and TAR archives as sources.  It extracts them on
   the fly.  This is a generalization of the <zipgroupfileset> found
   as nested element of <zip> and friends.
   Bugzilla Report 46257.

 * <dependset> has a new verbose attribute that makes the task list
   all deleted targets and give a hint as to why it deleted them.
   Bugzilla Report 13681.

 * <replaceregexp> now supports arbitrary filesystem based resource
   collections.
   Bugzilla Report 46341.

 * <replace> now supports arbitrary filesystem based resource
   collections.
   Bugzilla Report 24062.

 * token and value of <replace>'s nested <replacefilter> can now also
   be specified as nested elements to allow multiline content more
   easily.
   Bugzilla Report 39568.

 * <replace> and <replaceregexp> can now optionally preserve the file
   timestamp even if the file is modified.
   Bugzilla Report 39002.

 * The <replace> child-elements <replacetoken> and <replacevalue> have
   a new attribute that controls whether properties in nested text get
   expanded.
   Bugzilla Report 11585.

 * <replace> has a new attribute failOnNoReplacements that makes the
   build fail if the task didn't do anything.
   Bugzilla Report 21064.

 * <sync>'s <preserveInTarget> has a new attribute that controls
   whether empty directories should be kept.
   Bugzilla Report 43159.

 * ant -diagnostics now checks that it can read as much from the
   temporary directory as it has written.  This may help detecting a
   full filesystem.
   Bugzilla Report 32676.

 * <pathconvert> has a new preserveduplicates attribute--historically
   these were eliminated in the interest of behaving in the manner
   of a "path."

 * <javac>'s source and target attributes are no longer ignored when
   using gcj.
   Bugzilla Issue 46617.

 * ant -diagnostics now outputs information about the default XSLT
   processor.
   Bugzilla Issue 46612.

 * the ZIP library will now ignore ZIP extra fields that don't specify
   a size.
   Bugzilla Report 42940.

 * CBZip2OutputStream now has a finish method separate from close.
   Bugzilla Report 42713.

 * the <zip> and <unzip> family of tasks has new options to deal with
   file name and comment encoding.  Please see the zip tasks'
   documentation for details.

 * <input ...><handler type="secure" /></input> now uses previously
   undocumented SecureInputHandler shipped with Ant 1.7.1.

 * Command line arguments for <exec> and similar tasks can now have
   optional prefix and suffix attributes.
   Bugzilla Report 47365

 * <apply>'s srcfile and targetfile child elements can now have
   optional prefix and suffix attributes.
   Bugzilla Report 45625

 * <jar> has a new attribute to enable indexing of META-INF
   directories which is disabled for backwards compatibility reasons.
   Bugzilla Report 47457

 * <apt>'s executable attribute can be used to specify a different
   executable.
   Bugzilla Report 46230.

 * <rmic>'s new executable attribute can be used to specify a
   different executable.
   Bugzilla Report 42132.

 * <javac>, <rmic>, <javah> and <native2ascii> now provide a nested
   element to specify a classpath that will be used when loading the
   task's (compiler) adapter class.
   Bugzilla Report 11143.

 * <javac>, <rmic>, <javah> and <native2ascii> now provide a nested
   element to specify the task's (compiler) adapter as an instance of
   a class that has been defined via typedef/componentdef.  This
   allows more control over the classpath and allows adapters to be
   defined in Antlibs easily.

 * A new subclass org.apache.tools.ant.loader.AntClassLoader5 of
   AntClassLoader has been added which overrides getResources
   which became non-final in ClassLoader with Java5+ so
   this method now behaves as expected.
   The new subclass will be used by Ant internally if it is available
   and Ant is running on Java5 or more recent.
   Bugzilla Report 46752.

 * a new attributes can chose a different request method than GET for
   the http condition.
   Bugzilla Report 30244

 * <splash> now supports a configurable display text and a regular
   expression based way to determine progress based on logged messages.
   Bugzilla Report 39957.

 * the number of retries on error in <get> is now configurable.  <get>
   can be told to not download files that already exist locally.
   Bugzilla Report 40058.

 * Ant now builds against commons-net 2.0 as well.
   Bugzilla Report 47669.

 * A new nested element connectionProperty of <sql> allows setting of
   arbitrary JDBC connection properties.
   Bugzilla Report 33452.

 * A new islastmodified condition can check the last modified date of
   resources.

 * <rmic> has a new destDir attribute that allows generated files to
   be written to a different location than the original classes.
   Bugzilla Report 20699.

 * <rmic> has a new listfiles attribute similar to the existing one of
   <javac>.
   Bugzilla Report 24359.

 * It is now possible to suppress the "FAILED" lines sent to Ant's
   logging system via <junit>'s new logFailedTests attribute.
   Bugzilla Report 35073.

 * <propertyfile> now can delete entries.

 * The <resources> resource collection can now optionally cache its
   contents.

 * A new <resourceexists> condition can check whether resources exists.

 * <sql> has two new attributes errorproperty and warningproperty that
   can be set if an error/warning occurs.
   Bugzilla Report 38807.

 * <sql> has a new attribute rowcountproperty that can be used to set
   a property to the number of rows affected by a task execution.
   Bugzilla Report 40923.

 * when Ant copies files without filtering, it will now use NIO
   channels.
   Bugzilla Report 30094.

 * <get> has a new attribute that can be used to disable caching on
   HTTP connections at the HttpUrlConnection level.
   Bugzilla Report 41891.

 * <tar> and <zip> (and tasks derived from <zip>) will now create the
   parent directory of the destination archive if it doesn't exist.
   Bugzilla Report 45377.

 * A new filterreader <sortfilter> that sorts input lines has been
   added.
   Bugzilla Report 40504.

 * A new token filter <uniqfilter> that suppresses tokens that match
   their ancestor token has been added.

 * <rootfileset>s nested into <classfileset>s can now use a dir
   attribute different from the <classfileset>.
   Bugzilla Report 37763.

 * <path> can now optionally cache its contents.

 * <property> can now specify values as nested text.
   Bugzilla Report 32917.

 * a new parentFirst attribute on <javaresource> allows resources to
   be loaded from the specified classpath rather than the system
   classloader.
   Bugzilla Report 41369.

 * <property location="from" basedir="to" relative="true"/> can now
   calculate relative paths.

 * The <name> selector supports a new handleDirSep attribute that
   makes it ignore differences between / and \ separators.
   Bugzilla Report 47858.

 * <get> now supports resource collections (as long as the resources
   contained provide URLs) and can get multiple resources in a single
   task.

 * <import> can now import non-File resources if they provide an URL
   - as the <url> and <javaresource> resources do.
   Bugzilla Report 29251

 * <import> can now import multiple resources specified as resource
   collections.
   Bugzilla Report 22269.

 * a new <resourcelist> type is similar to <filelist> but can read the
   list of resources from non-file resources and may return resources
   that are not files.

 * a new filterreader appendtolines complements prefixlines.

 * a new top level element extension-point allows build files to be
   extended with custom targets more easily.

Changes from Ant 1.7.0 TO Ant 1.7.1
=============================================

Changes that could break older environments:
-------------------------------------------

* String resources only have properties single expanded. If you relied on
  <string> resources being expanded more than once, it no longer happens.
  Bugzilla report 42277.

* A String resource's encoding attribute was only taken into account when
  set from the resource's OutputStream; the InputStream provided the String's
  binary content according to the platform's default encoding. Behavior has
  been modified to encode outgoing (InputStream) content as well as encoding
  incoming (OutputStream) content.

* <java> with fork now returns gives -1 instead of 0 as result when failonerror
  is false and some exception (including timeout) occurs. Br 42377. 

* ant-type attribute has been marked as deprecated and a warning has been
  issued if it is encountered in the build file.

Fixed bugs:
-----------

* The default logger was failing to print complete stack traces for exceptions
  other than BuildException, thus omitting often important diagnostic
  information. Bugzilla 43398.

* Error in FTP task
  Bugzilla report 41724

* Regression: Locator fails with URI encoding problem when spaces in path
  Bugzilla report 42222

* Regression in Locator: running Ant off a network share does not work:
  message "URI has authority component" appears
  Bugzilla report 42275

* Improvements in AntClassLoader Speed.
  Bugzilla report 42259

* Error in handling of some permissions, most notably the AllPermission on
  jdk 1.5
  Bugzilla report 41776

* Replace task summary output incorrect.
  Bugzilla report 41544

* Dependset crashes ant when timestamp on files change during Dependset
  execution.
  Bugzilla report 41284

* Bug in org.apache.tools.ant.types.resources.comparators.Date
  Bugzilla report 41411

* <junit> in Ant 1.7.0 could throw NPE if no <classpath> was defined.
  Bugzilla report 41422.

* In Ant 1.7.0, <fileset> in <javadoc> does not by default include only
  **/*.java as the documentation claims and earlier revisions did.
  Bugzilla report 41264.

* SPI support in jar was broken.
  Bugzilla report 41201.

* jsch-0.1.30 causes SCP task to hang
  Bugzilla report 41090.

* Target from imported file listed twice in projecthelp.
  Bugzilla report 41226.

* <sql> task double-expands properties if expandproperties is true,
  and expands properties if expandproperties is false.
  Bugzilla report 41204.

* Rolling back Bugzilla 32927 (set a default description for a javadoc tag
  if not set) as it caused a BC problem.
  Bugzilla report 41268.

* <apt> forks properly and so memory settings are picked up.
  Bug report 41280.

* Regression: NPE was thrown when using <pathconvert> against a
  (third-party instantiated) fileset with null Project reference.

* Strip out all -J arguments to non forking rmic adapters, specifically
  the Sun and Weblogic compilers.
  Bug report 41349

* Synchonization issues in PropertyHelper.  Bugzilla 41353.

* <concat binary="true" append="true"> did not append.  Bugzilla 41399.
 
* -autoproxy turns Java1.5+ automatic proxy support on. Bugzilla 41904

* Handle null result of system getProperty(). Bugzilla 42334.

* Regression: concat fixlastline="true" should not have applied to
  nested text, but did in Ant 1.7.0. Bugzilla 42369.

* Regression: ant.version was not passed down in <ant>, <subant>.
  This worked in Ant 1.6.5, but not in 1.7.0.
  ant.core.lib (added in 1.7.0) was also not being propagated.
  Bugzilla bug 42263

* Regression: bzip2 task created corrupted output files for some inputs.
  Bugzilla bug 41596.

* Regression: <available> with <filepath> did not work.
  Bugzilla 42735.

* ant script, cd may output to stdout.
  Bugzilla 42739.

* Modified selector doesn't update the cache if only one file has changed.
  Bugzilla 42802.

* Regression: Path subclasses that overrode list() stopped working in
  resourceCollection contexts in Ant 1.7.0. Bugzilla 42967.

* <property> supports loading from xml based property definition.
  Bugzilla 42946

* <junit> supports collecting and rerunning failed test cases
  (textXXX methods). Bugzilla 42984.

* War task failed with "No WEB-INF/web.xml file was added" when called
  a second time. Bugzilla 43121.

* FilterMapper could throw an NPE.
  Bugzilla 43292.

* Regession nested macrodefs with elements could cause StackOverFlow.
  Bugzilla 43324.

* Some changes to <junit> broke third party tasks that extend it (like
  Apache Cactus' Ant task).  The changes have been modified so that
  subclases should now work again - without any changes to the
  subclass.

Other changes:
--------------

* Various small optimizations speed up common tasks such as <javac> on large
  filesets, reducing both I/O and CPU usage.

* Profiling logger has been added with basic profiling capabilities.

* <script> now has basic support for JavaFX scripts

* SSH task can now take a command parameter containing the commands to execute.
  This allows you to connect to a server and execute a number of commands
  without constantly reconnecting for each command.

* Upgraded XML API to XML commons version 1.3.04.

* Upgraded to Xerces 2.9.0

* <script> can now work with bsf.jar and js.jar in its <classpath>.

* add errorProperty and updatedProperty to <javac>
  Bugzilla 35637 and 28941.

* add classpathref attribute to <whichresource>
  Bugzilla 41158.

* reduce logging noise of <apply skipemptyfilesets="true">
  Bugzilla 29154

* Show Previous Revision in the tagdiff.xsl stylesheet
  Bugzilla 29143

* Allow <mapper refid> to refer directly to a FileNameMapper instance.

* If you try and use a type in a namespace (or an antlib), and the type is not
  recognized but there are other definitions in that namespace, Ant lists what
  the known definitions are. This helps you find spelling errors.

* Add a <last> resource collection, corresponding to <first>.

* Add new <truncate> task.

* <junitreport> xsl stylesheets allow setting the title used in <title> and <h1> tags by
  using <report><param> element.  Bugzilla 41742.

* Add IgnoreDependenciesExecutor for weird cases when the user wants to run
  only the targets explicitly specified.

* Patternset allows nested inverted patternsets using <invert>.

* <manifest> checks for validity of attribute names.

* JUnitVersionHelper.getTestCaseClassName is now public. Bugzilla 42231

* <string> resource supports nested text. Bugzilla bug 42276

* <scriptdef> now sources scripts from nested resources/resource collections. This lets you
  define scripts in JARs, remote URLs, or any other supported resource. Bugzilla report 41597.

* <concat> is now usable as a single-element ResourceCollection.

* It is now possible to provide the value of a <striplinecomments> filter's
  <comment> nested element as nested text instead of using the 'value'
  attribute.

* A new logger, BigProjectLogger, lists the project name with every target

* Default text added to macrodef. Bugzilla report 42301.

* "rawblobs" attribute added to SQL task.

* Add new retry task container.

* <jar> has a new strict attribute that checks if the jar complies with
  the jar packaging version specification.

* <javac> has a new attribute - includeDestClasses.
  Bugzilla 40776.

* <fileset> has a new attribute - errorOnMissingDir.
  Bugzilla 11270.

* <javac> handles package-info.java files, there were repeatedly compiled.
  Bugzilla 43114.

* SecureInputHandler added to use Java 6 System.console().readPassword()
  when available.

Changes from Ant 1.6.5 to Ant 1.7.0
===================================

Changes that could break older environments:
-------------------------------------------

* Initial support for JDK 6 (JSR 223) scripting.
  <*script*> tasks will now use javax.scripting if BSF is
  not available, or if explicitly requested by using
  a "manager" attribute.

* Removed launcher classes from nodeps jar.

* <classconstants> filter reader uses ISO-8859-1 encoding to read
  the java class file. Bugzilla report 33604.

* Defer reference process. Bugzilla 36955, 34458, 37688.
  This may break build files in which a reference was set in a target which was
  never executed. Historically, Ant would set the reference early on, during parse
  time, so the datatype would be defined. Now it requires the reference to have
  been in a bit of the build file which was actually executed. If you get
  an error about an undefined reference, locate the reference and move it somewhere
  where it is used, or fix the depends attribute of the target in question to
  depend on the target which defines the reference/datatype.
  As a result of testing on real live build scripts, a fall-back mechanism
  was put it place to allow references that are out-of-band to be resolved. If
  this happens a big warning message is logged. This fall-back mechanism will
  be removed in Ant 1.8.0.

* <script> and <scriptdef> now set the current thread context.

* Unrestrict the dbvendor names in the websphere element of the ejbjar task.
  Bugzilla Report 40475.

* <env> nested element in <java>, <exec> and others is now case-insensitive
  for windows OS. Bugzilla Report 28874.

* Removed support for xalan1 completely. Users of Xalan1 for Ant builds will
  have to stay at ant 1.6.5 or upgrade to xalan2.

* Use org.apache.log4j.Logger instead of org.apache.log4j.Category.
  Category has been deprecated for ~2 years and has been removed from
  the log4j code.  Logger was introduced in log4j 1.2 so users of
  log4j 1.1 and log4j 1.0 need to upgrade to a newer version of log4j.
  Bugzilla Report 31951.

* build.sysclasspath now also affects the bootclasspath handling of
  spawned Java VMs.  If you set build.sysclasspath to anything other
  than "ignore" (or leave it unset, since "ignore" is the default when
  it comes to bootclasspath handling), then the bootclasspath of the
  VM running Ant will be added to the bootclasspath you've specified.

* The <java fork="false"> now as per default installs a security manager
  using the default permissions. This is now independent of the
  failonerror attribute.  Bugzilla report 33361.

* <signjar> now notices when the jar and signedjar are equal, and switches
  to the same dependency logic as when signedjar is omitted. This may break
  something that depended upon signing in this situation. However, since
  invoking the JDK jarsigner program with -signedjar set to the source jar
  actually crashes the JVM on our (Java1.5) systems, we don't think any
  build files which actually worked will be affected by the change.

* <signjar> used to ignore a nested fileset when a jar was also provided as an
  attribute, printing a warning message; now it signs files in the fileset.

* An improved method of handling timestamp granularity differences between
  client and server was added to the <ftp> task.  FTP servers typically
  have HH:mm timestamps whereas local filesystems have HH:mm:ss timestamps.
  Previously, this required tweaking with the timediffmillis attribute
  which also was used to handle timezone differences.  Now, there is a new
  timestampgranularity attribute.  The default value for get operations is 0
  since the user has the more powerful preservelastmodified attribute to work
  with.  Since this is not available on put operations the default value
  adds a minute to the server timestamp in order to account for this,
  Scripts which previously used timediffmillis to do this compensation may
  need to be rewritten.  timediffmillis has now been deprecated.

* Support for the XSL:P XML parser has been removed.
  Bugzilla Report 23455.

* Visual Age for Java optional tasks removed as the required library is no
  longer available.

* Testlet (test) optional task removed as the required library is no
  longer available.

* IContract optional task removed as the required library is no
  longer available.

* Metamata (maudit, mmetrics, and mparse tasks) removed as the required 
  library is no longer available.

* Sitraka (jpcoverage, jpcovmerge, jpcovreport) tasks suppressed as the 
  required library is no longer available.

* <fixcrlf> used \r (Mac) line endings on OS X, whose proper line separator
  is \n (Unix).  Bugzilla report 39585.

* <scp> now optionally supports the sftp protocol, you may need a
  newer jsch.jar.  Bugzilla Report 39373.

* Ant launcher program prints errors to stderr, and exits with a 2 exit code
  value if, for any reason, it cannot actually start Ant proper. This will only
  affect programs/scripts that called the launcher and which did not want to
  receive an error if Ant itself would not start

* All .NET tasks are now deprecated in favor of the new .NET Antlib:
  http://ant.apache.org/antlibs/dotnet/index.html

Fixed bugs:
-----------
* Directory deletion did not work properly.
  Bugzilla 40972.

* docletpath attribute of javadoc was ignored.
  Bugzilla 40900.

* Fixed incorrect recursion in DOMUtil.listChildNodes().
  Bugzilla 40918.

* CompressedResource.compareTo() did not
  take comparison with another CompressedResource into account.
  Bugzilla 40949.

* Avoid possible NPE in Jar.java.
  Bugzilla 40847.

* regression in attribute prefix (+ others) for refid in zipfileset and tarfileset.
  Bugzilla 41004, 30498.

* dependset failed if the basedir of a target fileset did not exist.
  Bugzilla 40916.

* Recursive filtering encountered NullPointerExceptions under certain
  circumstances.  Bugzilla 41086.

* XmlProperty overrides previously set property value when handling duplicate
  elements. Bugzilla 41080.

* Having many tasks causes OOM.  Bugzilla 41049.

* Regression: <path> was evaluating nested content only once, so that it could
  not e.g. pick up files that didn't exist the first time through.
  Bugzilla 41151.

* OOM caused by IH holding on to classes and thus their classloaders.
  Bugzilla 28283 and 33061.

* <delete> doesnt delete when defaultexcludes="false" and no includes is set
  fixed. Bugzilla 40313.

* Behavior change of DirectoryScanner/AbstractFileset when conditional include
  patterns are used. Bugzilla 40722.

* <javac> fails with NPE when compiling with eclipse ecj 3.1.x.
  Bugzilla 40839.

* JUnitTestRunner had a NPE when unable to create parser, the exception
  containing the error did not get reported. Bugzilla 36733.

* <checksum> with file and todir option failed. Bugzilla report 37386.

* <path location="loc"> was broken (Regression from beta1).
  Bugzilla report 40547.

* Nested fileset in <cab> did not work. Bugzilla report 39439.

* The ant wrapper script should now correctly locate the java
  executable in more recent IBM JDKs for AIX as well.

* URLResource did not close jar files, and also did not disconnect HTTPConnection (s).

* Error calling junitreport. Bugzilla 40595.

* <junittask/> created junitvmwatcher*.properties files but did not close and delete them.

* <xmlproperty> did not create properties for empty leaf elements.
  Bugzilla report 26286.

* UnknownElement.maybeConfigure always configured.
  Bugzilla report 40641.

* No check for refid when prefix attribute is set in zipfileset.
  Bugzilla report 30498.

* Fix for junit4 issue introduced since beta2.
  Bugzilla report 40682.

* Error in duplicate project name with <import> and <antcall>.
  Bugzilla report 39920.

* junit4 did not work with fork=no and junit4 in $ANT_HOME/lib.
  Bugzilla report 40697.

* PathConvert on Windows should process forward and back slashes equivalently.
  Bugzilla report 32884.

* ant.bat now looks in %USERPROFILE% and %HOMEDRIVE%%HOMEPATH% in addition to
  %HOME% for pre/post batch files. Bugzilla report 39298.

* The inheritance hierarchy of the legacy <path> type was changed; code built
  against Ant 1.7 would therefore no longer execute on older versions of Ant.
  Since <path> is historically heavily used this was undesirable, and since it
  is also avoidable, the change to <path>'s taxonomy was reverted.

* <zip filesonly="true"> included empty directories.  Bugzilla report 40258.

* Invalid hash code of Target causes XmlLogger to fail.
  Bugzilla report 40207.

* Macro element did not include top level Text. Bugzilla report 36803.

* AntClassLoader did not isolate resources when isolate was set. Bugzilla report 38747.

* Diagnostics broken when using java 1.4. Bugzilla report 40395.

* Exception reporting in <copy> was broken. Bugzilla report 40300.

* Handling of corrupt tar files, TarInputStream.read() never returns EOF.
  Bugzilla report 39924.

* Some bugs in ReaderInputStream. Bugzilla report 39635.

* <antlr> did not recognise whether the target is up-to-date for html option.
  Bugzilla report 38451.

* Documented minimal version of jsch now 0.1.29.
  Bugzilla report 40333.

* <available> searched parent directories for files.
  Bugzilla report 37148.

* The build could be halted if a file path contained more ".." components than
  the actual depth of the preceding path. Now such paths are left
  alone (meaning they will likely be treated as nonexistent
  files). Bugzilla Report 40281.

* Converting a <dirset> to a string was broken. Bugzilla Report 39683.

* Manifests have improved line length handling, taking care of encoding.
  Bug reports 37548 / 34425.

* <manifest> now closes the inputstream explicitly. Bug report 39628.

* <rpm> now also correctly searches the first element of the path.
  Bug report 39345.

* ant.bat now handles classpath set to "". Bug report 38914.

* <junit> now supports JUnit 4. Bugzilla Report 38811.

* <junit> can now work with junit.jar in its <classpath>. Bugzilla
  Report 38799.

* Some potential NullPointerExceptions, Bugzilla Reports 37765 and 38056.

* Problem when adding multiple filter files, Bugzilla Report 37341.

* Problem referencing jars specified by Class-Path attribute in manifest
  of a ant task jar file, when this ant task jar file is located in
  a directory with space, Bugzilla Report 37085.

* Backward incompatible change in ZipFileSet, Bugzilla Report 35824.

* Wrong replacement of file separator chars prevens junitbatchtest
  from running correctly on files from a zipfileset. Bugzilla Report 35499.

* Calling close twice on ReaderInputStream gave a nullpointer exception.
  Bugzilla Report 35544.

* Memory leak from IntrospectionHelper.getHelper(Class) in embedded
  environments. Bugzilla Report 30162.

* Translate task does not remove tokens when a key is not found.
  It logs a verbose message.  Bugzilla Report 13936.

* Incorrect task name with invalid "javac" task after a "presetdef".
  Bugzilla reports 31389 and 29499.

* <manifest> was not printing warnings about invalid manifest elements.
  Bugzilla report 32190.

* <replace> got out of memory on large files (part of report 32566).
  <replace> can now handle files as long as there is enough disk space
  available.

* Commandline.describeCommand() methods would attempt to describe
  arguments even when none, other than the executable name, were present.

* Create signjar's helper ExecTask instance directly rather than by
  typedef discovery mechanisms. Bugzilla report 33433.

* FileUtils.resolveFile() promised to return absolute files but
  did not always do so.

* <ftp> failed to retrieve a file when the path towards the file contained
  an element starting with . Bugzilla report 33770.

* "<rmic> always compiles on Java1.5" bugzilla report=33862. Fixed default
  stub version to always be "compat", even on Java1.5+.

* The .NET compilation tasks failed if filenames given as references
  contained spaces.  Bugzilla Report 27170.

* SQL task would try access result sets of statements that didn't
  return any, causing problems with Informix IDS 9.2 and IBM DB2 8.1
  FixPak 6 (or later). Bugzilla Reports 27162 and 29954.

* Task.init() was called twice for most tasks.  Bugzilla Report 34411.

* JavaTest testcases sometimes fail on windows. Bugzilla Report 34502.

* Targets with identical name work in imported project. Bugzilla Report 34566.

* DemuxOutputStream now uses a WeakHashMap to store the thread-stream mapping,
  to avoid holding on to thread references after they terminate.

* <xmlvalidate> and <schemavalidate> create a new parser for every file in a
  fileset, and so validate multiple files properly. Bugzilla Report 32791.

* <tar> / <untar> now accepts files upto 8GB, <tar> gives an error if larger
  files are to be included. This is the POSIX size limit.

* <junitreport> removed line-breaks from stack-traces.  Bugzilla
  Report 34963.

* Off-by-one error in environment setup for execution under OpenVMS fixed.

* Bugzilla report 36171: -noclasspath crashes ant if no system
  classpath is set.

* <pvcs> used wrong switch for retrieving revisions by label.
  Bugzilla Report 36359.

* <sshexec> closed System.out, disabling output on second and subsequent
  invocations.  Bugzilla report 36302.

* <cvschangelog> was crashing with CVS versions >= 1.12.x due to change in
  the date format. Bugzilla report 30962.

* The same IntrospectionHelper instance was continuously added as a listener
  to project. Bugzilla report 37184.

* FileUtils.toURI() was not encoding non-ASCII characters to ASCII,
  causing impossibility to process XML entities referenced by XML
  documents in non ASCII paths. Bugzilla report 37348.

* > 1 ssh invocations to a given host would fail. Bugzilla report 36207.

* EmailTask was eating SMTP error messages. Bugzilla report 37547.

* PropertySet API setMapper(...) didn't properly set up the Mapper.
  Bugzilla report 37760.

* Proper return code for ant.bat. Bugzilla report 13655.

* Project not set on ChainReaderHelpers used by the Redirector.
  Bugzilla report 37958.

* Copy task would fail on locked (or otherwise uncopyable) files even if
  failonerror set to false. Bugzilla report 38175.

* <junit> task did not print all the Test names when using forkmode='once'.
  Bugzilla report 37426.

* <available> could leak resources, Bugzilla Report 38260.

* Redirector called Thread.sleep in a synchronized block. Bugzilla
  report 37767.

* CCUnlock's objselect attribute could exhibit unpredictable behavior;
  standardized improperly included objselect and objsel property accessors to
  delegate to the inherited objSelect property accessor. Bugzilla report 37766.

* <unzip> and <untar> now correctly merge multiple nested patternsets.
  Bugzilla Report 38973.

* On case-insensitive filesystems, a <move> to change filename case
  erroneously deleted the "destination" file before attempting to rename
  the source file.  Bugzilla 37701.

* <scp> can now handle uris with @s other than the final one denoting the
  domain.  Bugzilla 38082.

* If the class invoked by the <java> task threw a ClassNotFoundException,
  this was misinterpreted as the specified class itself not being found.

* <echoproperties> setPrefix javadoc claimed null or empty prefix would be
  ignored; instead an error was thrown.  Bugzilla report 39954.

* <get> would fetch files that were up to date, because it used > in a
  remote/local timestamp comparison, not >=. Bugzilla 35607.

* <xslt> passes the current file (name + directory) to the
  stylesheet/transformation.  xsl-parameter name is configurable.
  Bugzilla report 21042.

* The <zip> API allowed creation of directories in file-only archives; a
  habitual offender was the subclassed <jar>, which included META-INF/ in
  the destination file regardless of whether filesonly was set to true.

* <rmic> has a new adapter, xnew, to use the -XNew back end on java1.5+.
  By forking rmic, this works on java1.6+. Bugzilla report 38732.

* Copy of UnknownElement in macroinstance was not recursive.
  Bugzilla report 40238.

* Mixing of add and addConfigured methods in Mapper/ChainedMapper
  causes incorrect chaining. Bugzilla report 40228.

Other changes:
--------------

* Warn user when a reference in the form "${refid}" cannot be resolved as this
  is a sign they probably meant "refid" (misuse of property expansion syntax).

* Add dtd to javadoc for junit.
  Bugzilla 40754.

* Add quiet attribute to loadfile/resource.
  Bugzilla 38249.

* Make Locator#fromURI also append the drive letter when running under Windows
  with JDK 1.3 or 1.2.

* Do not uppercase the drive letters systematically in FileUtils#normalize.

* Java 5 enumerations may now be used as values in XML attributes in place of
  EnumeratedAttribute. Bugzilla 41058.

* Create a pom file for ant-testutil and add ant-testutil.jar to the ant
  distribution. Bugzilla 40980.

* Roll back automatic proxy enabling on Java 1.5. It broke things like
  Oracle JDBC drivers, and Ant itself on IBM's JVM on AIX, and didnt
  seem to work to well the rest of the time.
  To enable the feature, use the -autoproxy command line option.

* Upgraded XML API and parser to Xerces 2.8.1

* A code review of some threaded logic has tightened up the synchronization
  of Watchdog, ExecuteWatchdog and ExecuteJava, which could reduce the occurence
  of race conditions here, especially on Java1.5+.

* Allow broken reference build files. The defer reference processing would
  break too many files - so allow them with a warning.

* Removed dependency on sun.misc.UUEncoder for UUMailer.

* Added regex attribute to the echoproperties task.
  Bugzilla 40019.

* <war> task now allows you to omit the web.xml file. as this is optional
  in the servlet 2.5 and Java EE 5 APIs. set needxmlfile="false" to
  avoid a missing web.xml file from halting the build.

* Diagnostics catches and logs security exceptions when accessing system properties.

* <javadoc> useexternalfile now applies to all command line arguments
  of javadoc. Bugzilla report 40852.

* javadoc/tag@description is now set to the name if description is
  not specified. Bugzill report 32927.

* Some performance improvements, including Bugzilla report 25778.

* Add <matches> condition. Bugzilla report 28883.

* Extending JAR-Task for SPI. Bugzilla report 31520.

* Added <tokens> resource collection for convenient creation of string
  resources from other resources' content. Inspired by Bugzilla 40504.

* Added <compare> resource selector to select resources based on the
  results of their comparison to other resources.

* Added outputtoformatters attribute to <junit> to allow suppression
  of noisey tests. Bugzilla report 12817.

* Log level of message 'Overriding previous definition of reference to'
  set to Verbose. Bugzilla report 17240.

* Added setbeans attribute to <script> to allow <script>'s to be
  run without referencing all references.
  Bugzilla report 37688.

* Added classpath attribute and nested element to <script> to allow
  the language jars to be specified in the build script.
  Bugzilla report 29676.

* Trim the driver attribute on the <sql> task. Bugzilla report 21228.

* Allow (jar) files as well as directories to be given to jdepend.
  Bugzilla report 28865.

* Convert SplashTask to use NOT sun internal classes.
  Bugzilla report 35619.

* Made PatternSet#hasPatterns public to allow custom filesets access.
  Bugzilla report 36772.

* Added searchparents attribute to <available>. Bugzilla report 39549.

* Tasks that don't extend Ant's Task class will now get the build file
  location reflected into a method of the signature void setLocation(Location)
  - if such a method exists.

* Remove needless synchronization in DirectoryScanner.
  Bugzilla report 40237.

* Improved recursion detection for lines with multiple matches of same token
  on a single line.  Bugzilla report 38456.

* Task will now log correctly even if no project is set.
  Bugzilla report 38458.

* Use alternative names for the command line arguments in javac. Bugzilla
  Report 37546.

* The Reference class now has a project field that will get
  used (if set) in preference to the passed in project, when
  dereferencing the reference. Bugzilla Report 25777.

* On DOS and Netware, filenames beginning with a drive letter
  and followed by a colon but with no directory separator following
  the colon are no longer (incorrectly) accepted as absolute pathnames
  by FileUtils.normalize() and FileUtils.isAbsolutePath().  Netware
  volumes can still be specified without an intervening separator.
  UNC pathnames on Windows must include a server and share name, i.e.
  "\\a\b" to be considered valid absolute paths.

* A bug in SQLExec would prevent the execution of trailing,
  non-semicolon-delimited statements.  Bugzilla Report 37764.

* InputHandler implementations may now call InputRequest.getDefaultValue()
  if they wish. The default handler uses this also. Bugzilla report 28621.

* Took in bugzilla report 39320, "Simple code cleanups"

* Improve compatibility with GNU Classpath and java versions prior to
  1.5. Bugzilla 39027.

* ${ant.core.lib} may now be used to refer to the library containing the
  Ant classes, for instance useful when compiling tasks.

* Minor performance improvements Bugzilla report 37777

* New task <manifestclasspath> converts a path into a property
  suitable as the value for a manifest's Class-Path attribute.

* Fixed references to obsoleted CVS web site. Bugzilla Report 36854.

* Log fine-grained events at verbose level from JUnit. Bugzilla report 31885.

* <WsdlToDotnet> and <style> are now deprecated in favor of <wsdltodotnet> and
  <xslt>, respectively. Bugzilla report 25832.

* <echoproperties> now (alphanumerically) sorts the property list
  before echoing. Bugzilla report 18976.

* A new base class DispatchTask has been added to facilitate elegant
  creation of tasks with multiple actions.

* Major revision of <wsdltodotnet>. Supports mono wsdl and the microsoft
  wsdl run on mono, as well as most of the .NET WSE2.0 options. Extra
  schemas (files or urls) can be named in the <schema> element.
  Compilers can be selected using the compiler attribute, which defaults
  to "microsoft" on windows, and "mono" on everything else.

* It is now possible to specify the pattern created/parsed by <checksum>.
  Bugzilla Report 16539.

* Added a new "failall" value for the onerror attribute of <typedef>.
  Bugzilla report 31685.

* unzip/unwar/unjar/untar now supports a nested mapper, which lets you unzip
  in useful ways.

* Junit task -- display suite first.
  Bugzilla report 31962.

* Added isSigned condition and signedselector selector
  Bugzilla report 32126.

* Added preserveLastModified attribute to signjar task.
  Bugzilla report 30987.

* Added <scriptcondition> condition, for inline scripted conditions

* Added <xor> condition for exclusive-or combining of nested conditions.

* Added <scriptselector> selector for scripted file selection

* ant -diagnostics lists contents of ${user.home}/.ant/lib , and
  checks that the java.io.tmpdir directory exists and is writeable.

* mail task accepts nested header element.  Bugzilla report 24713.

* zip/jar/war/ear supports level attribute for deflate compression level.
  Bugzilla report 25513.

* Added loginputstring attribute to the redirector type.

* Tighten security by sending storepass and keypass to signjar
  via the input stream of the forked process.

* New task <schemavalidate> extends <xmlvalidate> with extra support
  for XML Schema (XSD) files.

* <fixcrlf> supports a file attribute for easy fixup of a single file.

* New condition <parsersupports> which can look for XML parser feature or
  property support in the parser Ant is using.

* fixcrlf can be used in a filterchain.

* <sync> has a new nested element <preserveInTarget> that can be used
  to protect extra-content in the target directory.  Bugzilla Report
  21832.

* <signjar> now supports:
  -nested filesets at the same time as the jar attribute
  -a destDir attribute with the appropriate dependency logic, which
   can be used with the jar attribute or nested filesets
  -a mapper to permit filename remapping on signing
  -tsaurl and tsacert attributes for timestamped JAR signing
  -nested <sysproperty> elements, which can be used for proxy setup
  and the like

* The linecontains and linecontainsregexp filterreaders now support a
  negate attribute to select lines -not- containing specified text.
  Bugzilla Report 34374.

* <os> condition adds "winnt" as a family which can be tested. This is
  all windows platforms other than the Win9x line or Windows CE.

* <exec> (and hence, <apply> and any other derived classes) have an OsFamily
  attribute, which can restrict execution to a single OS family.

* Added "backtrace" attribute to macrodef. Bugzilla report 27219.

* Ant main provides some diagnostics if it ever sees a -cp or -lib option,
  as this is indicative of a script mismatch. Bugzilla report 34860

* <junitreport> prints a special message if supplied an empty XML File. This
  can be caused by the test JVM exiting during a test, either via a
  System.exit() call or a JVM crash.

* Project name is now used for *all* targets so one can write consistent import
  build files. Bugzilla report 28444.

* New condition <typefound> that can be used to probe for the declaration
  and implementation of a task, type, preset, macro, scriptdef, whatever.
  As it tests for the implementation, it can be used to check for optional
  tasks being available.

* Check for 1.5.* Ant main class. (weblogic.jar in classpath reports)

* New condition <isfailure> that tests the return-code of an executable. This
  contains platform-specific logic and is better than comparing the result with
  "0".

* Added initial support for Resource Collections, including the
  resourcecount task.

* property attribute of pathconvert is now optional. If omitted the
  result will be written to the log.

* New mapper, <scriptmapper>, supports scripted mapping of source files/strings
  to destination strings.

* Add the echoxml task. This will echo nested XML to a file, with
  the normal <?xml ?> processor instruction. UTF-8 encoding only; no-namespace
  support.

* Try to make subprojects of custom Project subclasses instances of the
  same type. Bugzilla report 17901.

* <ssh> and <scp> support keyboard-interactive authentication now.

* <javadoc> now supports -breakiterator for custom doclets if Ant is
  running on JSE 5.0 or higher.  Bugzilla Report: 34580.

* New logger, TimestampedLogger, that prints the wall time that a build
  finished/failed. Use with
  -logger org.apache.tools.ant.listener.TimestampedLogger

* <junitreport> now generates pages alltests-errors.html and
  alltests-fails.html, that list only the errors and failures, respectively.
  Bugzilla Report: 36226

* New task <makeurl> that can turn a file reference into an absolute file://
  url; and nested filesets/paths into a (space, comma, whatever) separated
  list of URLs. Useful for RMI classpath setup, amongst other things.

* <xslt> now accepts nested FileNameMappers e.g. <globmapper>.
  Bugzilla report 37604.

* New task <loadresource> that accompanies <loadfile> for non file resources.

* <echo> now supports an encoding when saving to a file.

* New GreedyInputHandler added.

* Add textfile attribute to the <filesmatch> condition. When true, the text
  contents of the two files are compared, ignoring line ending differences.

* New <resourcesmatch> condition.

* Added the onmissingfiltersfile attribute to filterset. Bugzilla report 19845.

* Added the inline handler element to the input task.

* <sql> supports property expansion if you set the expandProperties
  attribute. By default it does not expand properties, something we
  dare not change for fear of breaking complex SQL operations in
  existing files.

* <javadoc>'s packagenames attribute is now optional and defaults to "*".

* <javac>'s source and target attributes as well as <javadoc>'s source
  attribute will read default values from the properties
  ant.build.javac.source and ant.build.javac.target.

* Handling of ' ', '#' in CLASSPATH and '#' in -lib (cannot use ' '
  in -lib on UNIX at the moment). Bugzilla Report 39295.

* <scp> now optionally supports the sftp protocol.  Bugzilla Report 39373.

* Resources can now be used to indicate the location of the stylesheet to use
  in <xslt>. Bugzilla Report 39407.

* New <antversion> condition. Bugzilla report 32804.

* ReplaceTokens should allow properties files. Bugzilla report 39688.

* FTP Account could not be specified in ant FTP task. Bugzilla report 39720.

* Minor performance updates. Bugzilla report 39565.

* New deleteonexit attribute for the <tempfile> task. Bugzilla report 39842.
  Remember that the exit of the JVM can be a long time coming,
  especially under an IDE. Don't rely on this being called.

* <scriptdef>-created scripts have support for nested text. All text
  passed to a scripted task can be accessed via self.text.

* <fixcrlf> now supports an outputencoding attribute.  Bugzilla report 39697.

* <junitreport> now supports nested XSL parameters. Bugzilla report 39708.

* <javacc> has a jdkversion attribute to pass the desired JDK version
  down to javacc.  Bugzilla report 38715.

* <cvs> prints passfile info at -verbose level instead of -info. Bugzilla
  report 35268

* When <javac> can't find the compiler class, it prints out java.home for
  immediate diagnostics

* Ant launcher now supports a -main attribute so that you can specify
  an extension class to the built in org.apache.tools.ant.Main
  class. This class must implement the interface AntMain

Changes from Ant 1.6.4 to Ant 1.6.5
===================================

Changes that could break older environments:
--------------------------------------------

Fixed bugs:
-----------

* <move> was unable to replace existing files or write into
  existing directories.  Bugzilla report 34962.

* <macrodef> with redefined default values was incorrect. (Fix for
   31215 had a bug). Bugzilla report 35109.

* <javadoc> will convert backslashes to forwardslashes when generating file
  list by useexternalfile. Bugzilla report 27814.

Changes from Ant 1.6.3 to Ant 1.6.4
===================================

Changes that could break older environments:
--------------------------------------------
* <ftp> task has had a number of changes.  Uptodate calculation previously
  did not call a file uptodate if the source timestamp and the destination
  timestamp were equal. Bugzilla report 34941.  Any script that attempted
  to compensate for this by using the timediffmillis attribute might need
  to be tweaked.


Fixed bugs:
-----------

* Sun javah failed with java.lang.NoClassDefFoundError.
  Bugzilla report 34681.

* DirectoryScanner.slowScan() was broken. Bugzilla report 34722.

* DirectoryScanner.scan() could throw a NullPointerException on
  case-insensitive filesystems (read Windows or MacOS X).

* Get w/authentication failed with ArrayOutOfBoundsExceptions.
  Bugzilla report 34734.

* Granularity attribute for <sync> task was undocumented.
  Bugzilla report 34871.

* <unzip> and <untar> could leave file handles open on invalid
  archives.  Bugzilla report 34893.

* propertyset threw NPE with nested, mapped propertysets.

Other changes:
--------------

* AntXMLContext.setCurrentTargets() is now public. Bugzilla report 34680.

Changes from Ant 1.6.2 to Ant 1.6.3
===================================

Changes that could break older environments:
--------------------------------------------

* The subant task used the canonical version of a file path. This
  has been changed to use the absolute path. Bugzilla 30438.

* Tar now writes two EOF blocks rather than one.
  Bugzilla report 28776

* The Reference object now has a project field which it uses in preference
  to the project passed in. This allows composite references to be
  handled to nested projects.
  Bugzilla report 25777

* <junit> with filtertrace="true" will now also swallow lines for the
  sun.reflect package.  If you need to see them in your stack trace,
  you must set filtertrace to false.
  Bugzilla Report 22758

* The jikes compiler adapter now supports -bootclasspath, -extdirs and
  -sourcepath and also uses the same logic for debug flags as javac.
  This means, the jikes compiler adapter now requires Jikes 1.15 or later.
  Bugzilla Reports 25868, 26404 and 32609.

* The gcj compiler adapter used to include the Java runtime classes
  even if includeJavaRuntime was set to false, unless the
  bootclasspath has been specified as well.  It will now always adhere
  to includeJavaRuntime, you may need to set it to true explicitly now
  if you relied on the old behavior.

Other changes:
--------------

* <javadoc> can now take an attribute 'executable'. Bugzilla report 30606.

* New attribute ignorecontents for <different> selector

* Javadoc fixes for Location, Project, and RuntimeConfigurable
  Bugzilla 30160.

* Enable to choose the regexp implementation without system property.
  Bugzilla Report 15390.

* Expose objects and methods in IntrospectionHelper. Bugzilla Report 30794.

* Allow file attribute of <move> to rename a directory.
  Bugzilla Report 22863.

* Add xmlcatalog nested element to XmlProperty. Bugzilla report 27053.

* New attribute alwayslog for <redirector> type.

* Added <target> nested elements to <ant> and <antcall> to allow
  specification of multiple sub-build targets, which are executed
  with a single dependency analysis.

* Refactored Target invocation into org.apache.tools.ant.Executor
  implementations.  Bugzilla Reports 21421, 29248.

* <rmic> now also supports Kaffe's rmic version shipping with Kaffe
  1.1.2 and above.

* added casesensitive attribute to <globmapper> and <regexpmapper>
  Bugzilla report 16686

* added handledirsep attribute to <globmapper> and <regexpmapper>
  Bugzilla report 32487

* added a new mapper <filtermapper>

* When a BuildListener tried to access System.err or System.out, Ant
  would have thrown an exception - this has been changed.  Ant now
  silently ignores the message.  BuildListeners still should avoid
  accessing either stream.

* Added a comment attribute to the zip task.
  Bugzilla report 22793.

* Overloaded FileUtils.createNewFile with a boolean mkdirs attribute
  to create nonexistent parent directories.

* <apply> has a new "force" attribute that, when true, disables
  checking of target files.

* Made the dest attribute of the apply task optional; mapped target
  filenames will be interpreted as absolute pathnames when dest is omitted.

* Changed default tempdir for <javac> from user.dir to java.io.tmpdir.

* Added searchpath attribute to <exec> for searching path variable(s)
  when resolveexecutable = true.

* Added revision and userid attributes to <pvcs> documentation.

* Added support to the touch task for a mkdirs attribute to create
  nonexistent parent directories before touching new files.

* Added support to the touch task for a pattern attribute to allow
  alternate datetime formats.

* Added support to the touch task to map touched files using a nested
  mapper element.

* Added support to the touch task for a verbose attribute to suppress
  logging of new file creation.

* bad link in docs to the enhancement page in bugzilla.
  Bugzilla report 33252.

* Added length task to get strings' and files' lengths.

* <native2ascii> and <javah> now also support Kaffe's versions.

* Recursive token expansion in a filterset can now be disabled by
  setting its recurse attribute to false.

* Pathconvert no longer requires that one of (targetos|pathsep|dirsep)
  be set; platform defaults are used when this is the case.

* Added preservelastmodified attribute to fixcrlf task. Bugzilla 25770.

* Added isfileselected condition.

* Added verbose="true|false" attribute to <subant>. When verbose is enabled,
  the directory name is logged on entry and exit of the sub-build.
  Bugzilla 33787.

* Added -nouserlib option to allow running ant without automatically loading
  up ${user.home}/.lib/ant. This is useful when compiling ant, and antlibs.
  Modified the build.sh and build.bat to use the option.

* Added -noclasspath option to allow running ant WITHOUT using CLASSPATH env
  variable. Modified ant.bat to do this so that %CLASSPATH% is not looked at.

* Add else attribute to the condition task, which specifies an
  optional alternate value to set the property to if the nested
  condition evaluates to false. Bugzilla report 33074.

* Ant generated jar files should now be detected as jar files by
  Solaris.  Bugzilla Report 32649.

* <rexec> with a single command should now work with unusal login
  dialogs without special read/write pairs.  Bugzilla Report 26632.

* <csc>'s extraoptions can now contain multiple arguments.
  Bugzilla Report 23599.

* <macrodef> with default values set by properties would be
  seen as new definitions when called twice with different properties.
  This was confusing so the definitions are now treated as similar.
  Bugzilla Report 31215.

* <javadoc> has a new attribute "includenosourcepackages" that can be
  used to document packages that don't hold source files but a
  package.html file.  Bugzilla Report 25339.

* <rpm> has new attributes failonerror and quiet.

* Added two tutorials
  - beginner: introduction into Ant
  - task developers: using path, fileset etc

* a number of new attributes that allow the user to handle non-standard
  server listing formats and time zone differences have been added in
  the <ftp> task.


Fixed bugs:
-----------

* Do not pass on ThreadDeath when halting <java fork="false">. Bugzilla
  32941.

* Killing a thread running <java fork="true"> (e.g. from an IDE) would
  not stop the forked process. Bugzilla 31928.

* Programs run with <java fork="true"> can now accept standard input
  from the Ant console.  (Programs run with <java fork="false"> could
  already do so.)  Bugzilla 24918.

* AbstractCvsTask prematurely closed its outputStream and errorStream.
  Bugzilla 30097.

* Impossible to use implicit classpath for <taskdef>
  when Ant core loader != Java application loader and
  Path.systemClassPath taken from ${java.class.path} Bugzilla 30161.

* MacroInstance did not clean up nested elements correctly in the execute
  method, causing multiple use of the same macro instance with nested
  elements to fail.

* checksum fileext property doc wrong. Bugzilla 30787.

* FTP task, getTimeDiff method was returning wrong value. Bugzilla 30595.

* make sure that Zip and its derivates call the createEmptyZip method when
 there are no resources to zip/jar/...

* Zip task was not zipping when only empty directories were found.
  Bugzilla 30365.

* Jar task was not including manifest files when duplicate="preserve" was
  chosen. Bugzilla 32802.

* ant.bat was missing runAntNoClasspath label for goto.
  Bugzilla 34510.

* Classpath was treated in the same way as -lib options. Bugzilla 28046.

* Manual page for cvsversion contained incorrect attributes and did not
  say since 1.6.1. Bugzilla 31408.

* Typo in definition of <cvsversion> task causing it not to be defined.
  Bugzilla 31403.

* Execution of top level tasks in imported files get delayed by targets.
  Bugzilla report 31487.

* ExecTask executes checkConfiguration() even though os does not match.
  Bugzilla report 31805.

* Concat task instance could not be run twice.
  Bugzilla report 31814.

* NPE using XmlLogger and antlib.
  Bugzilla report 31840.

* Properties.propertyNames() should be used instead of .keys().
  Bugzilla report 27261.

* Target location is not set for default target.
  Bugzilla report 32267.

* Incorrect classloader parent in junittask when using with
  ant-junit.jar and junit.jar not in the project classloader. Bugzilla
  report 28474.

* getResources() on the classloader returned by ClasspathUtils would
  see each resource twice - if the resource is in the project
  classpath and if the classloader is requested with a null path.

* XMLValidate used URL#getFile rather than the ant method FileUtils#fromURI
  Bugzilla report 32508

* fixed Regexp-Mapper docs which gave outdated instructions (optional.jar)
  Bugzilla report 28584

* <scp> using <fileset> didn't work with OpenSSH 3.9 and later.
  Bugzilla report 31939

* <setproxy> failed to set user/password on some JDKs.
  Bugzilla report 32667

* untar would go into infinite loop for some invalid tar files.
  Bugzilla report 29877

* forked <javac> won't pass -source to a JDK 1.1 or 1.2 javac anymore.
  Bugzilla report 32948

* propertyset references did not handle nested propertyset references.

* oata.types.Description.getDescription(Project) would throw a
  NullPointerException when the "ant.targets" reference was unset.

* Wrapper scripts did not detect WINNT value of dynamic OS environment
  variable when logged into workstations using Novell authentication.
  Bugzilla Report 30366.

* DependScanner.getResource() always returned nonexistent resources,
  even when the resource actually existed.  Bugzilla Report 30558.

* <apply> was broken with classfilesets.  Bugzilla Report 30567.

* <available> returned false positives when checking a file
  passed in with the current basedir leading twice:
  e.g. ${basedir}${file.separator}${basedir}${file.separator}foo .

* The first file open that took place when using input files with the
  <exec>, <apply>, or <java> tasks was always logged to System.out
  instead of to the managing Task.

* <telnet> and <rexec> would try to disconnect from servers they never
  connetced to, potentially leading to exceptions in commons-net.
  Bugzilla Report 33618.

* <zip> would drop files matched by defaultexcludes during updates.
  Bugzilla Report 33412.

* <zip> couldn't store files with size between 2GB and 4GB (the
  upper limit set by the ZIP format itself).  Bugzilla Report 33310.

* NPE when when <presetdef> tries to configure a task that
  cannot be instantiated. Bugzilla Report 33689.

* <javac debug="false"> created an invalid command line when running
  the Symantec Java compiler.

* Get with usetimestamp did not work on Java 1.2.

* Get with usetimestamp did not work when local timestamp roughly >= now.

* The framed JUnit report now handles multiple reports for the same
  testcase properly.  Bugzilla Report 32745.

* <cab> didn't work for files with spaces in their names on Windows.
  Bugzilla Report 17182.

* The VAJ tasks could fail if the project name contained characters
  that need to get URL encoded.  Bugzilla Report 23322.

* TarInputStream#read() wasn't implemented correctly.  Bugzilla Report
  34097.

* <xslt> failed to process file-hierarchies of more than one level if
  scanincludeddirectories was true.  Bugzilla Report 24866.

* forkmode="perBatch" or "once" would ignore extension attributes that
  had been specified for <formatter>s.  Bugzilla Report 32973.

* The refid attribute of the I/O redirector was not functional.

Changes from Ant 1.6.1 to Ant 1.6.2
===================================

Changes that could break older environments:
--------------------------------------------

* The import task used the canonical version of a file path. This
  has been changed to use the absolute path. Bugzilla 28505.

* ant-xalan2.jar has been removed since the only class contained in it
  didn't depend on Xalan-J 2 at all.  Its sole dependency has always
  been TraX and so it has been merged into ant-trax.jar.

* All exceptions thrown by tasks are now wrapped in a buildexception
  giving the location in the buildfile of the task.

* Nested elements for namespaced tasks and types may belong to the
  Ant default namespace as well as the task's or type's namespace.

* <junitreport> will very likely no longer work with Xalan-J 1.

  Note that Xalan-J 1 has been deprecated for a very long time and we
  highly recommend that you upgrade.

  If you really need to continue using Xalan-J 1, please copy the
  junit-frames-xalan1.xsl from the distribution's etc directory as
  junit-frames.xsl into a new directory and use the task's styledir
  attribute to point to.  This is the last version of the XSLT
  stylesheet that is expected to be compatible with Xalan-J 1.

Fixed bugs:
-----------

* eliminate memory leak in AntClassLoader. Bugzilla Report 8689.

* subant haltonfailure=false did not catch all failures. Bugzilla Report 27007.

* macrodef @@ escaping was broken.  Bugzilla Report 27069.

* MacroDef did not allow attributes named 'description'. Bugzilla Report 27175.

* Throw build exception if name attribute missing from patternset#NameEntry.
  Bugzilla Report 25982.

* Throw build exception if target repeated in build file, but allow targets
  to be repeated in imported files.

* <apply> didn't compare timestamps of source and targetfiles when
  using a nested <filelist>.  Bugzilla Report 26985.

* tagdiff.xml was broken in ant 1.6.1. Bugzilla Report 27057.

* if the basedir contained .. or . dirs, and the build file name contained
  .. or ., the basedir was set incorrectly. Bugzilla Report 26765.

* regression from ant 1.5, exec task outputted two redundant trailing newlines.
  Bugzilla Report 27546.

* NPE when running commons listener. Bugzilla Report 27373.

* <java> swallowed the stack trace of exceptions thrown by the
  executed program if run in the same VM.

* -projecthelp swallowed (configuration) errors silently.
  Bugzilla report 27732.

* filterset used by filtertask doesn't respect loglevel. Bugzilla Report 27568.

* wrong compare used in ProjectComponent for logging. Bugzilla Report 28070.

* failOnAny attribute for <parallel> was broken. Bugzilla Report 28122.

* If <javac> uses gcj and any of the nested <compilerarg>s implies
  compilation to native code (like -o or --main), Ant will not pass
  the -C switch to gcj.  This means you can now compile to native code
  with gcj which has been impossible in Ant < 1.6.2.

* <import optional="false"> and <import optional="true">
  behaved identically.

* <xslt> now sets the context classloader if you've specified a nested
  <classpath>.  Bugzilla Report 24802.

* <zip> and friends would delete the original file when trying to update
  a read-only archive.  Bugzilla Report 28419.

* <junit> and <assertions> are working together. Bugzilla report 27218

* AntClassLoader#getResource could return invalid URLs.  Bugzilla
  Report 28060.

* Ant failed to locate tools.jar if the jre directory name wasn't all
  lowercase.  Bugzilla Report 25798.

* Redirector exhibited inconsistent behavior with regard to split
  output.  When sent to file only, files would be created in all
  cases; when split file-property, files were only created if
  writes were performed.

* fixed case handling of scriptdef attributes and elements.

* UNC pathnames did not work for ANT_HOME or -lib locations on Windows.
  Bugzilla report 27922.

* replacestring tokenfilter only replaced the first occurrence.

* AntLikeTasksAtTopLevelTest failed on cygwin.

* I/O-intensive processes hung when executed via <exec spawn="true">.
  Bugzilla reports 23893/26852.

* JDependTask did not close an output file. Bugzilla Report 28557.

* Using <macrodef> could break XmlLogger. Bugzilla Report 28993.

* <genkey> no longer requires keytool to be in your PATH.  Bugzilla
  Report 29382.

* <symlink> could create cyclic links.  Bugzilla Report 25181.

* <zip whenempty="skip"> didn't work in a common situation.  Bugzilla
  Report 22865.

* <scp> now properly handles remote files and directories with spaces
  in their names.  Bugzilla Report 26097.

* <scp> now has (local|remote)tofile attributes to rename files on the
  fly.  Bugzilla Report 26758.

* <telnet> and <rexec> didn't close the session.  Bugzilla Report 25935.

* <subant> and XmlLogger didn't play nicley together.

Other changes:
--------------
* doc fix concerning the dependencies of the ftp task
  Bugzilla Report 29334.

* <xmlvalidate> has now a property nested element,
  allowing to set string properties for the parser
  Bugzilla Report 23395.

* Docs fixes for xmlvalidate.html, javadoc.html, starteam.
  Bugzilla Reports 27092, 27284, 27554.

* <pathconvert> now accepts nested <mapper>s.  Bugzilla Report 26364.

* Shipped XML parser is now Xerces-J 2.6.2.

* Added nested file element to filelist.

* spelling fixes, occurred. Bugzilla Report 27282.

* add uid and gid to tarfileset. Bugzilla Report 19120.

* <scp> has a verbose attribute to get some feedback during the
  transfer and new [local|remote][File|Todir] alternatives to file and
  todir that explicitly state the direction of the transfer.

* The OS/2 wrapper scripts have been adapted to use the new launcher.
  Bugzilla Report 28226.

* <sshexec> now also captures stderr output.  Bugzilla Report 28349.

* <xslt> now supports a nested <mapper>.  Bugzilla Report 11249.

* <touch> has filelist support.

* <nice> task lets you set the priority of the current thread; non-forking
  <java> code will inherit this priority in their main thread.

* New attribute "negate" on <propertyset> to invert selection criteria.

* Target now supports a Location member.  Bugzilla Report 28599.

* New "pattern" attribute for <date> selector.

* <junit> has a new forkmode attribute that controls the number of
  Java VMs that get created when forking tests.  This allows you to
  run all tests in a single forked JVM reducing the overhead of VM
  creation a lot.  Bugzilla Report 24697.

* <jar> can now optionally create an index for jars different than the
  one it currently builds as well.  See the new <indexjars> element
  for details.  Bugzilla Report 14255.

* Permit building under JDK 1.5. Bugzilla Report 28996.

* minor Javadoc changes. Bugzilla Report 28998.

* Misc. corrections in SignJar.java. Bugzilla Report 28999.

* Remove redundant <hr> from javah.html. Bugzilla Report 28995.

* Ignore built distributions. Bugzilla Report 28997.

* A new roundup attribute on <zip> and related task can be used to
  control whether the file modification times inside the archive will
  be rounded up or down (since zips only store modification times with
  a granularity of two seconds).  The default remains to round up.
  Bugzilla Report 17934.

* A binary option has been added to <concat>. Bugzilla Report 26312.

* Added DynamicConfiguratorNS, an namespace aware version of
  DynamicConfigurator. Bugzilla Report 28436.

* Add implicit nested element to <macrodef>. Bugzilla Report 25633.

* Add deleteonexit attribute to <delete>.

* Added Target.getIf/Unless().  Bugzilla Report 29320.

* <fail> has a status attribute that can be used to pass an exit
  status back to the command line.

* <fail> accepts a nested <condition>.

* <loadproperties> supports loading from a resource.
  Bugzilla Report 28340.

* Nested file mappers and a container mapper implementation have been
  introduced.  Additionally, the <mapper> element now accepts "defined"
  nested FileNameMapper implementations directly, allowing a usage
  comparable to those of <condition>, <filter>, and <selector>.

* New <redirector> type introduced to provide extreme I/O flexibility.
  Initial support for <exec>, <apply>, and <java> tasks.

* <apply> has a new ignoremissing attribute (default true for BC)
  which will allow nonexistent files specified via <filelist>s to
  be passed to the executable.  Bugzilla Report 29585.

* <junitreport> now also works with Xalan XSLTC and/or JDK 1.5.
  Bugzilla Report 27541.

* <jspc> doesn't work properly with Tomcat 5.x.  We've implemented a
  work-around but don't intend to support future changes in Tomcat
  5.x.  Please use the jspc task that ships with Tomcat instead of
  Ant's.

Changes from Ant 1.6.0 to Ant 1.6.1
=============================================

Changes that could break older environments:
--------------------------------------------

* License is now Apache License 2.0
  see http://www.apache.org/licenses/ for more information

Fixed bugs:
-----------
* Remove a recursive template call in the junit xsls that could trigger a stack
  overflow. It now uses Xalan extensions to call a Java class directly.
  Bugzilla Report 19301

* Fix spurious infinite loop detection for filters (introduced in ant 1.6.0).
  Bugzilla Report 23154.

* Fix handling of default ant namespace for nested elements.

* Fix jboss element of ejb task (introduced in ant 1.6.0).

* <whichresource> failed to load classes correctly.

* Ant could fail to start with a NullPointerException if
  ANT_HOME/lib/ant-launcher.jar was part of the system CLASSPATH.

* presetdef'ed types did not work with the ant-type attribute

* fixed case handling of macrodef attributes and elements. Bugzilla
  Reports 25687 and 26225.

* <java> ignored the append attribute, Bugzilla Report 26137.

* The gcj compiler adapter for <javac> failed if the destination
  directory didn't exist.  Bugzilla Report 25856.

* Ant now fails with a more useful message if a new process will be
  forked in a directory and that directory doesn't exist.

* <splash> used to break the build on non-GUI environments.  Bugzilla
  report 11482.

* Ant 1.6.0 cannot run build scripts in directories with non-ASCII names.
  Bugzilla Report 26642.

Other changes:
--------------
* Shipped XML parser is now Xerces-J 2.6.1

* Translate task logs a debug message specifying the number of files
  that it processed.  Bugzilla Report 13938.

* <fixcrlf> has a new attribute - fixlast. Bugzilla Report 23262.

* <p4submit> has 2 new attributes, needsresolveproperty and changeproperty.
  Bugzilla Report 25711.

* add description attributes to macrodef attributes and elements.
  Bugzilla Report 24711.

* Extending ClearCase Tasks :
 - Added an extra option to 'failonerr' to each ClearCase task/command.
 - Extended the functionality of cccheckout. It can check (notco) to see if
  the desired element is already checked out to the current view. Thus it
   won't attempt to check it out again.
 - Added three new ClearCase commands: ccmkattr, ccmkdir, ccmkelem
  Bugzilla Report 26253.

* added nested text support to <macrodef>

* added initial support for Java 1.5.  Java 1.5 is now correctly
  detected by Ant and treated just like Java 1.4.  You can now specify
  source="1.5" in the <javac> task.

* created new task <cvsversion>

* added support for branch logging via the tag attribute in <cvschangelog>
  Bugzilla Report 13510.

* added support the groovy language in the script and scriptdef tasks

Changes from Ant 1.5.4 to Ant 1.6.0
===================================

Changes that could break older environments:
--------------------------------------------

* This version of Ant can not be built with JDK 1.1 and requires at
  least Java 1.2 at runtime as well.  Compiling for a 1.1 target is
  still supported.

* Targets cannot have the empty string as their name any longer.

* ant.jar's manifest does no longer include a Class-Path entry, so it
  is no longer possible to run Ant via "java -jar ant.jar" without
  manually altering the CLASSPATH.  Instead of that a file
  ant-bootstrap.jar is included in the etc directory of the binary
  distribution, copy this to the lib directory and use
  "java -jar ant-bootstrap.jar" instead if you want to run Ant without
  the wrapper script (not recommended).

* The <script> task now requires Apache BSF instead of the older IBM
  version.  See <http://jakarta.apache.org/bsf/>

* <xmlproperty> will no longer fail if the file to be loaded doesn't exist.

* XML namespaces are now enabled in the XML parser, meaning XML namespace
  declarations no longer cause errors. However task names containing colons
  will cause errors unless there is a corresponding namespace uri.

* The <ftp> and <telnet> tasks now require Jakarta Commons Net instead
  of the older ORO Netcomponents version.  See
  <http://jakarta.apache.org/commons/net/index.html>.

* <input> will no longer prompt the user and wait for input if the
  addproperty attribute is set to a property that has already been
  defined in the project.  If you rely on the task waiting for input,
  don't use the addproperty attribute.

* The Class-Path attribute in manifests will no longer merge the
  entries of all manifests found, but will be treated like all other
  manifest attributes - the most recent attribute(s) will be used.

* New Launch mechanism implemented. This moves some functionality from
  the batch files / shell scripts into Java. This removes environment
  limitations, for command issues, directory depth issues on Windows. Also
  allows a per-user library location to be used if the main Ant install
  is locked down.

* The Entry nested element of PropertyFile will not any more have its value
  attribute (actually increment) overwritten with the new value of the entry
  after execution.

* Output stored from a <java> or <exec> task is now exactly as generated. No
  conversion to platform end-of-line characters is performed.

* <translate> will now preserve line endings.

* <ftp> followsymlinks="false" in nested fileset definitions is explicitly
  required in order to exclude remote symbolic links (when doing a get, chmod,
  delete, rmdir).

* The values of the Copy#fileCopyMap variable has changed from String to
  String[]. (In java 1.5 terms it was Hashtable<String, String> and
  is now Hashtable<String, String[]>). This will affect third party code
  that extend Copy and override Copy#doFileOperations.

* <loadproperties> didn't expand properties while <property file="..."/>
  does, so they were not equivalent.  This has been fixed, which means
  that propetries may get expanded twice if you use an
  <expandproperties> filterreader.  Bugzilla Report 17782.

* User defined tasks and typedefs are now handled internally in the
  same way as predefined tasks and typedefs. Also tasks and typedefs
  are resolved at a later stage. This causes some
  differences especially for user defined task containers.

* <checksum> log message "Calculating checksum ..." has been degraded
  from INFO to VERBOSE.

Fixed bugs:
-----------
* Filter readers were not handling line endings properly.  Bugzilla
  Report 18476.

* Filtersets were also not handling line endings properly.

* Expand tasks did not behave as expected with PatternSets.

* <property environment=... /> now works on OS/400.

* <cab> could hang listcab on large <fileset>s.

* The starteam stcheckout, stcheckin tasks now correctly compute
  status of files against whatever local tree they are run against
  and, optionally, will not process a file if it is current.
  Previously you had to process everything unless you ran against the
  default folder which wasn't the normal use-case for ant-starteam.
  The stlist task now similarly displays that status correctly making
  it a more generally useful tool.

* entity includes would cause exceptions if path names included spaces.

* addConfiguredXXX would not work for TaskAdapter wrapped tasks

* Fix <ilasm> outputfile testing so that the output file does not need
  to exist beforehand.

* Ant will now exit with a return code of 1 if it encounters problems
  with the command line arguments.

* ClassLoader creation changes to use a factory method in Project. A new
  class AntClassLoader2 implemented for 1.2+ specific features including
  Package information and addition of classes specified in the Class-Path
  element of a Jar's manifest.

* It is now possible in <exec> to resolve the executable to a project
  basedir or execution dir relative executable. The resolveExecutable
  must be used to pick up such executables.

* splash screen wouldn't disappear when build was finished.

* <exec> output and error streams can now be redirected independently
  to either a property or a file (or both)

* TarEntry's File-arg constructor would fail with a
  StringIndexOutOfBoundsException on all OSes where os.name is shorter
  than seven characters.  Bugzilla Report 18105.

* <copy> and <move>'s failonerror didn't apply to filesets pointing to
  non-existant directories.  Bugzilla Report 18414.

* The <stripjavacomments> filter sometimes removed parts of string
  constants.  Bugzilla Report 17441.

* <antlr> will now recompile your grammar if the supergrammar has
  changed.  Bugzilla Report 12691.

* <property env> will now work on Unices with /bin/env instead of
  /usr/bin/env.  Bugzilla Report 17642.

* <jar index="on"> could include multiple index lists.  Bugzilla 10262.

* The index created by <jar> didn't conform to the spec as it didn't
  include the top-level entries.  Bugzilla Report 16972.

* <tar> and <zip> didn't honor the defaultexcludes attribute for the
  implicit fileset.  Bugzilla Report 18637.

* The <replacetokens> filter would throw an exception if the token's
  value was an empty string.  Bugzilla Report 18625.

* Perforce tasks relying on output from the server such as <p4change>
  and <p4label> were hanging. Bugzilla Reports 18129 and 18956.

* Improve exception and logging behavior of Perforce tasks.
  Bugzilla report 18154.

* build.sh install had a problem on cygwin (with REALANTHOME).
  Bugzilla Report 17257

* <replaceregexp> didn't work for multi-byte encodings if byline was false.
  Bugzilla Report 19187.

* <replaceregexp> was altering unnecessarily the timestamp of the directories
  containing the files to process
  Bugzilla Report 22541.

* file names that include spaces need to be quoted inside the @argfile
  argument using forked <javac> and (all JDKS).  Bugzilla Report 10499.
  NB : a first correction was only introducing quotes for JDK 1.4
  It has been changed to quote for all external compilers when paths
  contain spaces.
  Also the backslashes need to be converted to forward slashes
  Bugzilla Report 17683.

* Setting filesonly to true in <zip> and related tasks would cause the
  archives to be always recreated.  Bugzilla Report 19449.

* file names that include spaces need to be quoted inside the @argfile
  argument using <javadoc> and JDK 1.4.  Bugzilla Report 16871.

* <junit> didn't work with custom formatters that were only available
  on the user specified classpath when a timeout occurred.  Bugzilla
  Report 19953.

* <different> selector : make ignoreFileTimes effectively default to true
  and fix a bug in the comparison of timestamps. Bugzilla Report 20205.

* <different> selector can now be nested directly under a fileset
  Bugzilla Report 20220.

* <cvstagdiff> had a problem with "dd-MM-yy hh:mm:ss" formats
  Bugzilla Report 15995.

* <cvstagdiff> cvsroot and package attributes added to the root
  element tagdiff of the xml output
  Bugzilla Report 16081.

* <cvstagdiff> had a problem with aliased modules and with requests for
  multiple modules. Bugzilla Reports 21373 and 22877.

* <cvstagdiff> could not parse properly the revision number of new files with
  CVS 1.11.9 or higher. Bugzilla Report 24406.

* <fixcrlf> make fixcrlf create its temporary files in the default directory
  of FileUtils#createTempFile instead of the destination dir of fixcrlf.
  Bugzilla Report 20870.

* <ejbjar> implementation for Borland.
  Prevent the task from being blocked by error messages coming from java2iiop.
  Bugzilla Report 19385.

* <unzip>'s and <untar>'s nested patternsets didn't work as documented
  when the pattern ended in a slash or backslash.  Bugzilla Report 20969.

* <fixcrlf> will now create the parent directories for the destination
  files if necessary.  Bugzilla Report 20840.

* <xmlproperty> now handles CDATA sections. BugZilla Report 17195

* <translate> now translate tokens that are placed close together.
  Bugzilla Report 17297

* Nested websphere element for ejbjar does not support spaces in file name.
  Bugzilla Report 21298

* Don't multiply Class-Path attributes when updating jars.  Bugzilla
  Report 21170.

* Do not overwrite the value (increment) attribute of PropertyFile nested
  Entry element. Bugzilla Report 21505.

* Prevent sysproperties with no key or no value from being added in <junit>.
  Bugzilla Report 21684.

* Allow references to be properly inherited via antcall
  Bugzilla Report 21724.

* ftp chmod failed when the remote system was UNIX and local system Windows
  Bugzilla Report 21865.

* ftp put with chmod failed when the remote system was UNIX and local system
  Windows. Bugzilla Report 23143.

* ftp did not set the ascii mode explicity, causing problems with ftp servers
  having binary as default

* ftp was not able to download files when they were pointed to by symbolic
  links. Bugzilla Report 14063.

* ftp is able to download also directories pointed to by symbolic links.

* replace would change \r\n into \r\r\n under Windows.

* junitreport with frames did not display a link for classes without a package
  or in the top package.
  Bugzilla Report 21915.

* Project.toBoolean(String) now handles null as argument and does not throw a
  NullPointerException any more.

* The socket condition will now close the socket created to test.
  Bugzilla Report 23040.

* <junit includeantruntime="true" fork="true"> replaced the CLASSPATH instead
  of adding to it.  Bugzilla Report 14971.

* <splash> could fail on JVMs that use null to indicate the system classloader.
  Bugzilla Report 23320.

* <xmlcatalog>s only worked when defined inside of tasks.  Bugzilla
  Report 20965.

* <csc> and siblings (<vbc> <jsharpc>) handle large filesets by
automatic use of response files.  Bugzilla report #19630

Other changes:
--------------

* Shipped XML parser is now Xerces 2.6.0

* All tasks can be used outside of <target>s.  Note that some tasks
  will not work at all outside of targets as they would cause infinite
  loops (<antcall> as well as <ant> and <subant> if they invoke the
  current build file).

* Six new Clearcase tasks added.

* A new filter reader namely tokenfilter has been added.  Bugzilla
  Report 18312.

* A new attribute named skip is added to the TailFilter and
  HeadFilter filter readers.

* The filesetmanifest attribute of <jar> has been reenabled.

* The start and end tokens for <translate> may now be longer than a
  single character.

* <setproxy> lets you set the username and password for proxies that
  want authentication

* <loadproperties> has a new encoding attribute.

* <echoproperties> can now create XML output.

* <echoproperties> has a new srcfile attribute that can make it read
  properties files and output them instead of Ant's properties.

* <filterset> will now resolve filters recursively.

* <input> has a new attribute that allows you to specify a default value.

* Added <image> task (requires JAI).

* <image> task has now proportions attribute in the <scale/> nested element
  instead of keepproportions (bringing in more functionality)

* New condition <isreference>

* <ftp> now has a preservelastmodified attribute to preserve the
  timestamp of a downloaded file.

* new rmdir action for <ftp> that removes directories from a fileset.

* <ftp> has attributes timediffauto and timediffmillis to use together
  with the newer attribute to tell ant to take into account a time difference
  between client and remote side.
  Bugzilla Report 19358.

* <ftp> has been optimized to go directly to the include patterns.
  This reduces scanning time under UNIX when followsymlinks="true"
  and casesensitive="true" (the default)
  Bugzilla Report 20103.

* The SOS and VSS tasks will no longer unconditionally prepend a $ to
  vsspath or projectpath.

* OS/400 now gets detected by the os condition.

* <arg> has a new attribute pathref that can be used to reference
  previously defined paths.

* <xmlproperty> has been improved, you can now expand ${properties},
  define ids or paths and use Ant's location magic for filename resolutions
  in the XML file.

* <xmlcatalog> will now support external catalogs according to the
  OASIS "Open Catalog" standard - if resolver.jar (newer than version
  1.0) from Apache's xml-commons is in your CLASSPATH.

* Starteam tasks now have support for revision labels and build labels.
  Checkouts now have the option of using repository timestamps, instead
  of current.

* new task <symlink> that creates and maintains symbolic links.

* new tasks <chown> and <chgrp> which are wrappers of the Unix commands.

* new task <attrib> to change file attributes on Windows systems.

* <style> has a new attribute reloadstylesheet to work around a
  bug in widespread Xalan versions.

* <tarfileset> has a new dirmode attribute to specify the permissions
  for directories.

* <fixcrlf>'s eol attribute now also understands "mac", "unix" and "dos".

* <classfileset> now picks up dependencies of the form MyClass.class. This
  works for the code generated by the Sun java compiler. It may not work for
  all compilers.

* a new attribute "globalopts" can be added to all Perforce tasks.
  You can put in it all the strings described by p4 help usage. Refer to
  the docs for more information.

* new Perforce tasks <p4integrate> , <p4resolve>, and <p4labelsync>

* <p4submit> will change the property p4.change if the Perforce server
  renumbers the change list.
  It will set the property p4.needsresolve if the submit fails,
  and the message says that file(s) need to be resolved.

* <replaceregexp> now has an optional encoding attribute to support
  replacing in files that are in a different encoding than the
  platform's default.

* The <exec> task may now have its input redirected from either a file
  or a string from the build file. The error output can be separated
  to a different file when outut is redirected. standard error may be
  logged to the Ant log when redirecting output to a file

* The <java> task also supports the input redirection and separate
  error streams introduced to the <exec> task. In addition, it is now
  possible to save the output into a property for use within the build
  file as was possible with <exec> in Ant 1.5

* The <javadoc> task <tag> subelement has been enhanced to allow files
  with tag mappings to be used.

* New tasks: <scp> supports file transfers, <sshexec> executes a
  command over SSH.  They require jsch, a BSD licensed SSH library that
  can be found at http://www.jcraft.com/jsch/index.html

* New filterreader <escapeunicode/>.

* Support for HP's NonStop Kernel (Tandem) OS has been added.

* <cab>'s basedir attribute is now optional if you specify nested
  filesets.  Bugzilla Report 18046.

* New task <sync> that synchronizes two directory trees.

* <apply> has new forwardslash attribute that can force filenames to
  use forward slashes (/) as file separators even on platforms with a
  different separator.  This is useful if you want to run certain
  ported Unix tools.

* Copy has a new outputencoding attribute that can be used to change
  the encoding while copying files.  Bugzilla Report 18217.

* The xml formatter for JUnit will now honor test case names set with
  setName.  Bugzilla Report 17040.

* JUnit now has an attribute reloading, which, when set to false,
  makes the task reuse the same class loader for a series of tests.

* <concat> now supports filtering and can check timestamps before
  overriding a file.  Bugzilla Report 18166.

* <junit> has a new attribute tempdir that controls the placement of
  temporary files.  Bugzilla Report 15454.

* <jdepend> now supports a new nested element <classespath> which is
  the same as <sourcespath> but point to compiled classes (the
  prefered mode of operation for JDepend > 2.5).  Additionally, nested
  <exclude> elements can be used to exclude certain packages from
  being parsed.  Bugzilla Report 17134.

* The JProbe tasks now also work with JProbe 4.x.  Bugzilla Report 14849.

* <javacc> and <jjtree> will now autodetect JavaCC 3.x and can use it.

* <sql> has a new attribute to control escape processing.

* <sql> is able to display properly several resultsets if you are
  running a compound sql statement. Bugzilla Report 21594.

* A new <containsregexp> selector has been added, that selects files
  if their content matches a certain regular expression.

* <antlr>'s debug attribute has been enabled.  Bugzilla Report 19051.

* <mail> has a new attribute charset. Bugzilla Report 15434.

* <mail> has new attributes user and password for SMTP auth.
  maillogger can also use this.
  The implementation only works with JavaMail (encoding="MIME").
  Implementation with plain mail remains to do.
  Bugzilla Report 5969.

* <mail> and mailloger support SMTP over TLS/SSL
  Bugzilla Report 19180.

* <mail> the attributes from, replyto ,tolist, cclist, bcclist
  can now contain email addresses of the form name <address@xyz.com>
  or (name) address@xyz.com
  Bugzilla Report 22474.

* <mail> (version PlainMail)
  prevent blank headers from being sent,
  make the order of the headers of plain mail messages predictable
  Bugzilla Report 22088.

* <zipfileset> can now be defined in the main body of a project
  and referred to with refid="xyz". Bugzilla Report 17007.

* A wrapper script for OS/2 has been added.

* <unzip> will now detect and successfully extract self-extracting
  archives.  Bugzilla Report 16213.

* <stcheckout> has a new attribute "converteol" that can be used to
  control the automatic line-end conversion performed on ASCII files.
  Bugzilla Report 18884.

* Users can now modify the list of default excludes using the new
  defaultexcludes task.  Bugzilla Report 12700.

* There is a new data type <propertyset> that can be used to collect
  properties.  It is supported by <ant>, <antcall>, <subant>, <java>,
  <echoproperties> and <junit>.

* <concat> can now control the encoding of the output as well and optionally
  add new-line characters at the end of files that get concatenated but
  don't end in newlines.  Bugzilla Report 12511.

* <rpm> will detect the rpmbuild executable of RedHat 8.0 and newer
  and use that if it is on your PATH.  Bugzilla Report 14650.

* A new task <rexec> has been added that requires commons-net to work.
  Bugzilla Report 19541.

* <javadoc> now supports a nested <arg> element in addition to the
  additionalparams attribute.

* You can now determine the order of standard tags in <javadoc> via
  <tag> elements - you must not use the description attribute for them.
  Bugzilla Report 18912.

* <javadoc> now supports the -noqualifier switch.  Bugzilla Report 19288.

* <javac>'s executable attribute can now also be used to specify the
  executable for jikes, jvc, sj or gcj.  Bugzilla Report 13814.

* <javac> has a new attribute tempdir that can control the placement
  of temporary files.  Bugzilla Report 19765.

* A new magic property build.compiler.jvc.extensions has been added
  that can be used to turn of Microsoft extensions while using the jvc
  compiler.  Bugzilla Report 19826.

* You can now limit the parallelism of <apply> and <chmod> by using the new
  maxparallel attribute.

* With the new addsourcefile attribute, you can make <apply> ommit the
  source file names from the command line.  Bugzilla Report 13654.

* <apply> and <chmod> now support nested <filelist>s as well as <dirset>s.
  Bugzilla Reports 15929 and 20687.

* <apply> and <chmod> will display a summary if you set the new
  verbose attribute to true.  Bugzilla Report 19883.

* <copy>/<move>'s failonerror attribute can now also be used to
  continue the build if an I/O error caused a problem.  Bugzilla
  Report 12999.

* new selector <type/> allowing to select only files or only directories.
  Bugzilla Report 20222.

* <java> and <junit> now support a nested <bootclasspath> element that
  will be ignored if not forking a new VM.

* <junit>'s nested <formatter> elements now support if/unless clauses.

* <ejbjar>
  cmpversion attribute added
  jboss element will look for jbosscmp-jdbc.xml descriptor
  if ejbjar has cmpversion="2.0" set
  Bugzilla Reports 14707 and 14709.

* <pvcs> config attribute added to set the location of a specific PVCS
  .cfg file
  Bugzilla Report 9752

* <mapper> has an "unpackage" mapper
  Bugzilla Report 18908

* Added <scriptdef> task allowing tasks to be defined using any BSF-supported
  scripting language.

* <touch>'s datetime attribute can now accept time with a granularity
  of seconds as well.  Bugzilla Report 21014.

* <checksum> has two new properties: totalproperty and todir.

* FileUtils#createTempFile will now create temporary files in the
  directory pointed to by the property java.io.tmpdir

* <unzip> and friends now supports an optional encoding attribute to
  enable it to expand archives created with filenames using an encoding
  other than UTF8.  Bugzilla Report 10504.

* <patch> has a new attribute destfile that can be used to create a new
  file instead of patching files in place.

* OpenVMS is detected as a valid OS family.

* DirectoryScanner has been optimized for cases where include patterns do not
  start with wildcards.  Bugzilla Report 20103.

* DirectoryScanner begins to be optimized not to scan excluded directories.
  Bugzilla Report 21941.

* Added keep-going feature. Bugzilla Report 21144

* The archives generated by <zip> and friends will now contain CRC and
  size information in the "local file header", thereby providing this
  information to applications that read the archives using
  java.util.ZipInputStream.  Bugzilla Report 19195.

* <copy> and <move> can now handle mappers that return multiple
  mappings per source path. This behaviour is enabled by using
  an enablemultiplemapping attribute. Bugzilla Report 21320.

* <exec> will now work on OpenVMS (please read the notes in
  <exec>'s manual page).  Bugzilla Report 21877.

* <exec> will now have a new attribute spawn (default false).
  If set to true, the process will be spawned. Bugzilla Report 5907.

* <java> will now have a new attribute spawn (default false).
  If set to true, the process will be spawned. Bugzilla Report 5907.

* <parallel> now supports a timeout which can be used to recover
  from deadlocks, etc in the parallel threads. <parallel> also
  now supports a <daemons> nested element. This can be used to
  run tasks in daemon threads which the parallel task will not
  wait for before completing. A new attribute failonany will cause
  <parallel> to throw an exception if any thread fails without
  waiting for all other threads to complete.

* <zip> and friends will consume far less memory than they used to
  when run with compress="false".  Bugzilla Report 21899.

* <if/> and <unless/> attributes added to <param/> element of <style>
   Bugzilla Report 22044

* <zip> and friends have a new attribute "keepcompression" that can be
  used to incrementally build an archive mixing compressed and uncompressed
  entries.

* <junit>'s XML formatter adds a new classname attribute to the <testcase>
  elements.

* new <permissions> type add permission handling to the code
  this type can be nested in the <java> and <junit> tasks.
  Bugzilla Report 22533.

* additional shortcuts for ant options (-d --> -debug, -e --> -emacs,
  -h --> -help, -p --> -projecthelp, -s --> -find).

* new selector <modified>. "cache" was renamed to "modified".
  Bugzilla Report 20474.

* <stcheckout> and <stlist> have a new asofdate attribute that can be
  used to checkout/list files based on a date instead of a label.
  Bugzilla Report 20578.

* New filter <concatfilter>. Adds the content of file at the beginning
  or end of a file. Discussion started at
  http://marc.theaimsgroup.com/?l=ant-user&m=106366791228585&w=2

* New task <import>

* New task <macrodef>

* New task <presetdef>

* Ant libraries that can make use of namespaces to avoid name
  clashes of custom tasks

* <java> and <junit> now support <assertions>, which let you enable
  and disable Java1.4 assertions on a package or class basis. These
  only work when fork=true, currently.

* .NET tasks expanded with VB support <vbc> and J#, via <jsharp>,
  <importtypelib> and <ilasm>. <csc> supports nested <src> types,
  <defines> for (potentially conditional) definitions, <reference>
  filesets for references. The executable attribute lets you switch to
  mono or other implementations -<csc> has been tested with Mono on
  Linux and OSX.


Changes from Ant 1.5.3 to Ant 1.5.4
===================================

Changes that could break older environments:
--------------------------------------------

* If the Visual Age tasks used to work for you, they may stop doing so
  now - and we'd like to know about it.  The current set of tasks is
  supposed to work with any version of VAJ starting with 3.0.

Fixed bugs:
-----------

* The Visual Age for Java tasks didn't work (at least for versions 3.0
  and higher).  Bugzilla Report 10016.

* URL-encoding in <vaj*port> didn't work properly.

* VAJRemoteUtil called getAbsolutePath instead of getPath
  causing problems when using a Windows VAJ server from a UNIX server.
  Bugzilla Report 20457.

* VAJImport task failed with NullPointerException when using DirectoryScanner.
  Bugzilla Report 22080.

Other changes:
--------------

* Shipped XML parser is now Xerces 2.5.0

* <javah> will invoke oldjavah on JDK 1.4.2.  Bugzilla Report 18667.

* The VAJ tasks now support a haltonfailure attribute to conditionally
  keep building even if they fail.

* It is now possible to use the latest (versioned or unversioned) edition
  in <vajload> by using special wildcard characters.  Also fixes
  Bugzilla Report 2236.

Changes from Ant 1.5.2 to Ant 1.5.3
===================================

Changes that could break older environments:
--------------------------------------------

* The <zip> task and friends have again changed a method signature
  (sorry, was necessary to fix bug 17780).  The return type of
  getResourcesToAdd has changed.

Fixed bugs:
-----------

* <zipfileset>'s filemode would get ignored and the dirmode was used
  for the included files as well.  As a side effect, WinZIP was unable
  to extract or display the files, so they seemed to be missing from
  the archive.  Bugzilla Report 17648.

* <ftp> could use the wrong path separator when trying to change the
  remote working directory.  Bugzilla Report 17735.

* <jar update="true"> would loose all original files if you didn't
  specify any nested <(zip)fileset>s and the manifest had changed.
  Bugzilla Report 17780.

* If you used a value starting with \ on Windows for the appxml
  attribute of <ear> or the webxml attribute of <war>, it would be
  ignored.  Bugzilla Report 17871.

* Ant will no longer implicitly add Sun's rt.jar in <javac> when you
  use jvc and don't specify a bootclasspath.  Bugzilla Report 18055.

* The prefix attribute of <zipfileset> would not generate directory
  entries for the prefix itself.  Bugzilla Report 18403.

* starteam checkout can now handle deleted labels.  Bugzilla Report 17646.

* The Unix wrapper script failed if you invoked it as a relative
  symlink and ANT_HOME has not been set.  Bugzilla Report 17721.

Other Changes:
--------------
* Added ability to specify manifest encoding for the <jar> and
  <manifest> tasks

Changes from Ant 1.5.1 to Ant 1.5.2
=============================================

Changes that could break older environments:
--------------------------------------------
* ANT_OPTS environment variable is now applied at the start of the
  Java command line, allowing position specific parameters of some
  JVMs, such as -classic to be specified.

* ZipScanner#getIncludedFiles will now return the names of the ZipEntries
  that have been matched instead of the name of the archive.

* The <zip> task and friends have been heavily modified, almost every
  method signature of the Zip class has changed.  If you have subclassed
  Zip (or one of its subclasses), your class will most likely not
  compile against the current code base.  If it still compiles, it will
  probably not work as in Ant 1.5.1.

Fixed bugs:
-----------
* <translate> was not ignoring comment lines.

* <manifest> wouldn't update an existing manifest if only an attribute
  of an existing section changed.

* ant.bat now supports the ANT_ARGS and JAVACMD environment variables
  again (like Ant 1.5 did).

* The "plain" <junit> <formatter> could throw a NullPointerException
  if an error occurred in setUp.

* <junit> will now produce output when a test times out as well.

* <replace> would count some internal character replacements when
  reporting the number of replaced tokens.

* <concat> would cause an exception if a <filelist> pointed to files
  that do not exist.

* <javadoc> will now pass -source to custom doclets as well.

* <cvstagdiff> would throw a NullPointException if there had been no
  differences.

* <cvschangelog> could miss today's changes.

* <concat> could append newline characters between concatenated files.

* <xmlvalidate> ignored the specified encoding of the files to
  validate.

* the errorsbeginat attribute of the <http> condition didn't work.

* Ant will try to force loading of certain packages like com.sun.*
  from the system classloader.  The packages are determined by the
  version of the JVM running Ant.

* Ant didn't find the runtime libraries on IBM's JDK 1.4 for Linux.

* random component of temporary files is now always a positive integer.

* Ant could incorrectly try to use the 1.4 regexp implementation even
  if it isn't available if you run the JVM with -Xverify:none.

* Ant would die with an exception if you used nested <reference>
  elements in Ant and the refid attribute didn't point to an existing
  project reference.

* The <get> task can now be compiled (and Ant thus bootstrapped) using
  Kaffee.

* build.sysclasspath will now be honored by more tasks.

* The signjar keystore attribute has been reverted to a String allowing
  it to once again accept URLs. This should not affect current File based usage
  unless you are extending the Signjar task.

* <jar update="true"> would remove the original manifest.

* fix up folder creation in PVCS task

* <tar>'s up-to-date check didn't work for nested <(tar)fileset>s.

* Corrected a problem in XMLLogger where it would not associated
  messages with a taskdef'd task

* <uptodate> now works when using attributes (i.e. not filesets) and pointing
  to the same file

* Java task (and output system) now stores output which doos not end
  with a line feed.

* splash screen wouldn't disappear when build was finished.

* <exec> now supports OS/2.

* <zip> and friends would only update/recreate existing archives if
  the files to add/update have been newer than the archive.

* <javadoc>'s <link> element could fail for offline="true" on some JDKs.

Other changes:
--------------

* MailLogger now sets the Date header correctly.

* Shipped XML parser is now Xerces 2.3.0

* signjar now accepts a maxmemory attribute to allow the memory allocated to the
  jarsigner tool to be specified. The jarsigner from the JDK's JAVA_HOME bin
  dir is now used rather than the first jarsigner on the path.

* **/.DS_Store has been added to the list of default pattern excludes.

* The Created-By header in the default manifest now contains the JVM
  vendor and version according to the jar specification. A new header,
  Ant-Version provides the Ant version used to create the jar.

* <zip> can now store Unix permissions in a way that can be
  reconstructed by Info-Zip's unzip command.

Changes from Ant 1.5.1Beta1 to 1.5.1
====================================

Fixed bugs:
-----------

* <tstamp>'s prefix attribute failed to apply to nested <format> elements.

* <junitreport> created an empty junit-noframes.html if no format had
  been specified.

* <basename> would remove more than it should if the file name
  contained more than one dot.

* <filterset>s nested into <filterset>s didn't work.

Other changes:
--------------

* Shipped XML parser is now Xerces 2.2.0

* Filesets now support a 'file' attribute, allowing a single-file
  fileset to be constructed without having to specify its parent
  directory separately.

* <junit> will now return the result of a call to getName instead of
  "unknown" for Test implementations that don't extend TestCase but have
  a public String getName() method.

Changes from Ant 1.5 to 1.5.1Beta1
==================================

Fixed bugs:
-----------
* Date/time in CvsChangeLog was in local timezone and 12 hour format leading
  to a problem when sorting by time. It is now UTC (GMT) and in 24-hour
  format as per cvs 'specifications'.

* CvsTagDiff now supports ampersand modules or modules that have a different
  root directory than their name.

* EjbJar threw NPEs for the Websphere element. The property 'websphere.home'
  was not documented.

* Mail example in the documentation was not correct.

* Checksum was broken in the following scenario:
  (using verifyproperty OR in a condition) AND using filesets
  with multiple files.

* The ExpandProperties filter threw NPEs when defined using
  the <filterreader> format.

* The sh wrapper script didn't work under Cygwin if ANT_HOME wasn't
  set with a Unix style filename.

* The sh wrapper script could fail if you started Ant from a directory
  with whitespace in its name.

* ant -diagnostics was not working properly when the task dependency
  was missing and was just printing the missing dependency.

* If a task got redefined via <taskdef>, it lost its child elements.

* <property>'s classpathref attribute was broken.

* <arg line="''" /> would result in no command line argument, will now
  be a single empty argument.  Use <arg value="''"/> if you need the
  quotes literally.

* <replaceregexp> could append a newline character at the end of the
  file.

Other changes:
--------------

* Appendix E of Java Development with Ant (Loughran/Hatcher) was
  contributed to the docs.

* <available> will only print deprecration warnings if it is actually
  used to change the value of a property.

Changes from Ant 1.5beta3 to Ant 1.5
====================================

Changes that could break older environments:
--------------------------------------------

* The filesetmanifest attribute added to <jar> after the 1.4.1
  release has been removed for now.  This change may affect only
  the 1.5Beta/1.6Alpha users.  An attempt will be made to add this
  feature back into Ant 1.6.

Fixed bugs:
-----------

* <zip> and friends would always update existing archive if you set
  the update attribute to true.

* To support backward compatibility with older versions, <pathconvert>
  will once again set the property, even if the result is the empty
  string, unless the new 'setonempty' attribute is set to false|no|off
  (default is "true").

* The manifest task would crash XmlLogger

Other changes:
--------------

* added **/.svn and **/.svn/** to the default excludes

Changes from Ant 1.5beta2 to Ant 1.5beta3
=========================================

Changes that could break older environments:
--------------------------------------------

* <pvcs> default filenameformat has been different from Ant 1.4.1.
  Now it is different from 1.5beta1 and 1.5beta2.

* <pathconvert> won't set the property if the result is the empty string.

Fixed bugs:
-----------

* <available> could fail to find files or directories that happen to
  start with the name of the project's basedir but are not children of
  the basedir.

* Nested <property>'s inside <ant> can now be overriden by subsequent
  <ant> and <antcall> tasks.

* <xslt>'s outputtype attribute wouldn't do anything.

* <linecontains> filterreader could swallow lines.

* <sequential> used to configure the tasks (set their attributes)
  before the first task has been executed.  This means that properties
  that have been set by nested task seemed to be unset for the other
  tasks in the same <sequential> element.

* <javac>'s sourcepath setting has been ignored by some compiler
  implementations.

* <javadoc>'s packagelist attribute didn't work.

* the plain mailer would always use port 25 in <mail>.

* Ant's default logger could swallow empty lines.

* ejbjar's iPlanet nested element now can process multiple descriptors.

* IPlanetEjbc was looking in the wrong place for four iiop files.

* <javac> would pass the -source switch to JDK 1.3's javac, even
  though it doesn't support it.

Other changes:
--------------

* <checksum> now uses a buffer (of configurable size).

* The "Trying to override task definition" warning has been degraded
  to verbose level if the two task definitions only differ in the class
  loader instance that has loaded the definition.

* Add a jvmargs to the ejbjar's weblogic element to allow additional
  arguments to be provided to the VM runnign ejbc. Document the
  jvmdebuglevel attribute which can be used to avoid warnings about
  interface classess being found on the classpath. Document the new
  <sysproperty> element which allows JVM properties to be defined.
  Added an outputdir attribute to allow the destination to be a
  directory into which the exploded jar is written.

* ejbjar now supports Borland Enterprise Server 5 and Jonas 2.5

Changes from Ant 1.5beta1 to Ant 1.5beta2
=========================================

Changes that could break older environments:
--------------------------------------------

* Properties will now be expanded in mail message bodies.  This means
  that one $ sign will be stripped if your mail message contains the text $$.

* org.apache.tools.ant.taskdefs.Expand no longer extends MatchingTask.

* Available#setFile now again uses a File argument as it did in 1.4,
  this may break environments that have been adapted to the String
  argument version present in 1.5beta1.

Fixed bugs:
-----------
* When <move> attempts a rename, it deletes the destination file, if it
  exists, before renaming the source file.  However, <move> was not
  checking if the destination file was actually a directory before
  trying to delete it.

* Make CVS Tasks to work under Cygwin.

* Fix LineContains to handle huge files elegantly without causing
  Stack Overflows.

* if you ask for the "classic" compiler on Java1.4, you get upgraded to
  "modern" because there is no classic compiler any more.

* the <http> condition was viewing 404 'not found' exceptions as success. Now
  it defaults to viewing any response >=400 as an error, and has an
  errorsBeginAt attribute you can use if you want a higher or lower value.

* <get> throws a build exception on an http authorization error, unless you
  have set ignoreerrors to true.

* <wsdltodotnet> was spelt in Wintel case: <WsdlToDotnet>. It is now lower
  case, though the old spelling is retained for anyone who used it.

* Merging of Manifests in jar now works as documented.

* paths that have been separated by colons would be incorrectly parsed
  on NetWare.

* runant.pl now supports NetWare.

* <tempfile> and <setproxy> tasks were in beta1, but not defined by
  default; They now are. <tempfile> fills a property with the name of a
  temporary file; <setproxy> lets you set the JVM's http, ftp and socks proxy
  settings.

* <available classname="foo" ignoresystemclasses="true"> failed for
  JDK 1.1 and 1.2, even if the class could be found on the
  user-specified classpath.

* <property environment=... /> now works on z/OS.

* forked <javac> failed for the wrong reason on JDK 1.1 - Ant would
  use a temporary file to hold the names of the files to compile under
  some conditons, but 1.1 doesn't support this feature.  Ant will no
  longer try this, but you may run into problems with the length of the
  command line now.

* the refid attribute for <property>s nested into <ant> or <param>s
  nested into <antcall> didn't work.

* <replaceregexp> didn't work for nested <fileset>s.

* <javadoc> dropped sourcepath entries if no "interesting" .java
  source files  could be found below them.  This has been backwards
  incompatible and caused problems with custom doclets like xdoclet.

* Using the doclet, docletpath or docletpathref attributes of
  <javadoc> may have caused NullPointerExceptions.

* nested <filesets> of <javadoc> would include too much.

* <dependset> will no longer choke on <targetfileset>s that point to
  non-existing directories.

* <patch> didn't work at all.

* <replace> and <replaceregexp> now fail if the file they are working
  on is locked.

* <javadoc> would pick up the wrong executable in the combination JDK
  1.2 and AIX.

Other changes:
--------------

* z/OS now gets detected by the os condition.

* <fileset> and <dirset> now have an optional followsymlink attribute
  that can prevent Ant from following symbolic links on some platforms.

* BeanShell is now supported in the <script> task.

* <ejbjar> under Weblogic attempts to use the ejbc20 compiler for 2.0 beans
  based on the deployment descriptor's DTD reference. Under weblogic 7.00 Beta
  this ejbc class has been deprecated. To avoid the deprecation warning use
  ejbcclass="weblogic.ejbc".

* <ejbjar> will add a manifest to the generated jar based on the naming
  convention in use. This overrides the manifest specified in the
  <ejbjar> attribute


Changes from Ant 1.4.1 to 1.5beta1
==================================

Changes that could break older environments:
--------------------------------------------

* Important: Single $ signs are no longer silently stripped!
  Before you panic that we have broken all your build files, we have kept
  the old "$$" -> "$" behaviour. So only build files which accidentally had
  a $ sign in a string that was being silently stripped may break.
  We added this fix to stop newbie confusion; if you want to write a
  build file which works on ant versions 1.4.1 or earlier, stay with
  the double $$ sign rule.

* Project.getBuildListeners now returns a clone of the listener
  list. Changes to the returned list will not affect the listeners
  currently attached to the Project. It also means that it is safe to
  iterate over the returned list if listeners are added or removed
  during the traversal.

* <pvcs> default filenameformat has been different from Ant 1.4.1.

* Some messages that are printed during startup will not be
  written to the logfile specified via -logfile as they might destroy
  the format of the file for special BuildLoggers (like XmlLogger).

* The filesetmanifest attribute added to <jar> after the 1.4.1
  release has been removed for now.  This change may affect only
  the 1.5Beta/1.6Alpha users.  An attempt will be made to add this
  feature back into Ant 1.6.
* Shipped XML parser is now Xerces 2.0.1 along with the XML Parser APIs.
  XML Parser APIs is a separate jar that contains the necessary
  JAXP/DOM/SAX classes.

* <telnet> was fixed to expand properties inside nested <read> and
  <write> elements; before this only happened when you assigned the text
  to the string attribute. If you had $ signs in the string, they may
  need escaping.

* the RegexpMatcher interface has been extended to support case
  insensitive matches and other options - custom implementations of
  this interface won't work any longer.  We recommend to use the new
  Regexp interface that also supports substitution instead of the
  RegexpMatcher interface in the future.

* <gzip> will throw an exception if your src attribute points to a directory.

* Unjar, Unzip and Unwar will throw an exception if the Src attribute
  represents a directory.  Support for nested filesets is provided
  instead.

* It is no longer possible to overwrite a property using tasks like
  <condition>, <exec>, <pathconvert>, or <tstamp>. In some exceptional
  cases it will generate a warning if you attempt to overwrite an
  existing property.

* Taskwriters please note: Whenever tasks had any overloaded set* methods,
  Ant's introspection mechanism would select the last overloaded method
  provided to it by the Java Runtime.  A modification has now been made such
  that when the Java Runtime provides a method with a String as its argument,
  a check is made to see if there is another overloaded method that takes in
  some other type of argument.  If there is one such method, then the method
  that takes in String as an argument is not selected by the Introspector.

* The pattern definition **/._* has been included into the Default
  Excludes list.

* <propertyfile>'s <entry> element was modified to remove "never" as a value
  as its behavior was undocumented and flakey.

* The -projecthelp flag now only prints out targets that include the
  'description' attribute, unless the -verbose or -debug flag is included
  on the Ant command line.

* Ant's testcases now require JUnit 3.7 or above, as they now use the new
  assertTrue method instead of assert.

* If the 'output' attribute of <ant> is set to a simple filename or a
  relative path, the file is created relative to ${basedir}, not ${user.dir}.

* The default value for build.compiler is now javac1.x with x
  depending on the JDK that is running Ant instead of classic/modern.

Fixed bugs:
-----------

* <available> could fail to find files or directories that happen to
  start with the name of the project's basedir but are not children of
  the basedir.

* Nested <property>'s inside <ant> can now be overriden by subsequent
  <ant> and <antcall> tasks.

* <xslt>'s outputtype attribute wouldn't do anything.

* <linecontains> filterreader could swallow lines.

* <sequential> used to configure the tasks (set their attributes)
  before the first task has been executed.  This means that properties
  that have been set by nested task seemed to be unset for the other
  tasks in the same <sequential> element.

* <javac>'s sourcepath setting has been ignored by some compiler
  implementations.

* <javadoc>'s packagelist attribute didn't work.

* the plain mailer would always use port 25 in <mail>.

* Ant's default logger could swallow empty lines.

* ejbjar's iPlanet nested element now can process multiple descriptors.

* IPlanetEjbc was looking in the wrong place for four iiop files.

* <javac> would pass the -source switch to JDK 1.3's javac, even
  though it doesn't support it.

* <zip> and friends would always update existing archive if you set
  the update attribute to true.

* To support backward compatibility with older versions, <pathconvert>
  will once again set the property, even if the result is the empty
  string, unless the new 'setonempty' attribute is set to false|no|off
  (default is "true").

* The manifest task would crash XmlLogger

* A bug existed that prevented generated log files from being deleted as
  part of the build process itself.  This has now been fixed.

* Fixed bug where <move> ignored <filterset>s.

* Ant works properly with the combination of Java1.4/WindowsXP.

* Fixed bug where <java> used to sometimes invoke class constructors twice.

* Fixed bug with 4NT shell support.

* Fixed bug where ant would not perform ftp without remotedir being
  specified even though this was not mandatory.

* Fixed bug where ant would not copy system properties into new Project
  in ant/antcall tasks when inheritall="false" is set.

* <propertyfile> would not close the original property file.

* <ant> will no longer override a subbuild's basedir with inheritall="true".

* Fixed problem with the built-in <junit> formatters which assumed
  that only one test could be running at the same time - this is not
  necessarily true, see junit.extensions.ActiveTestSuite.

* <jar>'s whenEmpty attribute is useless as JARs are never empty, they
  contain at least a manifest file, therefore it will now print a
  warning and do nothing.

* <typedef> hasn't been all that useful as it couldn't be used outside
  of targets (it can now) and nested "unknown" elements have always
  been considered to be tasks (changed as well).

* <fixcrlf> would fail for files that contained lines longer than 8kB.

* Some junit formatters incorrectly assumed that all testcases would
  inherit from junit.framework.TestCase.

* <fixcrlf> dropped the first characters from Mac files.

Other changes:
--------------

* <checksum> now uses a buffer (of configurable size).

* The "Trying to override task definition" warning has been degraded
  to verbose level if the two task definitions only differ in the class
  loader instance that has loaded the definition.

* Add a jvmargs to the ejbjar's weblogic element to allow additional
  arguments to be provided to the VM runnign ejbc. Document the
  jvmdebuglevel attribute which can be used to avoid warnings about
  interface classess being found on the classpath. Document the new
  <sysproperty> element which allows JVM properties to be defined.
  Added an outputdir attribute to allow the destination to be a
  directory into which the exploded jar is written.

* ejbjar now supports Borland Enterprise Server 5 and Jonas 2.5

* added **/.svn and **/.svn/** to the default excludes.

* Selector Elements now provide a way to create filesets based on
  sophisticated selection criteria.

* Gzip and Bzip2 files can now be constructed in the fly when using
  the tar task without having to create the intermediate tar file on
  disk.  The Untar task can also untar GZip and BZip2 files on the fly
  without creating the intermediate tar file.

* New optional type, <classfileset> added.

* <ejbjar> now allows control over which additional classes and interfaces
  are added to the generated EJB jars. A new attribute "dependency" can be
  defined which controls what classes are added. The addition of classes now
  uses the Jakarta-BCEL library rather than reflection, meaning bean classes are
  no longer loaded into Ant's JVM. The default dependency analyzer is known as
  the ancestor analyzer. It provides the same behaviour as the 1.4.1 version of
  <ejbjar>. If the BCEL library is not present, a warning will be issued stating
  the ancestor analyzer is not available. In this case <ejbjar> will continue
  to function but will not add super classes to the jar.

* <available> has a new attribute named ignoreSystemClasses.

* New task <cvschangelog/> generates an XML report of changes that occur
  on CVS repository.

* New filter readers: ClassConstants, ExpandProperties, HeadFilter,
  LineContains, LineContainsRegExp, PrefixLines, ReplaceTokens,
  StripJavaComments, StripLineBreaks, StripLineComments, TabsToSpaces,
  TailFilter.

* <copy>, <loadfile>, <loadproperties>, <move> support FilterChains
  of FilterReaders.

* New task <loadproperties> to load contents of file as Ant properties,
  with nested <filterchain> elements.

* New task <loadfile> to load a whole file into a property.

* New task <echoproperties> to list your current properties to the screen
  or a file.

* New tasks <bzip2> and <bunzip2> to pack and unpack files using the
  BZip2 alogrithm.

* New tasks <replaceregexp>, <checksum>, <translate>, <waitfor>,
  <manifest>, <vsscp>, <vssadd>, <vsscreate>, <splash>, <basename>, <dirname>,
  <concat>, <sourceoffsite>, <jarlib-available>, <jarlib-display>,
  <jarlib-manifest>, <jarlib-resolve>.

* A new combined <mail> task, which replaces the old <mail> and
  <mimemail> tasks, has been added.  The <mimemail> task, and
  old SendEmail and MimeMail classes have been deprecated.

* Mail task allows specification of port number.

* Users can control what <zip> and <jar> must do when duplicate files
  are found.  A new element <zipgroupfileset> allows for multiple zip
  files to be merged into the archive.  In addition, <jar> also has
  another new attribute: filesetmanifest.  The existing manifest
  attribute of <jar> now also accepts the name of a jar added through
  a fileset.

* gzip now checks that the zipfile is older than the source file
  before rebuilding the zipfile.

* TarFileset takes in three new attributes - fullpath, prefix
  and preserveLeadingSlashes.

* <move> attempts to rename the directory, if everything inside it is
  included, before performing file-by-file moves.  This attempt will
  be done only if filtering is off and if mappers are not used.  This
  is a performance improvement and there is no change otherwise in
  the functionality of this task.

* Exec task has extra attribute "resultproperty" to get the return code
  into a property.

* Exec task prints a message when a timed-out process is killed.

* Added optional attributes - name, arch and version to the <os> task.

* Unjar, Untar, Unwar and Unzip now support patternsets to
  select files from an archive for extraction.  Filesets may be
  used to select archived files for unarchival.

* Javac task allows debug levels to be specified.  Debug levels
  will have an effect only when the modern compiler or the
  classic compiler (version 1.2 and higher) is used and debugging
  is enabled.

* Added support for specifying CVS_RSH in the <cvs/> task

* The attributes zipfile, jarfile, warfile and earfile (from the Zip,
  Jar, War and Ear tasks) have been deprecated and superseded by a
  new attribute "destfile".

* Added new conditions <isset>, <checksum>, <http>, <socket>, <contains>,
  <filesmatch>.

* <taskdef> and <typedef> will now emit a warning if a task/type of
  the given name already exists.

* A new revision of VAJ tasks: The most important new feature
  is the ability to execute VAJ tasks from the command line by
  exploiting the Remote Tool Access feature of VAJ.

* Improved support for Novell NetWare.

* Added an optional encoding attribute to <fixcrlf>.

* <apply> has a new attribute relative that allows users to pass the
  filenames as relative instead of absolute paths on the command line.

* References can now be copied into the child build by <ant> and
  <antcall> using nested <reference> elements or the new inheritRefs
  attribute.

* <fail> now supports builds to fail based on conditions via if and
  unless attributes.

* Ant now comes with two new BuildLogger implementations - one that
  can send emails containing a log of the build process (MailLogger),
  and one that colorizes the output based on message levels, using
  ANSI color code escape sequences (AnsiColorLogger).

* A "package" mapper type has been added to allow package directory
  names replaced with the dotted form.

* You can now specify environment variables in the <java> and <junit> tasks
  if the fork attribute has been set to true.

* -propertyfile command-line option has been added to load an entire
  property file just as -D properties are declared (as user properties).
  -D properties take precedence over -propertyfile specified ones.

* You can now set an ANT_ARGS environment variable to hold arguments you
  always want passed to the 'ant' command -- for example, if you always
  want to use a different logger or the -find flag.

* <tstamp> now supports a new "prefix" attribute to prefix properties set.

* You can now specify the -sourcepath for <javac> explicitly.

* <javac> now supports a new "listfiles" attribute to list the source
  files it's handing off to the compiler.

* The compiler implementation for <javac> can now be chosen on a task by
  task basis.  The new "compiler" attribute of <javac> can be used to override
  the value of the build.compiler property, if set.

* <javac> has a new nested element, <compilerarg>, which allows you
  to specify additional args for the specific compiler you're using.

* <javac>'s "source" attribute is now enabled for jikes as well.

* <propertyfile>'s <entry> now has a 'unit' attribute to specify the
  increment/decrement unit on date operations.

* <property> now supports a 'prefix' attribute when loading from a file
  or resource.

* In Ant 1.4, a feature has been added to the <junit> task that would
  add ant.jar, optional.jar and junit.jar implicitly to the classpath -
  this feature can now be disabled by setting the new includeantruntime
  attribute to false.

* <style> behaves differently from any other directory-based task, as it
  processes all files that it finds in included directories in
  addition to the files matched by your patterns.  There is now a new
  attribute, 'scanincludeddirectories', to suppress this behavior.

* <javadoc> now supports a <tag> nested element to provide the -tag option
  to the standard Java 1.4 doclet. The element is ignored when not running
  on Java 1.4.

* <ftp> can now chmod files on a remote server that supports
  "site chmod", as well as set the umask before transferring files, if
  the server supports "site umask".

* New <serverdeploy> "optional" task.

* <patternset> now supports nested patternsets.

* Perforce tasks now support a "failonerror" attribute (defaults to "true").

* Open Source application server JOnAS support:
    EJB hot deploy and deploy with <serverdeploy> and <ejbjar>

* Added new DirSet (<dirset>) datatype.

* <path> now supports nested <dirset> and <filelist> elements.

* <pathconvert> now supports nested <dirset> and <filelist> elements.

* <pathconvert>'s "dirsep" and "pathsep" attributes now accept
  multi-character values.

* <copy> task now has a 'failonerror' attribute to allow keep-going
  behaviour when the file to be copied is not found (defaults to "true").

* <uptodate> now has a 'srcfile' attribute to allow specifying a
  full-path filename.

* <exec>, <sql> and <java> now support append attributes to allow
  appending the output to an existing file.

* <java> now supports a timeout attribute analog to <exec> - it is
  highly recommended to only use it together with fork="true".

* <javadoc> now supports a source attribute to enable javadoc to
  handle assertions present in JDK 1.4 source code.

* <replace> supports a new replacefilterfile attribute that
  automatically turns all properties of a given file into
  replacefilters.

* An alias of <xslt> has been added to refer to the <style> task.

* The compiler implementation for <rmic> can now be chosen on a task by
  task basis.  The new "compiler" attribute of <rmic> can be used to override
  the value of the build.rmic property, if set.

* <rmic> has a new nested element, <compilerarg>, which allows you
  to specify additional args for the specific compiler you're using.

* org.apache.tools.ant.XmlLogger now is a BuildLogger, rather than just
  a BuildListener. It can operate in either mode successfully.

* <junit> has a new attribute "showoutput".  If set to true, output
  generated by tests will be sent to Ant's logging system as well as
  to the formatters (instead of sending it to the formatters
  exclusively).

* Ant has now a pluggable way to prompt users for input, which is used
  by the new <input> task.  IDE integrators can provide an
  implementation of the InputHandler interface to decouple Ant's input
  from the console.  An implementation that gets its input from a file
  for unattended builds is part of Ant's distribution.

  For more details see docs/manual/inputhandler.html.

* <patch> has a new attribute that selects the directory in which to
  run the command.

* <javadoc> now supports two new nested elements, <fileset> and <packageset>.


Changes from Ant 1.4 to Ant 1.4.1
===========================================

Fixed bugs:
-----------

* <ant>'s antfile attribute will now also be considered an absolute path on
  Windows systems, if it starts with a \ and no drive specifier.

* The fullpath attribute of <zipfileset> has been ignored if you used
  the src attribute at the same time.

* The manifest file is now always placed as the second entry (after /META-INF)
  in generated jars. This allows the manifest to be read by JarInputStreams

* Fixed bug in depend task which would fail with a NullPointerException if no
  dependency cache was specified.

* sql task now handles REM statements correctly so that lines starying with rem
  but which are not comments are actually processed.

* XMLLogger now uses the task's name rather than the classname

* <mapper>s will now work as expected if the to pattern expands to an
  absolute pathname.

* <javac> didn't ignore memory settings in non-fork mode

* <cab> didn't split the options attribute into several command line
  arguments correctly.

Other changes:
--------------

* New source attribute for <javac> to enable assertion in JDK 1.4

* XmlLogger and <antstructure> now add an encoding declaration to the
  XML files they generate.

* <fileset> has a new attribute "casesensitive" to make it match
  filenames in a case insensitive way (if you set it to false) - by
  default filesets remain case sensitive.

Changes from Ant 1.3 to Ant 1.4
===========================================

Changes that could break older environments:
--------------------------------------------
* JUnitReport now uses the xalan redirect extension for multi-output.
  With Xalan 1.2.2 it forces the use of bsf.jar in the classpath.
  (Available in the xalan distribution). It is recommended to switch
  to Xalan 2.x that do not need it.

* Zip.setWhenempty() has changed its signature.

* <rmic> is now implemented using a factory. This makes extending
  rmic to use a new compiler a lot easier but may break custom
  versions of this task that rely on the old implementation.

* several Zip methods have changed their signature as we now use a Zip
  package of our own that handles Unix permissions for directories.
  Furthermore <zip> will now use the platform's default character
  encoding for filenames - this is consistent with the command line
  ZIP tools, but causes problems if you try to open them from within
  Java and your filenames contain non US-ASCII characters. Use the new
  encoding attribute of the task and set it to UTF8 to get the old
  behavior.

* The <pvcs> task has been moved to a package of its own.

* JUnitResultFormater has two additional methods that must be
  implemented by custom formatters.

* Ant will no longer use the canonical version of a path internally -
  this may yield different results on filesystems that support
  symbolic links.

* The output generated by the xml formatter for <junit> has changed
  again, it doesn't format the numeric value in the time attribute anymore.

* Pattern matching rules have changes slightly, the pattern foo*
  doesn't match files contained in a directory named foo - use foo/*
  instead.

* <fixcrlf> will not remove trailing whitespace at the end of lines anymore.

* The Classloader usage has been changed for the taskdef, property, available
  and sql tasks so that it delegates to the parent classloader. This may cause
  ClassNotFoundExceptions to be thrown if a system class attempts to load a
  class in the taskdef's classpath (typically factory objects).

* Ant now allows multithreading of tasks and the containment of tasks within
  other tasks. This can break customer listeners which do not expect messages
  from a task before the previous task has finished.

* Ant now installs its own ouput stream into System.out to route output to the
  task currently executing on the current thread. This also means that all
  output is now routed as Ant message events. Customer listeners and loggers
  should not call System.out at any time. This has always been true but such
  usage now will cause problems due to possible recursion.

* Invalid manifest files will now cause build failures in the <jar> task.

* Ant Introspection now looks for methods with method names starting with
  addConfigured. When called these methods are passed an argument after it has
  been configured from the build file. Custom tasks supporting nested elements
  starting with the name configured will no longer function.

* The environment variable JAVACMD that can be used to specify the
  java executable to Ant's wrapper scripts must not contain additional
  command line parameters any longer - please use the environment
  variable ANT_OPTS for such parameters now.

* Ant's wrapper scripts now quote the CLASSPATH environment variable, thus
  supporting classpaths which refer to directories containing spaces. This means
  that the CLASSPATH environment variable cannot have quotes. Any quotes should
  be removed. This will not affect the operation of the CLASSPATH environment
  variable in other contexts.

* A delete task like
  <delete includeEmptyFilesets="true">
    <fileset dir="somedir" />
  </delete>
  will now remove "somedir" as well, unless there are still files left
  in it (matched by the default excludes).

* The copy task will now fail if the file to be copied is not found.

* Ant properties defined in properties files now behave the same way as
  properties defined in the build file. In particular the $ character needs
  to be escaped in property values by doubling it to $$. So, to define a
  property with the value $hello, you need to define it in a properties file
  as
    test.prop=$$hello
  This was not the case in Ant 1.3

Other changes:
--------------

* New tasks: ear, p4counter, record, cvspass, vsscheckin, vsscheckout,
  typedef, sleep, mimemail, set of tasks for Continuus/Synergy, dependset,
  condition, maudit, mmetrics, jpcoverage, jpcovreport, jpcovmerge

* Ant now uses JAXP 1.1

* rmic now supports Kaffe's and Weblogic's version of rmic.

* new magic property build.rmic to chose the rmic implementation

* <tar> will now add empty directories as well

* you can now specify a description for <p4change>

* <touch> can now work on <fileset>s

* <uptodate> now supports a value attribute

* <fail> supports nested text

* <fixcrlf> won't override files that are already in the correct
   format.

* <sql> now supports REM comments as well as // and --

* <jar> now has a nested <metainf> element following the same idea as
  <war>'s <webinf>.

* <pvcs> can now handle multiple projects.

* <available> now has a "type" attribute you can use in conjunction
  with the "file" attribute to specify whether the "file" you're
  looking for is a file or a directory.

* New <junit> formatter named "brief"

* <ejbjar> changes
  * Add support for Borland Application Server to the <ejbjar> task using
    a <borland> nested element.
  * Add support for iPlanet Application Server to the <ejbjar> task. Also
    includes some iPlanet utility tasks
  * Add support for JBoss Application Server to the <ejbjar> task.
  * Add a naming attribute to control the naming scheme that
    ejbjar uses to name the generated EJB jars.
  * Weblogic element now sets the compiler class for EJB 2.0 beans
  * <dtd> elements can be specified at the <ejbjar> level for building generic
    beans
  * <dtd> elements can now be URLs
  * Allow the manifest to be specified for the generated jars
  * The weblogic element now supprts an attribte noEJBC to skip the processing
    of the jar by ejbc. The ejbc step will then occur at deployment
  * weblogic will tell ejbc to use Jikes compiler if build.compiler is set to
    jikes. It can be restored to the default, javac, operation if desired.

* Allow the <sql> Delimiter to be set in the so that Oracle stored procs may be
  entered

* <execon> and <apply> can now optionally skip empty filesets.

* <javadoc> has a new useexternalfile attribute that makes it use a
  temporary file for sourcefile and package names - helps to defeat
  command line length limitations.

* Data types like <path> can now be defined inside of <target>s

* you can now specify a classpath for <style> - the XSLZ processor
  will be loaded from this path

* added a force attribute to <style> to support dependencies that the
  task cannot determine itself (dependency on parameters, not file
  modification times for example)

* added vmlauncher attribute to exec tasks. This defaults to true. If
  it is set to false, the VM's ability to launch commands in bypassed
  and the OS shell, either directly or through the auxillary antRun
  scripts is used.

* regexp mapper now supports the java.util.regex package of JDK 1.4.

* New filesonly attribute for <zip> and friends to suppress directory
  entries.

* New update attribute for <zip> and friends - update an existing
  archive instead of creating a new one.

* <apply> and <execon> have been merged into a single task.

* added vssver.scc to the default excludes

* <available> has a new filepath attribute/nested element that allows
  you top search for a file in a given path.

* <junit> can now optionally set a property on test failure.

* <taskdef> can now define several tasks at once, reading the
  name/classname pairs from a property file or resource.

* <unzip/unjar/unwar> and <untar> now have an overwrite attribute that
  defaults to true.  If set to false, files that are newer than the
  files in the archive will not be replaced.

* <patternset> and <fileset> now support nested <in/excludesfile>
  elements - using these you can have more than one in/excludes file
  per <patternset>.

* Three new supported compilers for javac: kjc for kopi, gcj for the
  gcc frontend and sj for Symantec's compiler.
  In addition extJavac or the new fork attribute can be
  used to run the JDK's javac in a JVM separate from Ant.

* <fixrlf> can now with CR only line-ends and can use an arbitraty
  between 2 and 80.

* The .NET tasks have been adapted to the beta2 release of the framework.

* <move> will now try to rename() files before copying them byte by
  byte - only if filtering is of, of course.

* <ant> and <antcall> tasks now support a new attribute inheritAll. When set to
  false, only user properties are passed through to the target Ant instance.
  This includes properties set on the command line and properties explicitly
  passed

* <javadoc> now skips off line links if the package list cannot be found.

* <wlrun> now allows the security policy file to exist outside the weblogic
  directory.

* <java> task will set the Thread contextClassLoader under JDKs 1.2+ to the
  classloader for the class being executed.

* Introduce the concept of a TaskContainer - a task or element which can contain
  Ant Tasks.

* Add new tasks implementing the TaskContainer interface <parallel> and
  <sequential> which allow parallel execution of tasks to be specified.

* <depend> task will now take into account dependencies on jar files and class
  files from a given classpath.

* <jar> manifest entries may now be specified in the build file either
  completely or to be merged with a manifest file.

* <tstamp> task custom formats now support locales.

* Added a listner which will forward events to Log4J. The log4j configuration
  file should be in the directory from which Ant is run or passed as a system
  property using a JVM argument.

* Introduced the concept of <filtersets> to allow for more control in which
  filters get applied in a <copy> or <move> operation.

* Added nowarn attribute to javac and deprecated the Jikes-magic property
  build.compiler.warnings.

* The <depend> task cache format has changed and all dependency information is
  now stored in a single file.

Fixed bugs:
-----------

* Testcases have been made independent of current working directory.

* Input ZIP-Files will be closed when using a <zipfileset>.

* p4 tasks now don't fail if user, port or client have been omitted
  (and this is acceptable for the context of the command).

* <javah>'s outputfile attribute will be resolved as relative to the
  projects basedir.

* <antstructure> should create a valid DTD for propertyfile.operation.entry
  and omit tasks it fails to load.

* won't try to pass a -bootclasspath flag to javac 1.1 anymore

* <style>'s style attribute no handles absolute paths correctly.

* <delete includeemptydirs="true"> now deletes more than just the leaf
  directories.

* You can now specify a <fileset> for a directory that doesn't exist at
  declaration time but will created before the fileset gets used for the
  first time.

* If the quiet attribute has been set, <delete> will handle <fileset>s
  with non-existing directories gracefully.

* Output written by testcases will now be captured by the <junit> task
  and passed to the formatters.

* Quote the -group parameter to Javadoc as per the specification

* Initialise classes when loaded through the AntClassLoader - that is, run
  static initializers

* Implement getResource() and getResources() in AntClassLoader

* Create the <ejbjar> weblogic command line as a set of arguments rather than
  as a single line. Avoids problems with paths which contain spaces.

* <ejbjar> now fails when the weblogic ejbc compiler reports an error.

* Make the AntClassLoader load resources in the same order as it currently
  loads classes.

* Handle classpaths with spaces

* Make sure XSLT processors close their output files in <style>.

* perform proper uptodate check in <rmic> when compiling for IIOP.

* <jjtree>'s uptodate test works even if outputdirectory is not the
  parent dir of target

* <copy> will remove target file (if it exists) before writing to it -
  this avoids problems with links on filesystems that support them.

* <ftp> now properly recurses remote directories.

* <ftp> closes remote connection when it's done.

* <junit> tries to include all necessary classes for the task itself
  to the classpath when running in fork mode - doesn't work for JDK 1.1

* <apply> and <execon> do now execute the command only once, if you
  specify the parallel attribute - instead of once per fileset.

* directory based tasks and fileset could miss some included files in
  directories that have been excluded

* <fixcrlf> failed for large files.

* <move> removed files you tried to move to themselves.

* <sql> task will not trty to print the result set unless the query succeeded.

* Ant classloader will now ignore paths which are invalid relative to the
  project base

* <ejbjar> weblogic elements check for jar file changes has been fixed.
  Previously some changes would not be included.

* properties loaded from properties files are now resolved internally. This
  removes the spurious warnings about usage of properties which have not been
  set.

* <jar> task and friends now process the JAR manifest to ensure it is valid.

* The task finished event now includes any exception thrown by the task.

* <java> task now supports a jvmVersion attribute so that if another JVM is
  being used, Ant can determine which options to use for features such as the
  VM memory limits


Changes from Ant 1.2 to Ant 1.3
===========================================

Changes that could break older environments:
--------------------------------------------

* Ant doesn't search for the buildfile anymore, unless you use the new
  -find argument.

* <perforce> has been replaced by a number of new tasks.

* <javac> is now implemented using a factory. This makes extending
  javac to use a new compiler a lot easier but may break custom
  versions of this task that rely on the old implementation.

* The output generated by the xml formatter for <junit> has changed a
  little, it doesn't append " sec" in the time attribute anymore.

Other changes:
--------------

* A GUI Frontend: Antidote. This is currently in development. At this
  time, this is not part of the Ant release, although the source is
  included if you are interested.

* New tasks: stylebook, propertyfile, depend, antlr, telnet, csc,
  ilasm, apply, javah, several clearcase tasks, junitreport, sound

* Added output attribute to <java>.

* Added nested zipfileset element to <zip>

* Changed <sql> so that printing is at the task level rather than
  the statement level.

* javadoc task will pass -d flag to any doclet if the destDir attribute is
  given. If the doclet does not accept the -d flag then omit the destdir
  attribute.

* <cab> can work on non-Windows platforms with the help of libcabinet.
  See http://trill.cis.fordham.edu/~barbacha/cabinet_library/.

* <ftp> now supports passive mode.

* New <mapper> data type that can be used to get influence on the
  target files for some tasks like <copy> or enable new types of tasks
  like <apply>.

* <execon> provides more control over the command line now, the names
  of the source files are no longer required to be at the end of the
  command.

* Style tasks will now support TraX compliant XSL processors if one is present
  in your classpath.

* Added a failonerror to the javac task. If set to false, the build will
  continue even if there are compilation errors.

* Added nested format elements to the tstamp task allowing additional time
  formats to be defined for arbitrary properties.

* Added classpath attribute and nested classpath element to <property>
  to make the resource attribute more powerful.

* ${} property expansion will now be performed on the patterns read
  from files specified as includesfile or excludesfile attributes.

* The <tar> and <untar> tasks now support GNU format for handling paths
  which are greater than 100 characters in length. In addition the <tar>
  task now supports nested filesets through which the file permissions
  may be controlled.

* wlrun, wlstop and ejbjar now support Weblogic 6.0

* The MPasre task has been updated to work with MParse 2.0

* The documentation has been significantly updated.


Fixed bugs:
-----------

* <signjar> no longer uses deprecated methods.

* javadoc's failonerror attribute works again

* javadoc's additionalparam attribute will now be split into separate
  parameters (on spaces) to allow for more than one parameter.

* Changed <sql> task so that printing result sets works on Oracle

* Changes to ddcreator and ejbc helper to respect the descriptor hierarchy
  keppgenerated in ejbc can now be turned off

* ejbjar now correctly ignores <ejb-ref> elements in the deployment descriptor.
  CMP files are included by parsing the weblogic deployment descriptor rather
  than relying on the naming convention used in ant 1.2

* ejbjar includes super classes and super interfaces into the generated ejb
  jar files. The <support> nested element allows support classes to be
  included in the EJB jar. The toplink element should now correctly locate
  the toplink descriptor.

* <vssget> now correctly deals with spaces in arguments

* <jar> fails early if a given manifest file doesn't exist

* <rmic> doesn't search for the _Skel file anymore when stubversion is
  set to 1.2.

* <rmic> uses the the same classpath to verify a class can be rmic'd
  as it passes to the compiler.

* org.apache.tools.mail.MailMessage (and therefore <mail>) can now
  handle SMTP servers sending multi line responses.

* nested <classpath> elements of <taskdef> now work for <taskdef>s not
  nested into <target> as well.

* <property> and <available> will search for the resource "foo" instead
  of "/org/apache/tools/ant/taskdefs/foo" when given a relative resource
  name foo.

* Handle build files in directories whose name contained a "#" character

* <junit> can now log to files whose name contains a comma as well.

* The AntClassLoader now refers to the loader which loaded it, any
  requests it does not handle itself. Previously these went to the
  primordial loader.

Changes from Ant 1.1 to Ant 1.2
===============================

Changes that could break older environments:
--------------------------------------------

* Semantics of <property> has changed again in the hope to be more
  intuitive. ${} expansion now happens at runtime and <property> tags
  living inside of targets only take effect if they are visited at
  runtime.

  As a side effect of this change, task's attributes get set at runtime
  not at parser time as well, which might change the results of
  <script>s or other custom tasks that reference other tasks by their id
  attribute.

* copying of support files in <javac> has been removed - as well as
  the filtering attribute.

* the <expand> and <keysubst> tasks have been removed.

* the ignore and items attributes of directory based tasks have been removed.

* the command line switches _not_ starting with - have been removed.

* Path and EnumeratedAttribute have been moved from
  org.apache.tools.ant to org.apache.tools.ant.types.

* the class attributes of <available>, <java>, <rmic> and <taskdef>
  have been removed.

* the src attribute of <chmod> has been removed.

* <patch> and <javadoc> have lost some of their attributes.

* <java> and <cvs> have lost some undocumented attributes.

* the Unix antRun script would search for command.sh in the directory
  it changed to and invoke this instead of command if present. This
  behavior has been dropped.

* <ejbjar> task syntax has been changed significantly

* <exec> is no longer implemented by org.apache.tool.ant.taskdefs.Exec.
  Custom tasks that rely on Project.createTask("exec") to return an
  instance of this class are going to fail.

* nested <include> and <exclude> elements expect the value of their
  name attribute to be a single pattern, they don't accept multiple
  patterns anymore. Split them into multiple elements of the same type.

* <delete dir="somedir" /> will now delete the directory itself as
  well as all included files. If you just want to clean out the
  directory and keep the empty one, use a nested fileset.

Other changes:
--------------

* New tasks: antstructure, cab, execon, fail, ftp, genkey, jlink,
  junit, sql, javacc, jjtree, starteam, war, unwar, uptodate,
  native2ascii, copy, move, mparse.

* copydir, copyfile, deltree and rename are now deprecated. They
  should be replaced with the new copy, delete and move tasks.

* <java> uses a ClassLoader of its own in no-fork mode if a classpath is
  specified.

* <style> will create the necessary target directories and reprocess
  all files if the stylesheet changes.

* New data types fileset and patternset - expected to get a broader use.
  They, as well as PATH like structures, can now be defined on a global
  level and later be referenced by their id attribute.

* You can specify environment variables to <exec>.

* <get> can check whether a remote file is actually newer than a local
  copy before it starts a download (HTTP only).

* Added a -logger option to allow the class which performs logging to be
  specified on the command line.

* Added a -emacs option to tell the logger to leave out taskname adornments
  on log output.

* <chmod> works on all files in parallel and supports multiple filesets.

* <replace> can now use tokens and/or values that cross line boundaries.

* build.compiler supports now jvc as well.

* project specific help can now be obtained with the -projecthelp option.

* Added a -debug option to make -verbose less verbose (and more useful)

* Ant will now search for a file named build.xml in the parent directory
  and above (towards the root of the filesystem) if you didn't specify
  -buildfile and there is no build.xml in the current directory.

* <echo> can now write to a file and accepts nested text.

Fixed bugs:
-----------

* <chmod> didn't work when used as a directory based task.

* Path, Available, Property didn't resolve relative filenames with
  respect to the Project's basedir.

* Project didn't interpret the basedir attribute correctly in all
  cases.

* Nested <src> in <javac> caused NullPointerException.

* Corrupt Zip- and Jar-files ar now deleted if the task fails.

* many more fixes we've forgotten to document here ...

* The packagelistloc attribute of <javadoc>'s <link> child will be
  resolved as a file (i.e. it is either absolute or relative to
  basedir).
