; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SyncRom"
#define MyAppVersion "1.0.0"
#define MyAppExeName "SyncRom.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B5520FEE-720D-4111-A612-5F280FFC8F74}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
AllowNoIcons=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename=SyncRomInstaller-{#MyAppVersion}
SetupIconFile=D:\ProjetDev\SyncRom\src\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\ProjetDev\SyncRom\out\SyncRom-{#MyAppVersion}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\ProjetDev\SyncRom\out\SyncRom-{#MyAppVersion}\config.json"; DestDir: "{app}"; Flags: onlyifdoesntexist; AfterInstall: setupVersion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure setupVersion;
var
  FileName: String;
  FileLines: TStringList;
begin
  FileName := ExpandConstant('{app}') + '\config.json';
  FileLines := TStringList.Create;
  try
    FileLines.LoadFromFile(FileName);
    FileLines[1] := '    "version":  "{#MyAppVersion}",';
    FileLines.SaveToFile(FileName);
  finally
    FileLines.Free;
  end;
end;

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

