#Requires AutoHotkey v2.0

Result := MsgBox("Would you like to ShutDown PC? (press Yes or No)",, "YesNo")
if Result = "Yes"
    Shutdown 1