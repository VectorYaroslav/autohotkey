sl1 := 100
sl2 := 1000

Send "^+c"
Sleep sl2
fullName := StrSplit(A_Clipboard, "\")[7]
cutName := StrSplit(fullName, "[")[1]
A_Clipboard:= cutName
Sleep sl2

Send "!{Tab}"
Sleep sl1
Send "^f"
Sleep sl1
Send "^a"
Sleep sl1
Send "^v"
Sleep sl1
Loop 4{
    Send "+{Tab}"
    Sleep sl1
}
Send "{Up}"
Sleep sl1
Send "{Down}"
Sleep sl1
Send "{Space}"
Sleep sl1
Send "!{Tab}"











