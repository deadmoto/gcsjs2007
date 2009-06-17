unit minimum;                                                                 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm13 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form13: TForm13;

implementation

uses datamodule, main, service;

{$R *.dfm}

procedure TForm13.SetDefault;
begin
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "curlmin.dbf" sbros');
    SQL.Add('order by sbros.id_min');
    Open;
  end;
end;

procedure TForm13.Button4Click(Sender: TObject);
{ выйти }
begin
  Form13.Close;
end;

procedure TForm13.DBGrid1CellClick(Column: TColumn);
{ выбрана ячейка }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm13.Button1Click(Sender: TObject);
{ добавить минимум }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '')and(Edit3.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_min');
      SQl.Add('from lmin');
      SQL.Add('where (id_min=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_min');
        SQl.Add('from lmin');
        SQL.Add('where (namemin=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty then
          flag := true
        else
          flag := false;
        Close;
      end
      else begin
        flag := false;
        Close;
      end;
      if flag then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into lmin');
        SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:minim)');
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('minim').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        FillMin(Form1.bpath,Form1.rdt,Form1.codedbf);
        oldid := StrToInt(Edit3.Text);
      end
      else
        ShowMessage('Наименование социально-демографической группы и кода должны быть уникальны!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm13.Button2Click(Sender: TObject);
{ изменить минимум }
var
  flag: boolean;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '')and(Edit3.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_min');
      SQl.Add('from lmin');
      SQL.Add('where (id_min=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      Open;
      if IsEmpty or not IsEmpty and(FieldByName('id_min').AsInteger=oldid) then begin
        if IsEmpty then
          flag := false
        else begin
          Close;
          SQL.Clear;
          SQl.Add('select id_min');
          SQl.Add('from lmin');
          SQl.Add('where (id_min=:id)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          ParamByName('d').AsString := Form1.rdt;
          Open;
          if IsEmpty then
            flag := false
          else
            flag := true;
        end;
        Close;
        SQL.Clear;
        SQl.Add('select id_min');
        SQl.Add('from lmin');
        SQL.Add('where (namemin=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_min').AsInteger = oldid) then begin
          if not flag then begin
            Close;
            SQL.Clear;
            SQL.Add('insert into lmin');
            SQL.Add('values (convert(smalldatetime,:d,104),:id,:name,:minim)');
            ParamByName('id').AsInteger := StrToInt(Edit3.Text);
          end
          else begin
            Close;
            SQL.Clear;
            SQL.Add('update lmin');
            SQL.Add('set namemin = :name, minim = :minim');
            SQL.Add('where (id_min = :id)and(sdate=Convert(smalldatetime,:d,104))');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('minim').AsFloat := StrToFloat(Edit2.Text);
          ExecSQL;
          FillMin(Form1.bpath,Form1.rdt,Form1.codedbf);
          oldid := StrToInt(Edit3.Text);
        end
        else
          ShowMessage('Наименование социально-демографической группы должно быть уникальным!');
      end
      else
        ShowMessage('Наименование социально-демографической группы должно быть уникальным!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Оба поля ввода должны быть заполнены!');
end;

procedure TForm13.Button3Click(Sender: TObject);
{ удалить минимум }
begin
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from lmin');
    SQl.Add('where (id_min=:id)and(sdate=Convert(smalldatetime,:d,104))');
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillMin(Form1.bpath,Form1.rdt,Form1.codedbf);
  end;
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
  if status=0 then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    Button3.Enabled := false;
  end
  else begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    Button3.Enabled := true;
  end;
end;

procedure TForm13.Edit3Exit(Sender: TObject);
begin
  CheckInt(edit3);
end;

procedure TForm13.Edit2Exit(Sender: TObject);
begin
  SetPoint(Edit2);
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm13.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm13.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(edit1);
end;

procedure TForm13.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SetPoint(edit2);
end;

procedure TForm13.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(edit3);
end;

end.
