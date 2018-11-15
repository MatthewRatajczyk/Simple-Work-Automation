import os
import sys
from cx_Freeze import setup, Executable


PYTHON_INSTALL_DIR = os.path.dirname(os.path.dirname(os.__file__))
os.environ['TCL_LIBRARY'] = os.path.join(PYTHON_INSTALL_DIR, 'tcl', 'tcl8.6')
os.environ['TK_LIBRARY'] = os.path.join(PYTHON_INSTALL_DIR, 'tcl', 'tk8.6')


base = None
if sys.platform == 'win32':
    base = 'Win32GUI'

syspath = r"C:\Users\Ratajczyk\AppData\Local\Programs\Python\Python36-32/DLLs"

buildOptions = dict(
    packages=["pandas","numpy", "numpy.core._methods","xlrd","xlsxwriter"],
    excludes=[],
    include_files=[syspath + '/tcl86t.dll', syspath + '/tk86t.dll']
)

executables = [
    Executable('AutomateReports.py', base=base)
    
]

setup(name='XGen',
      version='0.1',
      options=dict(build_exe=buildOptions),
      description='XGen',
      executables=executables
      )