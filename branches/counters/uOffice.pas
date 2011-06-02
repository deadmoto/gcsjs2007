unit uOffice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  TOfficeForm = class(TForm)
    Panel1: TPanel;
    officeGrid: TStringGrid;
    Panel2: TPanel;
    FlowPanel1: TFlowPanel;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure officeGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    dist: array of integer;
    procedure SetDefault;
    function SearchDistInd(s: string): integer;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  OfficeForm: TOfficeForm;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TOfficeForm.Button1Click(Sender: TObject);
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT id_insp FROM Insp'#13#10 +
      'WHERE id_office = :id';
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', oldid);
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from Office');
      SQL.Add('where id_office = :id and (id_dist=:dist)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', oldid);
      SetParam(Parameters, 'dist', dist[ComboBox1.ItemIndex]);
      ExecSQL;
      SetDefault;
    end
    else
      ShowMessage('Удаление невозможно, есть инспектора из данного участка!');
  end;
end;

procedure TOfficeForm.Button2Click(Sender: TObject);
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_office');
      SQL.Add('from Office');
      SQL.Add('where (id_office=:id) and (id_dist=:dist)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit1.Text));
      SetParam(Parameters, 'dist', dist[ComboBox1.ItemIndex]);
      Open;
      if not IsEmpty then
        flag := True
      else
        flag := False;
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('update Office');
        SQL.Add('set adr=:adr, tel=:tel');
        SQL.Add('where id_office = :id and (id_dist=:dist)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', oldid);
        SetParam(Parameters, 'dist', dist[ComboBox1.ItemIndex]);
        SetParam(Parameters, 'adr', Edit2.Text);
        SetParam(Parameters, 'tel', Edit3.Text);

        ExecSQL;
        SetDefault;
        oldid := StrToInt(Edit1.Text);
      end
      else
      begin
        ShowMessage('Наименование участка и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TOfficeForm.Button3Click(Sender: TObject);
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_office');
      SQL.Add('from Office');
      SQL.Add('where (id_office=:id) and (id_dist=:dist)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit1.Text));
      SetParam(Parameters, 'dist', dist[ComboBox1.ItemIndex]);
      Open;
      if IsEmpty then
        flag := True
      else
        flag := False;
      Close;
      
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into Office');
        SQL.Add('values (:dist, :id, :adr, :tel)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', StrToInt(Edit1.Text));
        SetParam(Parameters, 'dist', dist[ComboBox1.ItemIndex]);
        SetParam(Parameters, 'adr', Edit2.Text);
        SetParam(Parameters, 'tel', Edit3.Text);
        ExecSQL;
        SetDefault;
        oldid := StrToInt(Edit1.Text);
      end
      else
      begin
        ShowMessage('Наименование участка и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TOfficeForm.FormShow(Sender: TObject);
begin
  SetDefault;

  if status = 0 then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
  end
  else
  begin
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TOfficeForm.officeGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := officeGrid.Cells[0, officeGrid.Row];
    ComboBox1.ItemIndex := SearchDistInd(officeGrid.Cells[1, officeGrid.Row]);
    Edit2.Text := officeGrid.Cells[2, officeGrid.Row];
    Edit3.Text := officeGrid.Cells[3, officeGrid.Row];
    if Edit1.Text <> '' then
      oldid := StrToInt(Edit1.Text);
  end;
end;

function TOfficeForm.SearchDistInd(s: string): integer;
var
  i: integer;
begin
  for i := 0 to ComboBox1.Items.Count - 1 do
  begin
    if ComboBox1.Items[i] = s then
      Result := i;
  end;
end;

procedure TOfficeForm.SetDefault;
var
  i: integer;
begin
  ComboBox1.Clear;
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT * FROM Dist';
    Open;
    i := 0;
    while not Eof do
    begin
      SetLength(dist, Length(dist) + 1);
      dist[i] := FieldValues['id_dist'];
      ComboBox1.Items.Add(FieldValues['namedist']);
      inc(i);
      Next;
    end;
  end;

  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT Office.*,Dist.namedist'#13#10 +
      'FROM Office INNER JOIN'#13#10 +
        'Dist ON Dist.id_dist = Office.id_dist'#13#10 +
      'ORDER BY Office.id_dist, Office.id_office';
    Open;
  end;

  if DModule.sqlQuery1.RecordCount > 0 then
  begin
    FormerStringGrid(officeGrid, TStringArray.Create('Код', 'Район', 'Адрес', 'Телефон'),
      TIntArray.Create(25, 100, 120, 90), DModule.sqlQuery1.RecordCount + 1);

    for i := 0 to DModule.sqlQuery1.RecordCount + 1 do
    begin
      with officeGrid do
      begin
        Cells[0, i + 1] := DModule.sqlQuery1.FieldByName('id_office').AsString;
        Cells[1, i + 1] := DModule.sqlQuery1.FieldByName('namedist').AsString;
        Cells[2, i + 1] := DModule.sqlQuery1.FieldByName('adr').AsString;
        Cells[3, i + 1] := DModule.sqlQuery1.FieldByName('tel').AsString;
      end;
      DModule.sqlQuery1.Next;
    end;
  end
  else
  begin
    FormerStringGrid(officeGrid, TStringArray.Create('Код', 'Район', 'Адрес', 'Телефон'),
      TIntArray.Create(25, 100, 120, 90), 2);

    for i := 0 to 3 do
    begin
      officeGrid.Cells[i, 1] := '';
    end;
  end;

end;

end.
