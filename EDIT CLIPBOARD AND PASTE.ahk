/********** Set times for Sleep **********/
sl1 := 100
sl2 := 1000
/********** Set times for Sleep(END) **********/

/********** Set Array of positions [["POSITION FOR START", "TYPE OF FUNCTION"], ["POSITION FOR END", "TYPE OF FUNCTION"]] **********/
pos_text_arr := [                                                                                           
    [["\d\d\d\.\d\d.\d\d", "RegExMatch__"], ["[1080", "String__"]],
    [["\d\d\d\.\d\d.\d\d", "RegExMatch__"], [10, "Position_integer__"]],
]         
/********** Set Array of positions [["POSITION FOR START", "TYPE OF FUNCTION"], ["POSITION FOR END", "TYPE OF FUNCTION"]] (END) **********/

pos_text_arr__selected := pos_text_arr[2]                                                                   ; Select SUBarray(JUST ONE) for cutting                    

editSubStringsArr := [                                                                                      ; Replace other Substrings (array)
                        ["2020", "20"],
                        [" - ", "."],
                        [" 3 ", ""],
                        [" ", "."]
]                                                                              
editSubStringsKeysArr := [1]                                                                                ; Select SUBarrayS(ONE OR MORE) for single replacing  (keys of 'editSubStringsArr')


Send "^+c"                                                                                                  ; Copy Path of File name
Sleep sl2
Start_string := A_Clipboard                                                                                 ; Get Clipboard data


/********** REMOVE PREFFIX **********/
if(InStr(pos_text_arr__selected[1][2], "RegExMatch__")){                                                    ; If start position(substring) is Regular Extension
    substr__start_pos := RegExMatch(Start_string,pos_text_arr__selected[1][1])                              ; Get start position of file name (integer)
    str_without_prefix := SubStr(Start_string, substr__start_pos-1)                                         ; Remove Noneeded prefix  
}
/********** REMOVE PREFFIX(END) **********/


/********** REMOVE SUFFIX(END) **********/
if(InStr(pos_text_arr__selected[2][2], "Position_integer__")){                                              ; If end position(substring) is Integer position
    str_without_suffix := SubStr(str_without_prefix, 1, pos_text_arr__selected[2][1])                       ; Get substring without suffix
}               
/********** REMOVE SUFFIX(END) **********/


/********** Replace single parts of substring **********/
if(editSubStringsKeysArr.length > 0){
    i := 0
    loop editSubStringsKeysArr.length{
        i++
        what_replace := editSubStringsArr[editSubStringsKeysArr[i]][1]
        to_what_replace := editSubStringsArr[editSubStringsKeysArr[i]][2]
        str_without_suffix := StrReplace(str_without_suffix, what_replace, to_what_replace)
    }
}
/********** Replace single parts of substring(END) **********/


A_Clipboard := str_without_suffix                                                                                 ; !!! SET FINAL SUBSTRING !!!


/********** Paste File name **********/
Sleep sl1
Send "!{Tab}"
Sleep sl1
Send "^f"
Sleep sl1
Send "^a"
Sleep sl1
Send "^v"
/********** Paste File name(END) **********/


Send "+{Tab}"
Sleep sl1
Send "+{Tab}"
Sleep sl1
Send "+{Tab}"
Sleep sl1
Send "+{Tab}"
Sleep sl1
Send "{Up}"
Sleep sl1
Send "{Down}"
Sleep sl1
Send "{Space}"

