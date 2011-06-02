unit rstnd;

interface

uses
  Classes, Controls, Dialogs, ExtCtrls, Forms, Graphics, Grids, Messages,
  StdCtrls, SysUtils, Variants, Windows;

type
  TForm38 = class(TForm)
    Panel1:      TPanel;
    Label10:     TLabel;
    Label11:     TLabel;
    Label12:     TLabel;
    Label13:     TLabel;
    Panel2:      TPanel;
    StringGrid1: TStringGrid;
    Panel3:      TPanel;
    Edit4:       TEdit;
    Label3:      TLabel;
    Edit1:       TEdit;
    Label1:      TLabel;
    Edit2:       TEdit;
    Label2:      TLabel;
    Label7:      TLabel;
    Edit7:       TEdit;
    Label4:      TLabel;
    Edit3:       TEdit;
    Label8:      TLabel;
    Edit8:       TEdit;
    Label5:      TLabel;
    Edit5:       TEdit;
    Label6:      TLabel;
    Edit6:       TEdit;
    Edit9:       TEdit;
    Label9:      TLabel;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form38: TForm38;

implementation

uses
  datamodule, service, main, elpower, MyTypes;

{$R *.dfm}

procedure TForm38.SetDefault;
var
  i: integer;
begin
  with DModule.qTarif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from currstnd.dbf sbros');
    SQL.Add('order by sbros.id_stnd');
    Open;
    First;
  end;

  FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование', 'Ст-рт 1', 'Ст-рт 2',
    'Ст-рт 3', 'Ст-рт 4', 'Ст-рт 5', 'Ст-рт 6', 'Ст-рт 7'),
    TIntArray.Create(25, 170, 50, 50, 50, 50, 50, 50, 50), DModule.qTarif.RecordCount + 1);

  for i := 0 to DModule.qTarif.RecordCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := DModule.qTarif.FieldByName('id_stnd').Value;
    StringGrid1.Cells[1, i + 1] := DModule.qTarif.FieldByName('namestnd').Value;
    StringGrid1.Cells[2, i + 1] := DModule.qTarif.FieldByName('value1').Value;
    StringGrid1.Cells[3, i + 1] := DModule.qTarif.FieldByName('value2').Value;
    StringGrid1.Cells[4, i + 1] := DModule.qTarif.FieldByName('value3').Value;
    StringGrid1.Cells[5, i + 1] := DModule.qTarif.FieldByName('value4').Value;
    StringGrid1.Cells[6, i + 1] := DModule.qTarif.FieldByName('value5').Value;
    StringGrid1.Cells[7, i + 1] := DModule.qTarif.FieldByName('value6').Value;
    StringGrid1.Cells[8, i + 1] := DModule.qTarif.FieldByName('value7').Value;
    DModule.qTarif.Next;
  end;

end;

procedure TForm38.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
{ выбрана ячейка }
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[1, ARow];
    Edit2.Text := StringGrid1.Cells[2, ARow];
    Edit3.Text := StringGrid1.Cells[3, ARow];
    Edit5.Text := StringGrid1.Cells[4, ARow];
    Edit6.Text := StringGrid1.Cells[5, ARow];
    Edit7.Text := StringGrid1.Cells[6, ARow];
    Edit8.Text := StringGrid1.Cells[7, ARow];
    Edit9.Text := StringGrid1.Cells[8, ARow];
    Edit4.Text := StringGrid1.Cells[0, ARow];
    if Edit4.Text <> '' then
      oldid := StrToInt(Edit4.Text);
  end;
end;

procedure TForm38.Button4Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm38.Button1Click(Sender: TObject);
{ добавить стандарт }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_stnd');
      SQL.Add('from rstnd');
      SQL.Add('where (id_stnd=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit4.Text));
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_stnd');
        SQL.Add('from rstnd');
        SQL.Add('where (namestnd=:name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
        Open;
        if IsEmpty then
          flag := True
        else
          flag := False;
        Close;
      end
      else
      begin
        flag := False;
        Close;
      end;
      if flag then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into rstnd');
        SQL.Add('values (Convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'd', MainForm.rdt);
        SetParam(Parameters, 'id', StrToInt(Edit4.Text));
        SetParam(Parameters, 'name', Edit1.Text);
        SetParam(Parameters, 'v1', StrToFloat(Edit2.Text));
        SetParam(Parameters, 'v2', StrToFloat(Edit3.Text));
        SetParam(Parameters, 'v3', StrToFloat(Edit5.Text));
        SetParam(Parameters, 'v4', StrToFloat(Edit6.Text));
        SetParam(Parameters, 'v5', StrToFloat(Edit7.Text));
        SetParam(Parameters, 'v6', StrToFloat(Edit8.Text));
        SetParam(Parameters, 'v7', StrToFloat(Edit9.Text));
        ExecSQL;
        FillStnd(MainForm.bpath, MainForm.rdt, MainForm.codedbf);
        SetDefault;
      end
      else
      begin
        ShowMessage('Комбинация наименования и кода должна быть уникальной!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm38.Button2Click(Sender: TObject);
{ изменить стандарт }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_stnd');
      SQL.Add('from rstnd');
      SQL.Add('where (id_stnd=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit4.Text));
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_stnd').AsInteger = oldid) then
      begin
        if IsEmpty then
          flag := False
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('select id_stnd');
          SQL.Add('from rstnd');
          SQL.Add('where (id_stnd=:id)and(sdate=Convert(smalldatetime,:d,104))');
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'id', StrToInt(Edit4.Text));
          SetParam(Parameters, 'd', MainForm.rdt);
          Open;
          if IsEmpty then
            flag := False
          else
            flag := True;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select id_stnd');
        SQL.Add('from rstnd');
        SQL.Add('where (namestnd=:name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_stnd').AsInteger = oldid) then
        begin
          if not flag then
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into rstnd');
            SQL.Add('values (Convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', StrToInt(Edit4.Text));
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('update rstnd');
            SQL.Add('set namestnd=:name,value1=:v1,value2=:v2,value3=:v3,value4=:v4,value5=:v5,value6=:v6,value7=:v7');
            SQL.Add('where (id_stnd = :id)and(sdate=Convert(smalldatetime,:d,104))');
            Parameters.ParseSQL(SQL.Text, True);
            SetParam(Parameters, 'id', oldid);
          end;
          SetParam(Parameters, 'd', MainForm.rdt);
          SetParam(Parameters, 'name', Edit1.Text);
          SetParam(Parameters, 'v1', StrToFloat(Edit2.Text));
          SetParam(Parameters, 'v2', StrToFloat(Edit3.Text));
          SetParam(Parameters, 'v3', StrToFloat(Edit5.Text));
          SetParam(Parameters, 'v4', StrToFloat(Edit6.Text));
          SetParam(Parameters, 'v5', StrToFloat(Edit7.Text));
          SetParam(Parameters, 'v6', StrToFloat(Edit8.Text));
          SetParam(Parameters, 'v7', StrToFloat(Edit9.Text));
          ExecSQL;
          FillStnd(MainForm.bpath, MainForm.rdt, MainForm.codedbf);
          oldid := StrToInt(Edit4.Text);
        end
        else
          ShowMessage('Комбинация наименования и кода должна быть уникальной!');
      end
      else
        ShowMessage('Комбинация наименования и кода должна быть уникальной!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm38.Button3Click(Sender: TObject);
{ удалить стандарт }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from rstnd');
    SQL.Add('where (id_stnd=:id)and(sdate=Convert(smalldatetime,:d,104))');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'd', MainForm.rdt);
    SetParam(Parameters, 'id', oldid);
    ExecSQL;
    FillStnd(MainForm.bpath, MainForm.rdt, MainForm.codedbf);
  end;
  SetDefault;
end;

procedure TForm38.FormShow(Sender: TObject);
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

procedure TForm38.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.sqlQuery1.Close;
  DModule.qTarif.Close;
end;

procedure TForm38.Edit4Exit(Sender: TObject);
begin
  CheckInt(edit4);
end;

procedure TForm38.Edit4KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit4);
end;

procedure TForm38.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm38.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit1);
end;

procedure TForm38.Edit2Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm38.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    SetPoint(TEdit(Sender));
end;

end.
