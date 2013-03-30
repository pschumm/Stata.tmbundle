#!/usr/bin/env python
# Allow user to locate Stata application, and write bundle identifier to
# TextMate preferences

import os
import subprocess
import plistlib
import StringIO
from Foundation import NSBundle

dialog_cmd = [os.environ['DIALOG'],'filepanel',
              '--title','Locate Stata Application',
              '--prompt','Use With TextMate',
              '--message','Please locate the Stata application you wish to use with TextMate',
              '--defaultDirectory','/Applications',
              '--allowsMultipleSelection','0',
              '--canChooseDirectories','0',
              '--allowedFileTypes','app']

plist = subprocess.check_output(dialog_cmd)
app = plistlib.readPlist(StringIO.StringIO(plist))
path = app.get('path')

if path:
    bundle_id = NSBundle.bundleWithPath_(path).bundleIdentifier()
    subprocess.call(['defaults','write','%s' % (os.environ['TM_APP_IDENTIFIER'],),
                     'stataBundleIdentifier',bundle_id])
    print(bundle_id)
