@echo off
set journal_file="%USERPROFILE%\Google Drive\my.journal.gpg"
set new_codepage=65001
rem Captures the output of the `chcp' command.
for /f "tokens=* usebackq" %%a in (`chcp`) do (
  set chcp_output=%%a
)
rem Splits the output, iterates through parts and saves the last.
for %%a in (%chcp_output%) do (
  set old_codepage=%%a
)
rem Switches to Unicode, decrypts the journal, pass it to hledger
rem then restores old codepage (even if previous commands failed).
chcp %new_codepage% >nul 2>nul ^
  && gpg --decrypt %journal_file% 2> nul ^
  | hledger -f- %* ^
  & chcp %old_codepage% >nul 2>nul