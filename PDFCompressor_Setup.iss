[Setup]
AppId={{D37D5620-1C71-4E6C-9A52-87B5673E0C1F}
AppName=PDF Compressor Pro
AppVersion=2.0.0
AppPublisher=PDFCompressor
UninstallDisplayName=PDF Compressor Pro
DefaultDirName={userpf}\PDFCompressor
DefaultGroupName=PDF Compressor Pro
DisableProgramGroupPage=yes
OutputDir=d:\winstore projects\PDFCompressor
OutputBaseFilename=PDFCompressor_Setup_v2.0
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
SetupIconFile=Assets\app_icon.ico
ChangesAssociations=yes
UninstallDisplayIcon={app}\PDFCompressor.exe
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "d:\winstore projects\PDFCompressor\bin\Release\net8.0-windows10.0.19041.0\win-x64\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\PDF Compressor Pro"; Filename: "{app}\PDFCompressor.exe"; IconFilename: "{app}\PDFCompressor.exe"; IconIndex: 0
Name: "{autodesktop}\PDF Compressor Pro"; Filename: "{app}\PDFCompressor.exe"; IconFilename: "{app}\PDFCompressor.exe"; IconIndex: 0; Tasks: desktopicon

[Run]
Filename: "{app}\PDFCompressor.exe"; Description: "{cm:LaunchProgram,PDF Compressor Pro}"; Flags: nowait postinstall skipifsilent

[Code]
procedure SHChangeNotify(EventID: LongInt; Flags: UINT; Item1: LongInt; Item2: LongInt);
external 'SHChangeNotify@shell32.dll stdcall';

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    SHChangeNotify(134217728, 0, 0, 0); { SHCNE_ASSOCCHANGED = 0x08000000 = 134217728 }
  end;
end;
