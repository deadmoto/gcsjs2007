unit coal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm22 = class(TForm)
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
    oldid: integer;//текущие значения полей до изменения
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - только для чтения, 1 - запись
  end;

var
  Form22: TForm22;

implementation

uses datamodule, service, main;

{$R *.dfm}

procedure TForm22.SetDefault;
begin
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from curcoal');
    SQL.Add('order by namecoal');
  end;
end;

procedure TForm22.Button4Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm22.Button1Click(Sender: TObject);
{ добавить тариф }
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_coal');
      SQl.Add('from coal');
      SQl.Add('where (id_coal=:id)and(sdate=Convert(smalldatetime,:d,104))');
      SQl.Add('and(namecoal = :name)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      ParamByName('name').AsString := Edit1.Text;
      ParamByName('d').AsString := Form1.rdt;
      Open;
      if IsEmpty  then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into coal');
        SQL.Add('values (Convert(smalldatetime,:d,104), :id, :name, :tarif)');
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('d').AsString := Form1.rdt;
        ExecSQL;
        DeleteCoal(Form1.dt);
        CreateCoal(Form1.dt);
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('Наименование тарифа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm22.Button2Click(Sender: TObject);
{ изменить тариф }
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_coal');
      SQl.Add('from coal');
      SQl.Add('where (id_coal=:id)and(sdate=Convert(smalldatetime,:d,104))');
      SQl.Add('and(namecoal = :name)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      ParamByName('name').AsString := Edit1.Text;
      ParamByName('d').AsString := Form1.rdt;
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_coal').AsInteger = oldid)  then begin
        if IsEmpty then begin
          Close;
          SQL.Clear;
          SQL.Add('insert into coal');
          SQL.Add('values (Convert(smalldatetime,:d,104), :id, :name, :tarif)');
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        end
        else begin
          Close;
          SQL.Clear;
          SQL.Add('update coal');
          SQL.Add('set namecoal = :name, tarifcoal = :tarif');
          SQL.Add('where (id_coal = :id)and');
          SQL.Add('(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('id').AsInteger := oldid;
        end;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        DeleteCoal(Form1.dt);
        CreateCoal(Form1.dt);
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('Наименование тарифа и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm22.Button3Click(Sender: TObject);
{ удалить тариф }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from coal');
      SQl.Add('where (id_coal=:id)and(sdate=Convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := Form1.rdt;
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      DeleteCoal(Form1.dt);
      CreateCoal(Form1.dt);
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[2].AsString;
      Edit3.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit3.Text);
    end;
  end;
end;

procedure TForm22.DBGrid1CellClick(Column: TColumn);
{ выбрана ячейка }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm22.FormShow(Sender: TObject);
begin
  CreateCoal(Form1.dt);
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
  if status=0 then begin
    Button1.Enabled := false;
    Button2.Enabled := false;
    Button3.Enabled := false;
  end;
end;

procedure TForm22.Edit3Exit(Sender: TObject);
begin
  if not IsNumber(Edit3.Text) then begin
    ShowMessage('В этом поле может быть только число!');
    Edit3.Text := '';
  end;
end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  DeleteCoal(Form1.dt);
end;

procedure TForm22.Edit2Exit(Sender: TObject);
{ ввод тарифа }
begin
  SetPoint(Edit2);
end;

procedure TForm22.Edit1Enter(Sender: TObject);
begin
  if IsRus(Edit1.Text) then
    Edit1.Font.Color := clWindowText
  else begin
    Edit1.Font.Color := clRed;
    ShowMessage('Можно использовать буквы только кириллицы!');
  end;
end;

end.
