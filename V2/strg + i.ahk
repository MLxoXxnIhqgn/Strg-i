#SingleInstance Force
#Requires AutoHotkey v2.0
SetKeyDelay 0
SetWorkingDir A_InitialWorkingDir

path := A_InitialWorkingDir "\setup.txt"
if (not FileExist(path))
{
    MsgBox "Die Datei ist nicht existent!!!!"
    Name := InputBox("Please enter deinen Namen", "name",)
    AKennung := InputBox("Please enter deinen AKennung", "akennung",)
    EMail := InputBox("Please enter deinen EMail", "email",)
    FileAppend "Dein Namens Wert:`n" Name.Value "`nDein AKennungs Wert:`n" AKennung.Value "`nDein EMail Wert:`n" EMail.Value, path
}

else
{
    MsgBox "Die Datei!!! Die Datei ist real!!!!"
}

einlesen() {
    Global userVariablen := Array()
    Global i := 1
MeinText := FileRead(path)
Loop parse, MeinText, "`n", "`r"  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.

    {
        
        if (Mod(A_Index, 2) == 0){
            if (A_LoopField == ""){
                MsgBox "Die Datei ist nicht korrekt gefüllt, bitte bearbeite die Setup.txt Datei auf deimen Desktop manuell oder lösche sie, das Skrit beendet sich nun selbst"
                ExitApp
            }
            userVariablen.push "" ; Index wird erst direkt vor Gebrauch erstellt
            userVariablen[i] := A_LoopField
            i++
        }   continue
    }
}

einlesen.Call()

now()
    {
        Datum := FormatTime(,"dd.MM.yyyy")
        Uhr := FormatTime(,"hh:mm")
        GesamtUhr := " " Uhr " Uhr " Datum
        return GesamtUhr
    }

Hinzufügen(*)
    {
        if (userVariablen.Length <= 8)

        {
        EigenerText := InputBox("Please enter deinen deinen Wunschtext", "wunschtext",)
            if (EigenerText.Result = "OK"){
                FileAppend "`n" i ". Eintrag - Dein eigener Wert:`n" EigenerText.Value, path
                einlesen.Call()
            }
        }
        else
        {
        MsgBox "9 von 9 Variablen sind schon voll"
        MsgBox userVariablen.Length
        }

    }

Bearbeiten(*)
    {
        BearbeitungsGui := Gui()
        BearbeitungsGui.Add("ListBox", "r5 vColorChoice", userVariablen)
        BearbeitungsGui.Show
        einlesen.Call()
    }
^i:: ;Eine zentrale Übersicht der Tastenkürzel

{
    InformationGui := Gui()
    InformationGui.Add("Text",, "--- DU HAST BIS ZU 9 SHORTCUTS ---`n`nDie ersten 4 sind festgelegt.`nDu Kannst den Text aller Shortcuts in der Setup.txt Datei ändern.`nAb Key 5 Kannst du dir deine eigenen Texte aussuchen.")
    InformationGui.Add("Text",, "1. Funktion:`nstrg + 1 | Signatur")
    InformationGui.Add("Text",, "2. Funktion:`nstrg + 2 | Kunde nicht erreichbar + Signatur")
    InformationGui.Add("Text",, "3. Funktion:`nstrg + 3 | Deine E-Mail Adresse")
    InformationGui.Add("Text",, "4. Funktion:`nstrg + 4 | Deine AKennung`n")

    Add := InformationGui.Add("Button", "Default w80", "Ergänz deine Variablen")
    Add.OnEvent("Click", Hinzufügen)  ; Call Add when clicked.

    Edit := InformationGui.Add("Button", "Default w80", "Änder deine Variablen")
    Edit.OnEvent("Click", Bearbeiten)  ; Call Bearbeiten when clicked.
    InformationGui.Show
}

^1::
{
    Send " - " userVariablen[1] now.Call()
}
^2::
{
    send "Kunde nicht erreicht - " 
    userVariablen[1] now.Call()
}
^3::
{
    ;send userVariablen[3]
    send userVariablen.Length

}
^4::
{
    send userVariablen[2]
}
^5::
{
    send userVariablen[4]
}
^6::
{
    send userVariablen[5]
}
^7::
{
    send userVariablen[6]
}
^8::
{
    send userVariablen[7]
}
^9::
{
    send userVariablen[8]
}