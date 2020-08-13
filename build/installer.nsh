!macro customHeader
    !system "echo '' > ${BUILD_RESOURCES_DIR}/customHeader"
!macroend

!macro preInit
    ; This macro is inserted at the beginning of the NSIS .OnInit callback
    !system "echo '' > ${BUILD_RESOURCES_DIR}/preInit"
!macroend

!macro customInit
    !system "echo '' > ${BUILD_RESOURCES_DIR}/customInit"
!macroend

!macro customInstall
    !system "echo '' > ${BUILD_RESOURCES_DIR}/customInstall"

    DetailPrint "Register My AppName URI Handler"
    DeleteRegKey HKCR "My AppName"
    WriteRegStr HKCR "My AppName" "" "URL:My AppName"
    WriteRegStr HKCR "My AppName" "URL Protocol" ""
    WriteRegStr HKCR "My AppName" "EveHQ NG SSO authentication Protocol" ""
    WriteRegStr HKCR "My AppName\DefaultIcon" "" "$INSTDIR\${APP_EXECUTABLE_FILENAME}"
    WriteRegStr HKCR "My AppName\shell" "" ""
    WriteRegStr HKCR "My AppName\shell\Open" "" ""
    WriteRegStr HKCR "My AppName\shell\Open\command" "" "$INSTDIR\${APP_EXECUTABLE_FILENAME} %1"
!macroend

!macro customInstallMode
    # set $isForceMachineInstall or $isForceCurrentInstall
    # to enforce one or the other modes.
!macroend
