@echo off
REM Monster Train daily refresh
REM Add to Windows Task Scheduler to run once a day

call C:\Users\chand\anaconda3\Scripts\activate.bat
python "c:\Machine Learning Projects\Monster Train\scripts\refresh.py"
