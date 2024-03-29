{-----------------------------------------------------------------------------}
{   ���������  TDBF  Version 1.11  -  14.06.2004             Freeware         }
{-----------------------------------------------------------------------------}
{   Copyright  2002-2004 ��������� �.�.                     majar@nm.ru       }
{-----------------------------------------------------------------------------}
{   ��������� ������������ ��� ����������������� ������� (��� �������������   }
{ BDE, ODBC) � ������ ������� dbf ������ dBase III+, dBase IV, dBase V.       }
{ �������������� ���� ������: ����������, ����, ����� � ��������� ������,     }
{ ����� � ������������� ������, ����������.                                   }
{   ��������� ��������� �������� �������� � dbf-������� � ����� ��������� ��. }
{ ����� ��������� ������� � ������� ���������� ����������� ��������� � �����- }
{ ����� TTable, �� ��������� �� �������� ��������  TTable � ����������������� }
{ � ����������� ������������ TDBXXX "�� �����".                               }
{   �������� � Delphi 3..6 ��� Windows 9X/NT4/2000/XP.                        }
{-----------------------------------------------------------------------------}

unit DBF;

interface

uses Windows, SysUtils, Classes;

type

  DBFHeader = record
    VerDBF      : Byte;     // 0     - ������ dbf-�����
    Year        : Byte;     // 1     - ��� ���������� ����������
    Month       : Byte;     // 2     - ����� ���������� ����������
    Day         : Byte;     // 3     - ���� ���������� ����������
    RecordCount : Integer;  // 4-7   - ���������� ������� � ����� ������� ���������
    HeaderSize  : Word;     // 8-9   - ������ ��������� (� ������)
    RecordSize  : Word;     // 10-11 - ������ ������ (� ������)
    Dummy1      : Word;     // 12-13 - ���������������
    Transaction : Byte;     // 14    - ���� ������������� ���������� dBASE IV
    Encrypt     : Byte;     // 15    - ���� ��������������� ������� dBASE IV
    MultiUse    : Integer;  // 16-19 - ��������������� ��� ��������
    LastUserID  : Integer;  // 20-23   ������������� - dBASE IV, dBASE V
    Dummy2      : Integer;  // 24-27 - ���������������
    MDXFlag     : Byte;     // 28    - ���� ������� MDX-�����
    Language    : Byte;     // 29    - ID �������� ����� (������� ��������)
    Dummy3      : Word;     // 30-31 - ���������������
  end;

  PField = ^DBField;
  DBField = record
    FieldName      : array[0..10] of Char;  // - ��� ���� (����������� ������)
    FieldType      : Char;     // 11           - ��� ����
    FieldOffset    : Integer;  // 12-15        - ������������ ���� ������ ������
    FieldSize      : Byte;     // 16           - ������ ���� (� ������)
    FieldPrecision : Byte;     // 17           - ���������� ������ ����� �������
    Dummy          : array[18..31] of Byte; // - ���������������
  end;

  ED = class(Exception);

  TFLDType = (bfBoolean, bfDate, bfFloat, bfNumber, bfString, bfUnkown);

  TCodePage = (ANSI, OEM, NONE);

  TDBF = class(TComponent)
  private
    FTableName: String;
    FExclusive: Boolean;
    FActive: Boolean;
    FCodePage: TCodePage;
    FModified: Boolean;
    FCurrentRecord: LongInt;
    FNumFields: Integer;
    FRecordCount: LongInt;
    DFile: TFileStream;
    FHeader: DBFHeader;
    FieldList: TList;
    RecordBuffer: array[1..4000] of Char;
    procedure ClearHeader;
    function GetDbfDate: TDateTime;
    function GetDeleteStatus: Boolean;
    function IsBof: Boolean;
    function IsEof: Boolean;
    function PadLeft(Text: String; Len: Integer): String;
    function PadRight(Text: String; Len: Integer): String;
    procedure ReadHeader;
    procedure ReadRecord;
    procedure RewriteTable;
    procedure SetActive(Value: Boolean);
    procedure SetDbfDate(Value: TDateTime);
    procedure SetDeleteStatus(Value: Boolean);
    procedure SetExclusive(Value: Boolean);
    procedure SetCodePage(Value: TCodePage);
    procedure SetTableName(Name: String);
    function TrimSpaces(Text: String): String;
    procedure WriteHeader;
    procedure WriteRecord;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddFieldDefs(FldName: String; FldType: TFLDType; FldSize, FldPrecision: Byte);
    procedure Append;          
    procedure Cancel;          
    procedure ClearFields;     
    procedure Close;           
    procedure CreateTable;     
    procedure EmptyTable;      
    procedure First;           
    function GetFieldData(FieldNo: Integer): String;      
    function GetFieldName(FieldNo: Integer): String;      
    function GetFieldPrecision(FieldNo: Integer): Byte;   
    function GetFieldSize(FieldNo: Integer): Byte;        
    function GetFieldType(FieldNo: Integer): TFLDType;    
    procedure GoToRecord(RecordNo: Integer);              
    procedure Insert;          
    function IsEmpty: Boolean; 
    procedure Last;            
    procedure Next;            
    procedure Open;            
    procedure PackTable;       
    procedure Post;            
    procedure Prior;           
    procedure Refresh;         
    procedure SetFieldData(FieldNo: Integer; Data: String);   
    procedure Translate(Src, Dest: String; ToOEM: Boolean);   
    property Active: Boolean read FActive write SetActive;    
    property Bof: Boolean read IsBof;
    property CodePage: TCodePage read FCodePage write SetCodePage;
    property DbfDate: TDateTime read GetDbfDate write SetDbfDate;
    property Deleted: Boolean read GetDeleteStatus write SetDeleteStatus;
    property Eof: Boolean read IsEof;
    property FieldCount: Integer read FNumFields;
    property Modified: Boolean read FModified;
    property RecNo: LongInt read FCurrentRecord;
    property RecordCount: LongInt read FRecordCount;
  published
    property Exclusive: Boolean read FExclusive write SetExclusive;
    property TableName: String read FTableName write SetTableName;
  end;

procedure Register;

implementation

{*** ������� ������ ��������� ***}
procedure TDbf.ClearHeader;
begin
  FillChar(FHeader, SizeOf(FHeader), 0);
end;

{*** ��������� ���� ��������� ����������� dbf-����� ***}
function TDbf.GetDbfDate: TDateTime;
var Y,M,D: Word;
begin
  with FHeader do begin Y:=Year+1900; M:=Month; D:=Day; end;
  Result:=EncodeDate(Y,M,D);
end;

{*** ��������, �������� �� ������� ������ ��� ��������� (True - �������) ***}
function TDbf.GetDeleteStatus: Boolean;
begin
  Result:=RecordBuffer[1]='*';
end;

{*** ��������, �������� �� ������� ������ ������ � dbf-����� ***}
function TDbf.IsBof: Boolean;
begin
  Result:=FCurrentRecord=1;
end;

{*** ��������, �������� �� ������� ������ ��������� � dbf-����� ***}
function TDbf.IsEof: Boolean;
begin
  Result:=FCurrentRecord=FRecordCount;
end;

{*** ���������� ������ ��������� ����� �� ����� Len ***}
function TDbf.PadLeft(Text: String; Len: Integer): String;
begin
  Result:=Text; while Length(Result)<Len do Result:=' '+Result;
end;

{*** ���������� ������ ��������� ������ �� ����� Len ***}
function TDbf.PadRight(Text: String; Len: Integer): String;
begin
  Result:=Text; while Length(Result)<Len do Result:=Result+' ';
end;

{*** ������ ��������� dbf-����� ***}
procedure TDbf.ReadHeader;
var
  N: Integer;
  Field: PField;
begin
  try
    DFile.Seek(0, soFromBeginning);
    DFile.ReadBuffer(FHeader, Sizeof(FHeader)); // ������ ��������� dbf-�����
    FNumFields:=(FHeader.HeaderSize div 32)-1;  // ���������� ����� � �����
    FRecordCount:=FHeader.RecordCount;          // ���������� ������� � �����
    if FRecordCount>0 then FCurrentRecord:=1    // ����� ������� ���������� ������
    else FCurrentRecord:=0;                     // � �������� �����
    case FHeader.Language of                    // ������� ��������
      87: FCodePage:=ANSI;
      38: FCodePage:=OEM;
    else FCodePage:=NONE; end;
    // ��������� ���������� � �����
    for N:=1 to FNumFields do
    begin
      DFile.Seek(N*32, soFromBeginning);
      New(Field);
      DFile.ReadBuffer(Field^, Sizeof(DBField));
      FieldList.Add(Field);
    end;
  except
    raise ED.Create('ReadHeader: ������ ������ ��������� �����');
  end;
end;

{*** ������ ������ �� dbf-����� ***}
procedure TDbf.ReadRecord;
begin
  try
    DFile.Seek(FHeader.HeaderSize+((FCurrentRecord-1)*FHeader.RecordSize), soFromBeginning);
    DFile.ReadBuffer(RecordBuffer, FHeader.RecordSize);
  except
    raise ED.Create('ReadRecord: ������ ������ ������');
  end;
end;

{*** ���������� dbf-����� � ����� ��������� EOF ***}
procedure TDbf.RewriteTable;
var
  Tmp: TFileStream;
  FN : String;
begin
  FN:=FTableName;
  try
    // ���� ��������� ���� ��� ����������, ���������� ���
    if FileExists('~~Brig~~.tmp') then DeleteFile('~~Brig~~.tmp');
    // ������� ��������� ���� � ��������� ���
    Tmp:=TFileStream.Create('~~Brig~~.tmp', fmOpenReadWrite or fmCreate);
    try
      // �������� ������ �� dbf-����� �� ��������� ���� �� EOF ������������
      DFile.Seek(0, soFromBeginning);
      with FHeader do Tmp.CopyFrom(DFile, HeaderSize+RecordCount*RecordSize+1);
    finally
      Tmp.Free;  // ��������� �����
    end;
    Close;
    // ������� dbf-���� � ��������������� ��������� ���� � dbf-����
    if FileExists(FN) then DeleteFile(FN);
    if not RenameFile('~~Brig~~.tmp',FN) then
      raise ED.Create('RewriteTable: �� ������� ������������� ��������� ����')
    else begin FTableName:=FN; Refresh; end; // ��������� �������������� ����
  except
    raise ED.Create('RewriteTable: ������ ��� ���������� �����');
  end;
end;

{*** ��������� �������� Active, �������� ��� �������� ����� ***}
procedure TDbf.SetActive(Value: Boolean);
begin
  if Value then Open else Close;
end;

{*** ��������� ���� ��������� ����������� dbf-����� ***}
procedure TDbf.SetDbfDate(Value: TDateTime);
var
  Y,M,D: Word;
  C    : array[1..3] of Char;
begin
  try DecodeDate(Value, Y, M, D);
  except raise ED.Create('SetDbfDate: �������� �������� ����'); end;
  with FHeader do
  begin
    Year:=Y-1900; Month:=M; Day:=D;
    C[1]:=Chr(Year); C[2]:=Chr(Month); C[3]:=Chr(Day);
  end;
  try DFile.Seek(1, soFromBeginning); DFile.WriteBuffer(C, 3);
  except raise ED.Create('SetDbfDate: ������ ������ � ��������� �����'); end;
end;

{*** �������� ������� ������ ��� ��������� (��� ��������) � dbf-����� ***}
procedure TDbf.SetDeleteStatus(Value: Boolean);
begin
  if Value then RecordBuffer[1]:='*' else RecordBuffer[1]:=' '; WriteRecord;
end;

{*** ��������� ������ ������������ ������� � ����� ***}
procedure TDbf.SetExclusive(Value: Boolean);
begin
  if not FActive then FExclusive:=Value else
    raise ED.Create('Exclusive: ��� �������� ������ ��������, ���� ���� ������');
end;

{*** ��������� ID �������� ����� (������� ��������) ***}
procedure TDbf.SetCodePage(Value: TCodePage);
var C: Char;
begin
  with FHeader do
  case Value of
    ANSI : Language:=87;
    OEM  : Language:=38;
    NONE : Language:=0;
  end;
  C:=Chr(FHeader.Language);
  try DFile.Seek(29, soFromBeginning); DFile.WriteBuffer(C, 1);
  except raise ED.Create('CodePage: ������ ������ � ��������� �����'); end;
end;

{*** ��������� ����� ����� ***}
procedure TDbf.SetTableName(Name: String);
begin
  if not FActive then
  begin
    if UpperCase(ExtractFileExt(Name))='.DBF' then FTableName:=Name
    else raise ED.Create('TableName: ������������ ��� �����');
  end else
    raise ED.Create('TableName: ��� �������� ������ ��������, ���� ���� ������');
end;

{*** �������� �� ������ �������� ����� � ������ ***}
function TDbf.TrimSpaces(Text: String): String;
begin
  Result:=Text;     
  // �������� �������� �����
  while (Length(Result)>0) and (Result[1]=#32) do
    Result:=Copy(Result, 2, Length(Result)-1);
  // �������� �������� ������
  while (Length(Result)>0) and (Result[Length(Result)]=#32) do
    SetLength(Result, Length(Result)-1);
end;

{*** ���������� ��������� dbf-����� ***}
procedure TDbf.WriteHeader;
var
  N: Integer;
  Field: PField;
  Y,M,D: Word;
  C: Char;
begin
  try
    DecodeDate(Now,Y,M,D);                        // ������� ����
    with FHeader do begin Year:=Y-1900; Month:=M; Day:=D; end;
    DFile.Seek(0, soFromBeginning);               // ���������� ���������
    DFile.WriteBuffer(FHeader, Sizeof(FHeader));
    for N:=1 to FNumFields do                     // ���������� �������� �����
    begin
      Field:=FieldList.Items[N-1];
      DFile.WriteBuffer(Field^, SizeOf(DBField)); // ����������� ������ $0D
    end;
    C:=#13; DFile.WriteBuffer(C, 1);
  except
    raise ED.Create('WriteHeader: ������ ���������� ��������� �����');
  end;
end;

{*** ���������� ������ � dbf-����� ***}
procedure TDbf.WriteRecord;
var Y,M,D: Word;
begin
  try
    with FHeader do begin Y:=Year; M:=Month; D:=Day; end; Y:=Y+1900;
    if EncodeDate(Y,M,D)<>Now then SetDbfDate(Now);  // ���� ����������� ����� ����������
    DFile.Seek(FHeader.HeaderSize+((FCurrentRecord-1)*FHeader.RecordSize), soFromBeginning);
    DFile.WriteBuffer(RecordBuffer, FHeader.RecordSize);
    FModified:=False;
  except
    raise ED.Create('WriteRecord: ������ ���������� ������');
  end;
end;

constructor TDbf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FieldList:=TList.Create;
end;

destructor TDbf.Destroy;
begin
  FieldList.Free;
  inherited Destroy;
end;

{*** ���������� �������� ���� (��� �������� ������ dbf-�����) ***}
procedure TDbf.AddFieldDefs(FldName: String; FldType: TFLDType; FldSize, FldPrecision: Byte);
var
  IField: PField;
  S: String;
begin
  if not FActive then
  begin
    New(IField); FillChar(IField^, SizeOf(DBField), 0);
    S:=UpperCase(FldName); if Length(S)>10 then SetLength(S, 10);
    StrPCopy(IField^.FieldName, S);
    with IField^ do
    case FldType of
      bfBoolean : FieldType:='L';
      bfDate    : FieldType:='D';
      bfFloat   : FieldType:='F';
      bfNumber  : FieldType:='N';
      bfString  : FieldType:='C';
    end;
    if FldSize<1 then
      raise ED.Create('AddFieldDefs: ������������ ������ ����') else
    with IField^ do
    begin
      case FldType of
        bfBoolean : FieldSize:=1;
        bfDate    : FieldSize:=8
      else FieldSize:=FldSize; end;
      case FldType of bfFloat, bfNumber:
        if (FldPrecision>0) and (FldPrecision>(FldSize-2)) then
          raise ED.Create('AddFieldDefs: ������������ �������� FldPrecision')
        else FieldPrecision:=FldPrecision;
      end; // case
    end;
    FieldList.Add(IField);
  end else
  raise ED.Create('AddFieldDefs: � �������� ����� ������ �������� �������� �����');
end;

{*** ��������� ����� ������ ������ � ����� ����� � ������ �� ������� ***}
procedure TDbf.Append;
var
  I: Integer;
  C: Char;
begin
  try
    Inc(FHeader.RecordCount); Inc(FRecordCount); C:=' ';
    DFile.Seek(FHeader.HeaderSize+
                (FHeader.RecordCount-1)*FHeader.RecordSize, soFromBeginning);
    for I:=1 to FHeader.RecordSize do DFile.WriteBuffer(C, 1);
    C:=#26; DFile.WriteBuffer(C, 1);              // ������� ����� �����
    DFile.Seek(0, soFromBeginning);               // ���������� ���������
    DFile.WriteBuffer(FHeader, Sizeof(FHeader));
    Last;  // ��������� ������ - �������
  except raise ED.Create('Append: ������ ���������� ������'); end;
end;

{*** �������� ����� ��������� � ������� ������, �� ����������� ��� � ����� ***}
procedure TDbf.Cancel;
begin
  ReadRecord; FModified:=False;
end;

{*** ������� ��� ���� ������� ������ ***}
procedure TDbf.ClearFields;
var N: Integer;                        
begin
  for N:=1 to FNumFields do SetFieldData(N, '');
end;

{*** ��������� �������� ���� ***}
procedure TDbf.Close;
begin
  if FActive then
    begin DFile.Free; ClearHeader; FieldList.Clear; FActive:=False; end
  else raise ED.Create('Close: ���� �� ������');
end;

{*** ������� ����� dbf-���� �� ����������, �������� AddFieldDefs ***}
procedure TDbf.CreateTable;
var
  N: Integer;
  C: Char;
  Field: PField;
begin
  if FActive then
    raise ED.Create('CreateTable: ���������� ������� �������� ����')
  else if FTableName='' then
    raise ED.Create('CreateTable: ���������� ������� ��� �����')
  else if FieldList.Count=0 then
    raise ED.Create('CreateTable: �� ������ �������� �����') else
  begin
    // ���� ���� � ����� ������ ��� ����������, ���������� ���
    if FileExists(FTableName) then DeleteFile(FTableName);
    // ������� ����� ����
    DFile:=TFileStream.Create(FTableName, fmCreate);
    FActive:=True;  // dbf-���� ������ � ������
    // ���������� ���������� ���������
    ClearHeader;    // ������� ������ ���������
    with FHeader do
    begin
      VerDBF:=3;
      HeaderSize:=32*(1+FieldList.Count)+1;
      RecordSize:=1;
      for N:=0 to FieldList.Count-1 do
      begin
        Field:=FieldList.Items[N];
        RecordSize:=RecordSize+Field^.FieldSize;
      end;
      RecordCount:=0; FNumFields:=FieldList.Count;
    end;
    WriteHeader; C:=#26;
    try DFile.WriteBuffer(C, 1); // ���������� ������ � ����
    except raise ED.Create('CreateTable: ������ ������ EOF'); end;
    Refresh; // ��������-�������� ����� ��� ��������� ������� �������
  end;
end;

{*** ������� ��� ������ �� ����� ***}
procedure TDbf.EmptyTable;
var C: Char;
begin
  FHeader.RecordCount:=0; FRecordCount:=0;
  WriteHeader; C:=#26;
  try DFile.WriteBuffer(C, 1);
  except raise ED.Create('EmptyTable: ������ ������ EOF'); end;
  RewriteTable;
end;

{*** ������ ������� ������ ���������� ������ � �������� ����� ***}
procedure TDbf.First;
begin
  if FRecordCount<1 then raise ED.Create('First: � ����� ��� �������')
  else begin if FModified then WriteRecord; FCurrentRecord:=1; ReadRecord; end;
end;

{*** ���������� ���������� ���� � ������� FieldNo �� ������� ������ ***}
function TDbf.GetFieldData(FieldNo: Integer): String;
var
  IField: PField;
  S: String;
  N,Addr: Integer;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('GetFieldData: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin
    Addr:=2; N:=0; IField:=FieldList.Items[N];
    while N<(FieldNo-1) do
      begin Inc(Addr, IField^.FieldSize); Inc(N); IField:=FieldList.Items[N]; end;
    for N:=Addr to Addr+IField^.FieldSize-1 do S:=S+RecordBuffer[N];
    S:=TrimSpaces(S);
    case IField^.FieldType of
      'C' : if FHeader.Language=38 then Translate(S,S,False);  // OEM -> ANSI
      'D' : if S<>'' then S:=Copy(S,7,2)+'.'+Copy(S,5,2)+'.'+Copy(S,1,4);
      'L' : if S<>'' then case S[1] of 'Y','y','T','t': S:='True';
                                       'N','n','F','f': S:='False'
                          else S:=' '; end;
      'F', 'N' : if Pos('.', S)>0 then S[Pos('.', S)]:=DecimalSeparator;
    end;
    Result:=S;
  end;
end;

{*** ���������� ��� ���� � ������� FieldNo ***}
function TDbf.GetFieldName(FieldNo: Integer): String;
var
  IField: PField;
  N: Integer;
  S: String;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('GetFieldName: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin
    IField:=FieldList.Items[FieldNo-1];
    N:=0; S:='';
    while IField^.FieldName[N]<>#0 do begin S:=S+IField^.FieldName[N]; Inc(N); end;
    Result:=UpperCase(S);
  end;
end;

{*** ���������� ���������� ������ ����� ������� ���� � ������� FieldNo ***}
function TDbf.GetFieldPrecision(FieldNo: Integer): Byte;
var IField: PField;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('GetFieldPrecision: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin
    IField:=FieldList.Items[FieldNo-1];
    Result:=IField^.FieldPrecision;
  end;
end;

{*** ���������� ������ (� ������) ���� � ������� FieldNo ***}
function TDbf.GetFieldSize(FieldNo: Integer): Byte;
var IField: PField;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('GetFieldSize: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin IField:=FieldList.Items[FieldNo-1]; Result:=IField^.FieldSize; end;
end;

{*** ���������� ��� ������ ���� � ������� FieldNo ***}
function TDbf.GetFieldType(FieldNo: Integer): TFLDType;
var IField: PField;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('GetFieldType: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin
    IField:=FieldList.Items[FieldNo-1];
    case IField^.FieldType of
      'C': Result:=bfString;
      'N': Result:=bfNumber;
      'F': Result:=bfFloat;
      'L': Result:=bfBoolean;
      'D': Result:=bfDate;
    else Result:=bfUnkown; end;
  end;
end;

{*** ������ ������� ���������� ������ � ������� RecordNo � �������� ����� ***}
procedure TDbf.GoToRecord(RecordNo: Integer);
begin
  if FRecordCount<1 then raise ED.Create('GoToRecord: � ����� ��� �������') else
  if (RecordNo<1) or (RecordNo>FRecordCount) then
    raise ED.Create('GoToRecord: �������� ����� ������') else
  begin if FModified then WriteRecord; FCurrentRecord:=RecordNo; ReadRecord; end;
end;

{*** ��������� ������ ������ �� ����� �������, ������� ��������� � ����� ����� ***}
procedure TDbf.Insert;
var
  CR: LongInt;
begin
  CR:=FCurrentRecord;   // ����� ������� ������
  Append;               // ��������� ������ ������ � ����� �����
  if CR=0 then Exit;    // ������ ��������� � ������ ����
  while FCurrentRecord>CR do       // �������� ������ � ����� �����
  begin
    Dec(FCurrentRecord); ReadRecord;
    Inc(FCurrentRecord); WriteRecord;
    Dec(FCurrentRecord);
  end;
  ClearFields; Post;    // ������� ����� ����������� ������
end;

{*** ����������  True, ���� � ����� ��� ������� ***}
function TDbf.IsEmpty: Boolean;
begin
  Result:=FRecordCount<1;
end;

{*** ������ ������� ��������� ���������� ������ � �������� ����� ***}
procedure TDbf.Last;
begin
  if FRecordCount<1 then raise ED.Create('Last: � ����� ��� �������') else
  begin
    if FModified then WriteRecord; FCurrentRecord:=FRecordCount; ReadRecord;
  end;
end;

{*** ������ ������� ��������� ���������� ������ � �������� ����� ***}
procedure TDbf.Next;
begin
  if FRecordCount<1 then raise ED.Create('Next: � ����� ��� �������') else
  if FCurrentRecord<FRecordCount then
  begin
    if FModified then WriteRecord; FCurrentRecord:=FCurrentRecord+1; ReadRecord;
  end;
end;

{*** ��������� ��������� (TableName) ���� ***}
procedure TDbf.Open;
begin
  if FActive then raise ED.Create('Open: ���������� ������� �������� ����') else
  if FileExists(FTableName) then
  begin
    try
      if FExclusive then DFile:=TFileStream.Create(FTableName,
                                     fmOpenReadWrite or fmShareExclusive) else
      DFile:=TFileStream.Create(FTableName, fmOpenReadWrite or fmShareDenyNone);
    except
      raise ED.Create('���� '+ExtractFileName(FTableName)+
                      ' ���������� ������� � �����������'+#13+
                      '������, �.�. �� ��� ������������ ������ ����������');
    end;
    FActive:=True;  // dbf-���� ������
    ReadHeader;     // ������ ��������� dbf-�����
    if FCurrentRecord=1 then begin ReadRecord; FModified:=False; end;
  end else raise ED.Create('Open: �� ������ ���� '+FTableName);
end;

{*** �������� �� ����� ������ ������� (�������� �������) ***}
procedure TDbf.PackTable;
var
  R, N, K: LongInt;
  C: Char;
begin
  if FRecordCount<1 then raise ED.Create('PackTable: � ����� ��� �������') else
  begin
    R:=0; N:=0;
    repeat
      Inc(N); K:=N; FCurrentRecord:=N; ReadRecord;
      if GetDeleteStatus then
      begin
        if K=FRecordCount then Break;
        repeat
          Inc(K); FCurrentRecord:=K; ReadRecord;
        until (K=FRecordCount) or (not GetDeleteStatus);
        if not GetDeleteStatus then
        begin
          R:=N; FCurrentRecord:=R; WriteRecord;
          FCurrentRecord:=K; SetDeleteStatus(True); WriteRecord;
        end;
      end else R:=N;
    until K=FRecordCount;
    if R=0 then EmptyTable else
    begin
      FRecordCount:=R; FHeader.RecordCount:=R;
      WriteHeader; FCurrentRecord:=1;
      try
        C:=#26;
        DFile.Seek(FHeader.HeaderSize+FHeader.RecordCount*FHeader.RecordSize,
                   soFromBeginning);
        DFile.WriteBuffer(C, 1);
      except raise ED.Create('PackTable: ������ ������ EOF'); end;
    end;
  end;
  RewriteTable;
end;

{*** ��������� ��� ��������� ������� ������ � ����� ***}
// ������������� �������� Modified � False
procedure TDbf.Post;
begin
  if FRecordCount>0 then WriteRecord;
end;

{*** ������ ������� ���������� ���������� ������ � �������� ����� ***}
procedure TDbf.Prior;
begin
  if FRecordCount<1 then raise ED.Create('Prior: � ����� ��� �������') else
  if FCurrentRecord>1 then
  begin
    if FModified then WriteRecord; FCurrentRecord:=FCurrentRecord-1; ReadRecord;
  end;
end;

{*** ���������� TDbf ������� �� ����� (��������� �������� �����) ***}
procedure TDbf.Refresh;
begin
  if FActive then Close; Open;
end;

{*** � ������� ������ �������� ���������� ���� � ��������� FieldNo ������� Data ***}
// ������������� �������� Modified � True
procedure TDbf.SetFieldData(FieldNo: Integer; Data: String);
var
  IField: PField;
  S, W: String;
  N, Addr: Longint;
  G, M, D: Word;
begin
  if (FieldNo<1) or (FieldNo>FNumFields) then
    raise ED.Create('SetFieldData: �������� ����� ����: '+IntToStr(FieldNo)) else
  begin
    IField:=FieldList.Items[FieldNo-1];
    W:=TrimRight(Data); // �������� �������� � ������������ ������
    if (Length(W)<=IField^.FieldSize) or
       ((IField^.FieldType='L') and (Length(W)<=4)) or
       ((IField^.FieldType='D') and (Length(W)=10)) then
    with IField^ do
    begin
      if W<>'' then   // �������������� ������ � ����������� �� ����
      try
        case FieldType of
          'L' : if (UpperCase(W)='TRUE') or (UpperCase(W)='YES') then S:='T'
                else if (UpperCase(W)='FALSE') or (UpperCase(W)='NO') then
                        S:='F' else S:=' ';
          'D' : begin
                  G:=StrToInt(Copy(W, 7, 4));
                  M:=StrToInt(Copy(W, 4, 2));
                  D:=StrToInt(Copy(W, 1, 2));
                  S:=FormatDateTime('yyyymmdd', EncodeDate(G, M, D));
                end;
      'F','N' : begin
                  if (Pos('.', W)>0) and (DecimalSeparator=',') then W[Pos('.', W)]:=',';
                  S:=FloatToStrF(StrToFloat(W), ffFixed, FieldSize, FieldPrecision);
                  if (FieldPrecision>0) and (DecimalSeparator=',') then
                    S[Pos(',', S)]:='.';
                end
        else S:=W; end;
      except raise ED.Create('SetFieldData: ������ ������ - ���: '+
                   IntToStr(FCurrentRecord)+', ����: '+IntToStr(FieldNo)); end;
      case FieldType of
        'N','F','M': S:=PadLeft(S, FieldSize) // ��������� ��������� �����
      else
        S:=PadRight(S, FieldSize);            // ��������� ��������� ������
      end; // case
      Addr:=2; N:=0; IField:=FieldList.Items[N];
      while N<(FieldNo-1) do
      begin Inc(Addr, IField^.FieldSize); Inc(N); IField:=FieldList.Items[N]; end;
      for N:=1 to Length(S) do RecordBuffer[Addr-1+N]:=S[N];
      FModified:=True; // ����� dbf-����� ��������
    end else raise ED.Create('SetFieldData: ������������ ������ ������'+#13+
              '���: '+IntToStr(FCurrentRecord)+', ����: '+IntToStr(FieldNo));
  end;
end;

{*** ������� ������ Src � ����� Dest �� ������� ANSI � ������ OEM � �������� ***}
procedure TDbf.Translate(Src, Dest: String; ToOEM: Boolean);
var S: String;
begin
  S:=Src;
  if ToOEM then
  begin             // ������������� �� ������� ANSI � ������ OEM
    while Pos('�', S)>0 do S[Pos('�', S)]:='I';  // ��� ���������� ������ � ����������
    while Pos('�', S)>0 do S[Pos('�', S)]:='i';  // ������ 'i' (������ �� ���������)
    if Length(S)>0 then CharToOem(PChar(S), PChar(Dest)) else Dest:='';
  end else
  begin             // ������������� �� ������� OEM � ������ ANSI
    if Length(S)>0 then OemToChar(PChar(S), PChar(Dest)) else Dest:='';
  end;
end;

procedure Register;
begin
  RegisterComponents('Samples', [TDBF]);
end;

end.


