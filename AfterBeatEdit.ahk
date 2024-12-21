#Requires AutoHotkey v2.0

global toggle := false  ; Initialize the toggle variable as global

; Define the hotkey to start the process: Windows key + Minus
#-::
{
    global toggle  ; Declare toggle as global inside the hotkey block
    toggle := true  ; Set toggle to true when starting
    SetTimer(EditMarkers, 10)  ; Start a timer that triggers the EditMarkers function every 10 milliseconds
    return
}

; Define the hotkey to stop the process: Windows key + O
#o::
{
    global toggle  ; Declare toggle as global inside the hotkey block
    toggle := false  ; Set toggle to false when stopping
    SetTimer(EditMarkers, 0)  ; Stop the timer by setting its interval to 0
    return
}

EditMarkers()  ; Define the function to handle the marker editing
{
    Send("^+k")  ; Send Ctrl + Shift + K to add edit to all tracks
    Sleep(100)  ; Wait for 100 milliseconds
    Send("^+m")  ; Send Ctrl + Shift + M to go to previous marker
    Sleep(200)  ; Wait for 200 milliseconds
}

; Define the hotkey to terminate the script safely: Escape
Escape::
{
    ExitApp  ; Exits the script when the Escape key is pressed
}
