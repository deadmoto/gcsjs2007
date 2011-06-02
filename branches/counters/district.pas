unit district;

interface

uses
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,
  Forms,
  Graphics,
  Grids,
  Messages,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TForm4 = class(TForm)
    FlowPanel1: TFlowPanel;
    Button3:    TButton;
    Button2:    TButton;
    Button1:    TButton;
    Panel1:     TPanel;
    distGrid:   TStringGrid;
    Panel2:     TPanel;
    Label3:     TLabel;
    Edit2:      TEdit;
    Label1:     TLabel;
    Edit1:      TEdit;
    Label2:     TLabel;
    Edit3:      TEdit;
    Label4:     TLabel;
    Edit4:      TEdit;
    Label5:     TLabel;
    Edit5:      TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure distGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form4: TForm4;

implementation

uses
  datamodule, main, service, MyTypes;

{$R *.dfm}

procedure TForm4.SetDefault;
var
  i: integer;
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from dist');
    SQL.Add('order by id_dist');
    Open;
    First;
  end;

  FormerStringGrid(distGrid, TStringArray.Create('Код', 'Наименование', 'Нач. отдела', 'Адрес', 'Телефон'),
    TIntArray.Create(25, 225, 100, 120, 90), DModule.sqlQuery1.RecordCount + 1);

  for i := 0 to DModule.sqlQuery1.RecordCount + 1 do
  begin
    with distGrid do
    begin
      Cells[0, i + 1] := DModule.sqlQuery1.FieldByName('id_dist').AsString;
      Cells[1, i + 1] := DModule.sqlQuery1.FieldByName('namedist').AsString;
      Cells[2, i + 1] := DModule.sqlQuery1.FieldByName('boss').AsString;
      Cells[3, i + 1] := DModule.sqlQuery1.FieldByName('adr').AsString;
      Cells[4, i + 1] := DModule.sqlQuery1.FieldByName('tel').AsString;
    end;
    DModule.sqlQuery1.Next;
  end;

end;

procedure TForm4.distGridSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := distGrid.Cells[1, distGrid.Row]; //DBGrid1.Fields[1].AsString;
    Edit2.Text := distGrid.Cells[0, distGrid.Row]; //DBGrid1.Fields[0].AsString;
    Edit3.Text := distGrid.Cells[2, distGrid.Row]; //DBGrid1.Fields[2].AsString;
    Edit4.Text := distGrid.Cells[3, distGrid.Row];
    Edit5.Text := distGrid.Cells[4, distGrid.Row];
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit2.Text);
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
{ добавить округ }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_dist');
      SQL.Add('from dist');
      SQL.Add('where (id_dist=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit2.Text));
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_dist');
        SQL.Add('from dist');
        SQL.Add('where (namedist=:name)');
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
        SQL.Add('insert into dist');
        SQL.Add('values (:id, :name, :boss, :adr, :tel)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', StrToInt(Edit2.Text));
        SetParam(Parameters, 'name', Edit1.Text);
        SetParam(Parameters, 'boss', Edit3.Text);
        SetParam(Parameters, 'adr', Edit4.Text);
        SetParam(Parameters, 'tel', Edit5.Text);
        ExecSQL;
        SetDefault;
        //        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else
      begin
        ShowMessage('Наименование округа и код должны быть уникальны!');
        SetDefault;
        //        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm4.Button2Click(Sender: TObject);
{ изменить округ }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_dist');
      SQL.Add('from dist');
      SQL.Add('where (id_dist=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit2.Text));
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_dist').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_dist');
        SQL.Add('from dist');
        SQL.Add('where (namedist=:name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_dist').AsInteger = oldid) then
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
        SQL.Add('update dist');
        SQL.Add('set namedist = :name, boss=:boss, adr=:adr, tel=:tel');
        SQL.Add('where id_dist = :id');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', oldid);
        SetParam(Parameters, 'name', Edit1.Text);
        SetParam(Parameters, 'boss', Edit3.Text);
        SetParam(Parameters, 'adr', Edit4.Text);
        SetParam(Parameters, 'tel', Edit5.Text);

        ExecSQL;
        SetDefault;
        oldid := StrToInt(Edit2.Text);
      end
      else
      begin
        ShowMessage('Наименование округа и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm4.Button3Click(Sender: TObject);
{ удалить округ }
begin
  with DModule.sqlQuery1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from dist');
      SQL.Add('where id_dist = :id');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', oldid);
      ExecSQL;
      SetDefault;
      //      Open;
{      Edit1.Text := distGrid.Cells[1,distGrid.Row];//DBGrid1.Fields[1].AsString;
      Edit2.Text := distGrid.Cells[0,distGrid.Row];//DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit2.Text);}
    end;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
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

procedure TForm4.Edit2Exit(Sender: TObject);
begin
  CheckInt(edit2);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.sqlQuery1.Close;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
  CheckRus(TEdit(Sender));
end;

procedure TForm4.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    checkInt(edit2);
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(TEdit(Sender));
end;

end.
