unit Unit1;

interface

uses
  IniFiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Helpp;

type
  TForm1 = class(TForm)

    ComboBox1: TComboBox;
    Find: TButton;
    GroupBox: TGroupBox;
    FindFileList: TListBox;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    label2: TLabel;
    procedure FindClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  StartHDD:string;
  FirstFolder:string;
  ArchiveFile:string;
  PdfFile:string;
  MusicFile:string;
  VideoFile:string;
  DocumentFile:string;
  ImageFile:string;
  ExeFile:string;
  DjvuFile:string;
  IsoFile:string;
  TorrentFile:string;

implementation

uses About, Unit3;

{$R *.dfm}


procedure FindFiles (path:string; format:string);
var
    F:TSearchRec;
begin
FirstFolder := Form3.ValueListEditor1.Strings.Values['StartFolder'];
FindFirst(format, faAnyFile, F);

    if F.Name <> '' then
      begin
        Form1.label2.Caption := 'File...';
        Form1.findfilelist.Items.Add(F.Name);
        MoveFile(PChar(FirstFolder + F.name), PChar(path + F.name));
        while FindNext(F) = 0 do begin
          Form1.FindFileList.Items.Add(F.Name);
          MoveFile(PChar(FirstFolder + F.name), PChar(path + F.name));
        end;
      end
    else
    begin
      Form1.label2.caption := 'File not Found';

    end;
end;

procedure TForm1.FindClick(Sender: TObject);
var
    ISO, GZ, RAR, Sz, ZIP : string;
    JPG, PNG : string;
    MP3, WAV : string;
    PDF, DJVU : string;
    EXE, MSI, MSI1, MSI2 : string;
    TORRENT, XLS, DOC, DOCX, PPT, PPTX, MDB : string;
    AVI, MP4, MKV, WMV:string;
    ini:TIniFile;
begin
  StartHDD := Form3.ValueListEditor1.Strings.Values['StartFolder'];
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'param.ini');
  case ComboBox1.ItemIndex of
  0:begin
    FindFileList.Clear;
    GroupBox.Caption := 'ArchiveFiles';
    ArchiveFile := ini.ReadString('Folders', 'ArchiveFile', 'Error');
    RAR := StartHDD + '*.rar';
    ZIP := StartHDD + '*.zip';
    GZ := StartHDD + '*.gz';
    Sz := StartHDD + '*.7z';
    FindFiles(ArchiveFile, RAR);
    FindFiles(ArchiveFile, ZIP);
    FindFiles(ArchiveFile, GZ);
    FindFiles(ArchiveFile, Sz);
  end;
  1:begin
    FindFileList.Clear;
    GroupBox.Caption := 'PDfFiles';
    PdfFile := ini.ReadString('Folders', 'PdfFile', 'Error');
    PDF := StartHDD + '*.pdf';
    FindFiles(PdfFile, PDF);
  end;
  2:begin
    FindFileList.Clear;
    GroupBox.Caption := 'MusicFiles';
    MusicFile := ini.ReadString('Folders', 'MusicFile', 'Error');
    MP3 := StartHDD + '*.mp3';
    WAV := StartHDD + '*.wav';
    FindFiles(MusicFile, MP3);
    FindFiles(MusicFile, WAV);
  end;
  3:begin
    FindFileList.Clear;
    GroupBox.Caption := 'VideoFile';
    VideoFile := ini.ReadString('Folders', 'VideoFile', 'Error');
    MP4 := StartHDD + '*.mp4';
    AVI := StartHDD + '*.avi';
    MKV := StartHDD + '*.mkv';
    WMV := StartHDD + '*.wmv';
    FindFiles(VideoFile, MP4);
    FindFiles(VideoFile, AVI);
    FindFiles(VideoFile, MKV);
    FindFiles(VideoFile, WMV);
  end;
  4:begin
    FindFileList.Clear;
    GroupBox.Caption := 'DocumentFiles';
    DocumentFile := ini.ReadString('Folders', 'DocumentFile', 'Error');
    DOC := StartHDD + '*.doc';
    DOCX := StartHDD + '*.docx';
    PPT := StartHDD + '*.ppt';
    PPTX := StartHDD + '*.pptx';
    XLS := StartHDD + '*.xls';
    MDB := StartHDD + '*.mdb';
    FindFiles(DocumentFile, DOC);
    FindFiles(DocumentFile, DOCX);
    FindFiles(DocumentFile, PPT);
    FindFiles(DocumentFile, PPTX);
    FindFiles(DocumentFile, XLS);
    FindFiles(DocumentFile, MDB);;
  end;
  5:begin
    FindFileList.Clear;
    GroupBox.Caption := 'ImageFiles';
    ImageFile := ini.ReadString('Folders', 'ImageFile', 'Error');
    JPG := StartHDD + '*.jpg';
    PNG := StartHDD + '*.png';
    FindFiles(ImageFile, JPG);
    FindFiles(ImageFile, PNG);
  end;
  6:begin
    FindFileList.Clear;
    GroupBox.Caption := 'ExeFiles';
    ExeFile := ini.ReadString('Folders', 'ExeFile', 'Error');
    EXE := StartHDD + '*.exe';
    MSI := StartHDD + '*.msi';
    MSI1 := StartHDD + '*.Msi';
    MSI2 := StartHDD + '*.MSI';
    FindFiles(ExeFile, EXE);
    FindFiles(ExeFile, MSI);
    FindFiles(ExeFile, MSI1);
    FindFiles(ExeFile, MSI2);
  end;
  7:begin
    FindFileList.Clear;
    GroupBox.Caption := 'DjvuFiles';
    DjvuFile := ini.ReadString('Folders', 'DjvuFile', 'Error');
    DJVU := StartHDD + '*.djvu';
    FindFiles(DjvuFile, DJVU);
  end;
  8:begin
    FindFileList.Clear;
    GroupBox.Caption := 'IsoFiles';
    IsoFile := ini.ReadString('Folders', 'IsoFile', 'Error');
    ISO := StartHDD + '*.iso';
    FindFiles(IsoFile, ISO);
  end;
  9:begin
      FindFileList.Clear;
      GroupBox.Caption := 'TorrentFiles';
      TorrentFile := ini.ReadString('Folders', 'TorrentFile', 'Error');
      TORRENT := StartHDD + '*.torrent';
      FindFiles(TorrentFile, TORRENT);
  end;
  else
    Form1.label2.caption := 'Не выбран пункт';
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form2.show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
//ShowMessage('В разработке');
Form3.Show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
Form4.Show;
end;


end.
