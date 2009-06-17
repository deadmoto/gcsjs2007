unit rstnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm38 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

uses datamodule, service, main, elpower;

{$R *.dfm}

procedure TForm38.SetDefault;
begin
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "currstnd.dbf" sbros');
    SQL.Add('order by sbros.id_stnd');
    Open;
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
    (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_stnd');
      SQl.Add('from rstnd');
      SQl.Add('where (id_stnd=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_stnd');
        SQl.Add('from rstnd');
        SQl.Add('where (namestnd=:name)');
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
        SQL.Add('insert into rstnd');
        SQL.Add('values (Convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit4.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('v1').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('v2').AsFloat := StrToFloat(Edit3.Text);
        ParamByName('v3').AsFloat := StrToFloat(Edit5.Text);
        ParamByName('v4').AsFloat := StrToFloat(Edit6.Text);
        ParamByName('v5').AsFloat := StrToFloat(Edit7.Text);
        ParamByName('v6').AsFloat := StrToFloat(Edit8.Text);
        ParamByName('v7').AsFloat := StrToFloat(Edit9.Text);
        ExecSQL;
        FillStnd(Form1.bpath,Form1.rdt,Form1.codedbf);
        SetDefault;
        Open;
        oldid := StrToInt(Edit4.Text);
      end
      else begin
        ShowMessage('Комбинация наименования и кода должна быть уникальной!');
        SetDefault;
        Open;
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
    (Edit3.Text <> '')and (Edit4.Text <> '')and (Edit5.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_stnd');
      SQl.Add('from rstnd');
      SQl.Add('where (id_stnd=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_stnd').AsInteger = oldid) then begin
        if IsEmpty then
          flag := false
        else begin
          Close;
          SQL.Clear;
          SQl.Add('select id_stnd');
          SQl.Add('from rstnd');
          SQl.Add('where (id_stnd=:id)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('id').AsInteger := StrToInt(Edit4.Text);
          ParamByName('d').AsString := Form1.rdt;
          Open;
          if IsEmpty then
            flag := false
          else
            flag := true;
        end;
        Close;
        SQL.Clear;
        SQl.Add('select id_stnd');
        SQl.Add('from rstnd');
        SQl.Add('where (namestnd=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_stnd').AsInteger = oldid) then begin
          if not flag  then begin
            Close;
            SQL.Clear;
            SQL.Add('insert into rstnd');
            SQL.Add('values (Convert(smalldatetime,:d,104),:id,:name,:v1,:v2,:v3,:v4,:v5,:v6,:v7)');
            ParamByName('id').AsInteger := StrToInt(Edit4.Text);
          end
          else begin
            Close;
            SQL.Clear;
            SQL.Add('update rstnd');
            SQL.Add('set namestnd=:name,value1=:v1,value2=:v2,value3=:v3,value3=:v3,value4=:v4,value5=:v5,value6=:v6,value7=:v7');
            SQL.Add('where (id_stnd = :id)and(sdate=Convert(smalldatetime,:d,104))');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('v1').AsFloat := StrToFloat(Edit2.Text);
          ParamByName('v2').AsFloat := StrToFloat(Edit3.Text);
          ParamByName('v3').AsFloat := StrToFloat(Edit5.Text);
          ParamByName('v4').AsFloat := StrToFloat(Edit6.Text);
          ParamByName('v5').AsFloat := StrToFloat(Edit7.Text);
          ParamByName('v6').AsFloat := StrToFloat(Edit8.Text);
          ParamByName('v7').AsFloat := StrToFloat(Edit9.Text);
          ExecSQL;
          FillStnd(Form1.bpath,Form1.rdt,Form1.codedbf);
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
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from rstnd');
    SQl.Add('where (id_stnd=:id)and(sdate=Convert(smalldatetime,:d,104))');
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillStnd(Form1.bpath,Form1.rdt,Form1.codedbf);
  end;
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[3].AsString;
  Edit5.Text := DBGrid1.Fields[4].AsString;
  Edit6.Text := DBGrid1.Fields[5].AsString;
  Edit7.Text := DBGrid1.Fields[6].AsString;
  Edit8.Text := DBGrid1.Fields[7].AsString;
  Edit9.Text := DBGrid1.Fields[8].AsString;
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
end;

procedure TForm38.DBGrid1CellClick(Column: TColumn);
{ выбрана ячейка }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit6.Text := FlToStr(DBGrid1.Fields[5].AsFloat);
  Edit7.Text := FlToStr(DBGrid1.Fields[6].AsFloat);
  Edit8.Text := FlToStr(DBGrid1.Fields[7].AsFloat);
  Edit9.Text := FlToStr(DBGrid1.Fields[8].AsFloat);
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
end;

procedure TForm38.FormShow(Sender: TObject);
begin
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit6.Text := FlToStr(DBGrid1.Fields[5].AsFloat);
  Edit7.Text := FlToStr(DBGrid1.Fields[6].AsFloat);
  Edit8.Text := FlToStr(DBGrid1.Fields[7].AsFloat);
  Edit9.Text := FlToStr(DBGrid1.Fields[8].AsFloat);
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
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

procedure TForm38.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm38.Edit4Exit(Sender: TObject);
begin
  CheckInt(edit4);
end;

procedure TForm38.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(edit4);
end;

procedure TForm38.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm38.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(edit1);
end;

procedure TForm38.Edit2Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm38.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SetPoint(TEdit(Sender));
end;

end.
