""" Customize Python Interpreter.

Link your user customizing file to this file.

For more info see: https://docs.python.org/3/library/site.html

"Default value is ~/.local/lib/pythonX.Y/site-packages for UNIX and
non-framework Mac OS X builds, ~/Library/Python/X.Y/lib/python/site-packages
for Mac framework builds, and %APPDATA%\Python\PythonXY\site-packages on
Windows."

Sun May  4 18:06:08 CST 2014
"""

import cgitb
import sys
import os
import os.path

cgitb.enable(format='text')

sys.path.insert(0, os.path.join(os.environ['HOME'],
        'gtk/inst/lib/python2.7/site-packages'))
sys.path.append(os.path.join(os.environ['HOME'],
        'programming/py3k'))
