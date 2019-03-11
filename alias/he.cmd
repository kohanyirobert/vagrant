@echo off
set encrypted_timedot="%USERPROFILE%\Google Drive\my.timedot.gpg"
set encrypted_todotxt="%USERPROFILE%\Google Drive\todo.txt.gpg"
set encrypted_journal="%USERPROFILE%\Google Drive\my.journal.gpg"
vim %encrypted_timedot% %encrypted_todotxt% %encrypted_journal%
