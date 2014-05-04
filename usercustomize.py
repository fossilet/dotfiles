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
cgitb.enable(format='text')
