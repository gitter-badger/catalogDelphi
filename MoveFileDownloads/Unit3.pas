unit Unit3;

interface

uses
  IniFiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit;

type
  TForm3 = class(TForm)
    Develop: TLabel;
    ValueListEditor1: TValueListEditor;
    ReadINI: TButton;
    WriteINI: TButton;
    procedure WriteINIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //procedure ValueListEditor1DrawCell(Sender: TObject; ACol,
      //ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Param:TIniFile;

implementation
uses Unit1;
{$R *.dfm}


procedure TForm3.WriteINIClick(Sender: TObject);
var
    ini:TIniFile;
begin
//�������� �� ����
{if (ValueListEditor1.Strings.Values['ArchiveFile'] = '') OR (ValueListEditor1.Strings.Values['PdfFile'] = '') OR
(ValueListEditor1.Strings.Values['MusicFile'] = '') OR (ValueListEditor1.Strings.Values['DocumentFile'] = '') OR
(ValueListEditor1.Strings.Values['ImageFile'] = '') OR (ValueListEditor1.Strings.Values['ExeFile'] = '') OR
(ValueListEditor1.Strings.Values['DjvuFile'] = '') OR (ValueListEditor1.Strings.Values['IsoFile'] = '') OR
(ValueListEditor1.Strings.Values['TorrentFile'] = '') then begin
ReadINI.Enabled := False;
MessageBox(handle, PChar('������� �������� ��� ����� VALUE' + #13#10 + '������� ����� ��������� ���� ����� ���������� �����'), PChar('Warning)'),(MB_OK + MB_ICONWARNING));
end else begin
ShowMessage('�� ���-�� �����');
ReadINI.Enabled := True; }

//������� ����
ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'param.ini');
ini.WriteString('Folders', 'ArchiveFile',  ValueListEditor1.Strings.Values['ArchiveFile']);
ini.WriteString('Folders', 'PdfFile',      ValueListEditor1.Strings.Values['PdfFile']);
ini.WriteString('Folders', 'MusicFile',    ValueListEditor1.Strings.Values['MusicFile']);
ini.WriteString('Folders', 'VideoFile',    ValueListEditor1.Strings.Values['VideoFile']);
ini.WriteString('Folders', 'DocumentFile', ValueListEditor1.Strings.Values['DocumentFile']);
ini.WriteString('Folders', 'ImageFile',    ValueListEditor1.Strings.Values['ImageFile']);
ini.WriteString('Folders', 'ExeFile',      ValueListEditor1.Strings.Values['ExeFile']);
ini.WriteString('Folders', 'DjvuFile',     ValueListEditor1.Strings.Values['DjvuFile']);
ini.WriteString('Folders', 'IsoFile',      ValueListEditor1.Strings.Values['IsoFile']);
ini.WriteString('Folders', 'TorrentFile',  ValueListEditor1.Strings.Values['TorrentFile']);
ini.WriteString('Folders', 'StartFolder',  ValueListEditor1.Strings.Values['StartFolder']);
ini.Free;
if ValueListEditor1.Strings.Values['PdfFile'] = 'Error' then
  ShowMessage('������� �������� Value �� ���� ��������') else
  begin
    ForceDirectories(ValueListEditor1.Strings.Values['ArchiveFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['PdfFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['MusicFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['VideoFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['DocumentFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['ImageFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['ExeFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['DjvuFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['IsoFile']);
    ForceDirectories(ValueListEditor1.Strings.Values['TorrentFile']);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
  ini:TIniFile;
begin
  {ValueListEditor1.ColCount:=3;
ValueListEditor1.Title Captions.Add('Bobobo');}
//��������� ����
ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'param.ini');
ValueListEditor1.Strings.Values['ArchiveFile'] :=   ini.ReadString('Folders', 'ArchiveFile', 'Error');
ValueListEditor1.Strings.Values['PdfFile'] :=       ini.ReadString('Folders', 'PdfFile', 'Error');
ValueListEditor1.Strings.Values['MusicFile'] :=     ini.ReadString('Folders', 'MusicFile', 'Error');
ValueListEditor1.Strings.Values['VideoFile'] :=     ini.ReadString('Folders', 'VideoFile', 'Error');
ValueListEditor1.Strings.Values['DocumentFile'] :=  ini.ReadString('Folders', 'DocumentFile', 'Error');
ValueListEditor1.Strings.Values['ImageFile'] :=     ini.ReadString('Folders', 'ImageFile', 'Error');
ValueListEditor1.Strings.Values['ExeFile'] :=       ini.ReadString('Folders', 'ExeFile', 'Error');
ValueListEditor1.Strings.Values['DjvuFile'] :=      ini.ReadString('Folders', 'DjvuFile', 'Error');
ValueListEditor1.Strings.Values['IsoFile'] :=       ini.ReadString('Folders', 'IsoFile', 'Error');
ValueListEditor1.Strings.Values['TorrentFile'] :=   ini.ReadString('Folders', 'TorrentFile', 'Error');
ValueListEditor1.Strings.Values['StartFolder'] :=   ini.ReadString('Folders', 'StartFolder', 'Error');
ini.Free;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  ini:TIniFile;
begin
//��������� ����
ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'param.ini');
ValueListEditor1.Strings.Values['ArchiveFile'] :=   ini.ReadString('Folders', 'ArchiveFile', 'Error');
ValueListEditor1.Strings.Values['PdfFile'] :=       ini.ReadString('Folders', 'PdfFile', 'Error');
ValueListEditor1.Strings.Values['MusicFile'] :=     ini.ReadString('Folders', 'MusicFile', 'Error');
ValueListEditor1.Strings.Values['VideoFile'] :=     ini.ReadString('Folders', 'VideoFile', 'Error');
ValueListEditor1.Strings.Values['DocumentFile'] :=  ini.ReadString('Folders', 'DocumentFile', 'Error');
ValueListEditor1.Strings.Values['ImageFile'] :=     ini.ReadString('Folders', 'ImageFile', 'Error');
ValueListEditor1.Strings.Values['ExeFile'] :=       ini.ReadString('Folders', 'ExeFile', 'Error');
ValueListEditor1.Strings.Values['DjvuFile'] :=      ini.ReadString('Folders', 'DjvuFile', 'Error');
ValueListEditor1.Strings.Values['IsoFile'] :=       ini.ReadString('Folders', 'IsoFile', 'Error');
ValueListEditor1.Strings.Values['TorrentFile'] :=   ini.ReadString('Folders', 'TorrentFile', 'Error');
ini.Free;
end;


{procedure TForm3.ValueListEditor1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    temp:Integer;
begin
  temp := 3;
with (Sender as TValueListEditor) do
  begin
    for temp := 0 to ColCount - 1 do
      ColWidths[temp] := Width div ColCount - 2;
  end;
end;}

end.
