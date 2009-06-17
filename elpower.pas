unit elpower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm23 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
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
    num: integer;//номер услуги
  end;

var
  Form23: TForm23;

implementation

uses datamodule, service, main;

{$R *.dfm}

procedure TForm23.SetDefault;
begin
  with DataModule1.Query4 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "curel.dbf" sbros');
    SQL.Add('order by sbros.id_el');
    Open;
  end;
end;

procedure TForm23.Button4Click(Sender: TObject);
{ выйти }
begin
  Form23.Close;
end;

procedure TForm23.Button1Click(Sender: TObject);
{ добавить тариф }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_el');
      SQl.Add('from el');
      SQl.Add('where (id_el=:id)and(id_dist=:idd)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      ParamByName('idd').AsInteger := Form1.dist;
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_el');
        SQl.Add('from el');
        SQl.Add('where (plate=:plate)and(id_dist=:idd)');
        ParamByName('plate').AsString := Edit1.Text;
        ParamByName('idd').AsInteger := Form1.dist;
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
        SQL.Add('insert into el');
        SQL.Add('values (:idd,Convert(smalldatetime,:d,104), :id, :plate, :tarif1,:tarif2,:tarif3)');
        ParamByName('idd').AsInteger := Form1.dist;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit4.Text);
        ParamByName('plate').AsString := Edit1.Text;
        ParamByName('tarif1').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('tarif2').AsFloat := StrToFloat(Edit3.Text);
        ParamByName('tarif3').AsFloat := StrToFloat(Edit5.Text);
        ExecSQL;
        FillEl(Form1.bpath,Form1.rdt,Form1.dist,Form1.codedbf);
        SetDefault;
        Open;
        oldid := StrToInt(Edit4.Text);
      end
      else begin
        ShowMessage('Комбинация плиты и кода должна быть уникальной!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm23.Button2Click(Sender: TObject);
{ изменить тариф }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '')and (Edit4.Text <> '')and (Edit5.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_el');
      SQl.Add('from el');
      SQl.Add('where (id_el=:id)and(id_dist=:idd)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      ParamByName('idd').AsInteger := Form1.dist;
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_el').AsInteger = oldid) then begin
        if IsEmpty then
          flag := false
        else begin
          Close;
          SQL.Clear;
          SQl.Add('select id_el');
          SQl.Add('from el');
          SQl.Add('where (id_el=:id)and(id_dist=:idd)and(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('idd').AsInteger := Form1.dist;
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
        SQl.Add('select id_el');
        SQl.Add('from el');
        SQl.Add('where (plate=:plate)and(id_dist=:idd)');
        ParamByName('plate').AsString := Edit1.Text;
        ParamByName('idd').AsInteger := Form1.dist;
        Open;
        if IsEmpty or not IsEmpty and (FieldByName('id_el').AsInteger = oldid) then begin
          if not flag then begin
            Close;
            SQL.Clear;
            SQL.Add('insert into el');
            SQL.Add('values (:idd,Convert(smalldatetime,:d,104),:id,:name,:tarif1,:tarif2,:tarif3)');
            ParamByName('id').AsInteger := StrToInt(Edit4.Text);
          end
          else begin
            Close;
            SQL.Clear;
            SQL.Add('update el');
            SQL.Add('set plate=:name,tarifel1=:tarif1,tarifel2=:tarif2,tarifel3=:tarif3');
            SQL.Add('where (id_el = :id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
            ParamByName('id').AsInteger := oldid;
          end;
          ParamByName('idd').AsInteger := Form1.dist;
          ParamByName('d').AsString := Form1.rdt;
          ParamByName('name').AsString := Edit1.Text;
          ParamByName('tarif1').AsFloat := StrToFloat(Edit2.Text);
          ParamByName('tarif2').AsFloat := StrToFloat(Edit3.Text);
          ParamByName('tarif3').AsFloat := StrToFloat(Edit5.Text);
          ExecSQL;
          FillEl(Form1.bpath,Form1.rdt,Form1.dist,Form1.codedbf);
          oldid := StrToInt(Edit4.Text);
        end
        else
          ShowMessage('Комбинация плиты и кода должна быть уникальной!');
      end
      else
        ShowMessage('Комбинация плиты и кода должна быть уникальной!');
    end;
    SetDefault;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm23.Button3Click(Sender: TObject);
{ удалить тариф }
begin
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from el');
    SQl.Add('where (id_el=:id)and(sdate=Convert(smalldatetime,:d,104))and(id_dist=:idd)');
    ParamByName('idd').AsInteger := Form1.dist;
    ParamByName('d').AsString := Form1.rdt;
    ParamByName('id').AsInteger := oldid;
    ExecSQL;
    FillEl(Form1.bpath,Form1.rdt,Form1.dist,Form1.codedbf);
  end;
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
end;

procedure TForm23.DBGrid1CellClick(Column: TColumn);
{ выбрана ячейка }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  SetDefault;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
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

procedure TForm23.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  Datamodule1.Query4.Close;
end;

procedure TForm23.Edit1Enter(Sender: TObject);
begin
  if IsRus(Edit1.Text) then
    Edit1.Font.Color := clWindowText
  else begin
    Edit1.Font.Color := clRed;
    ShowMessage('Можно использовать буквы только кириллицы!');
  end;
end;

procedure TForm23.Edit4Exit(Sender: TObject);
begin
  CheckInt(Edit4);
end;

procedure TForm23.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    checkInt(edit4);
end;

procedure TForm23.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm23.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    checkrus(edit1);
end;

procedure TForm23.Edit2Exit(Sender: TObject);
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm23.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SetPoint(TEdit(Sender));
end;

end.
