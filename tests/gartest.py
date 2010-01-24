# $Id$

import Cheetah.Template
import shutil
import tempfile
import unittest
import os
import os.path
import subprocess
import opencsw

"""A module used to do end-to-end testing of GAR."""

MAKEFILE_TMPL = """# GAR Makefile generated by $test_id
#
GARNAME = $garname
GARVERSION = $garversion
CATEGORIES = $profile
DESCRIPTION = $description
#if $blurb
define BLURB
  blurb
endef
#end if
#if $upstream_url
SPKG_SOURCEURL = $upstream_url
#end if
#if $master_sites
MASTER_SITES = $master_sites
#end if
## PATCHFILES =
## DISTFILES  = $(GARNAME)-$(GARVERSION).tar.gz
## UFILES_REGEX = $(GARNAME)-(\d+(?:\.\d+)*).tar.gz
## CATALOGNAME =
## ARCHALL = 0
## PACKAGES =
CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
INSTALL_SCRIPTS =
TEST_SCRIPTS =
#if $configure_args
CONFIGURE_ARGS = $configure_args
#end if
## BUILD64 =
include gar/category.mk
#if $install_files
post-install-modulated:
#for filedir_name, directory, file_name, content in $install_files
\tginstall -m 755 -d \$(DESTDIR)$directory
\tginstall -m 644 $tmpdir/\$(FILEDIR)/$filedir_name \$(DESTDIR)$directory/$file_name
#end for
#end if
# GAR recipe ends here.
"""
TMPDIR_PREFIX = "garpkg"
DIR_PKG_OUT_DIR = "/home/maciej/spool.5.8-sparc"

class Error(Exception):
  pass

class GarBuild(object):
  """Represents a GAR build.

  Can create a GAR build and execute it.
  """
  def __init__(self):
    self.tmpdir = tempfile.mkdtemp(prefix=TMPDIR_PREFIX)
    self.filedir = os.path.join(self.tmpdir, "files")
    self.makefile_filename = os.path.join(self.tmpdir, "Makefile")
    os.mkdir(self.filedir)
    self.install_files = []
    self.built = False
    self.tmpldata = {
        "garname": "testbuild",
        "garsrc": "/home/maciej/src/opencsw/gar/v2-dirpackage",
        "blurb": None,
        "description": u"A test package from %s" % self,
        "profile": "lib",
        "configure_args": "$(DIRPATHS)",
        "upstream_url": "http://www.opencsw.org/",
        "master_sites": None,
        "install_files": self.install_files,
        "garversion": "0.0.1",
        "tmpdir": self.tmpdir,
        "test_id": "$Id$",
    }
    os.symlink(self.tmpldata["garsrc"], os.path.join(self.tmpdir, "gar"))

  def WriteGarFiles(self):
    # print "The tmpdir is", self.tmpdir
    for filedir_name, directory, filename, content in self.install_files:
    	file_path = os.path.join(self.filedir, filedir_name)
    	print "Writing to %s" % file_path
    	fp = open(file_path, "w")
    	fp.write(content)
    	fp.close()
    searchlist = [self.tmpldata]
    t = Cheetah.Template.Template(MAKEFILE_TMPL, searchlist)
    print t
    fp = open(self.makefile_filename, "w")
    fp.write(str(t))
    fp.close()

  def Build(self):
    if self.built:
    	return 0
    args = ["gmake", "dirpackage"]
    gar_proc = subprocess.Popen(args, cwd=self.tmpdir,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
    stdout, stderr = gar_proc.communicate()
    ret = gar_proc.wait()
    if ret:
      print "ERROR: GAR run has failed."
      self.built = False
    else:
    	self.built = True
    return ret

  def GetBuiltPackages(self):
    if not self.built:
    	raise Error("The packages have not been built yet.")
    args = ["gmake", "pkglist"]
    gar_proc = subprocess.Popen(args, cwd=self.tmpdir, stdout=subprocess.PIPE)
    stdout, stderr = gar_proc.communicate()
    ret = gar_proc.wait()
    pkglist = []
    for line in stdout.splitlines():
    	# directory, catalogname, pkgname
    	pkglist.append(tuple(line.split("\t")))
    packages = [opencsw.DirectoryFormatPackage(os.path.join(DIR_PKG_OUT_DIR, z)) for x, y, z in pkglist]
    return packages

  def AddInstallFile(self, file_path, content):
    filedir_name = file_path.replace("/", "-")
    directory, file_name = os.path.split(file_path)
    self.install_files.append((filedir_name, directory,
                               file_name, content))

  def __del__(self):
    shutil.rmtree(self.tmpdir)


class FooUnitTest(unittest.TestCase):
  """This is the docstring for the FooUnitTest."""

  def testSomething(self):
    """This is a doc string for the test method.
    
    You can write more text here.
    """
    mybuild = GarBuild()
    mybuild.tmpldata["garname"] = "blah"
    mybuild.AddInstallFile("/opt/csw/share/foo", "bar!\n")
    mybuild.WriteGarFiles()
    self.assertEquals(0, mybuild.Build())
    packages = mybuild.GetBuiltPackages()
    for pkg in packages:
    	print pkg
    	print pkg.GetParsedPkginfo()
    # package = mybuild.GetFirstDirFormatPackage()
    # self.assertEqual("blah", package.catalogname)


if __name__ == '__main__':
  unittest.main()

# vim:set ts=2 sts=2 sw=2 expandtab:
