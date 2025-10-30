' ============================================
' Calendario CAU SES-SGS - Detener Aplicación
' ============================================
' Este script detiene el servidor de desarrollo de forma silenciosa
' ============================================

Set objShell = CreateObject("WScript.Shell")
Set objWMI = GetObject("winmgmts:\\.\root\cimv2")

' Buscar todos los procesos de node.exe
Set colProcesses = objWMI.ExecQuery("Select * from Win32_Process Where Name = 'node.exe'")

intCount = 0
For Each objProcess in colProcesses
    ' Intentar terminar el proceso
    objProcess.Terminate()
    intCount = intCount + 1
Next

' Mostrar mensaje de confirmación
If intCount > 0 Then
    MsgBox "Calendario CAU SES-SGS detenido correctamente." & vbCrLf & _
           "Procesos finalizados: " & intCount, _
           vbInformation, "Calendario Detenido"
Else
    MsgBox "No se encontraron procesos activos del Calendario.", _
           vbInformation, "Calendario CAU SES-SGS"
End If
