' ============================================
' Calendario CAU SES-SGS - Launcher Silencioso
' ============================================
' Este script inicia la aplicación sin mostrar ventanas de terminal
' Autor: Sistema de Calendario CAU
' ============================================

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Obtener la ruta del directorio actual (donde está el script)
strScriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Cambiar al directorio del proyecto
objShell.CurrentDirectory = strScriptPath

' Verificar si node_modules existe (primera ejecución)
If Not objFSO.FolderExists(strScriptPath & "\node_modules") Then
    ' Mostrar mensaje de instalación inicial
    MsgBox "Primera ejecución detectada." & vbCrLf & vbCrLf & _
           "Instalando dependencias..." & vbCrLf & _
           "Esto puede tardar unos minutos.", _
           vbInformation, "Calendario CAU SES-SGS"

    ' Instalar dependencias (esto sí mostrará una ventana temporalmente)
    objShell.Run "cmd /c npm install", 1, True
End If

' Iniciar el servidor de desarrollo en modo oculto
objShell.Run "cmd /c npm start", 0, False

' Esperar 8 segundos para que el servidor inicie (Parcel tarda más)
WScript.Sleep 8000

' Abrir el navegador
objShell.Run "http://localhost:1234"

' Mostrar notificación de que la app está corriendo
MsgBox "¡Calendario CAU SES-SGS iniciado!" & vbCrLf & vbCrLf & _
       "La aplicación se está abriendo en tu navegador." & vbCrLf & vbCrLf & _
       "URL: http://localhost:1234" & vbCrLf & vbCrLf & _
       "Para cerrar la aplicación, usa el Task Manager" & vbCrLf & _
       "y finaliza el proceso 'node.exe'", _
       vbInformation, "Calendario CAU SES-SGS"
