unit heating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TForm19 = class(TForm)
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label1: TLabel;
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
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
    oldid: integer;//������� �������� ����� �� ���������
    procedure SetDefault;
  public
    { Public declarations }
    status: integer;//0 - ������ ��� ������, 1 - ������
  end;

var
  Form19: TForm19;

implementation

uses datamodule, service, main;

{$R *.dfm}

procedure TForm19.SetDefault;
begin
  with DataModule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from curheat');
    SQL.Add('order by nameheat');
  end;
end;

procedure TForm19.Button4Click(Sender: TObject);
{ ����� }
begin
  Form19.Close;
end;

procedure TForm19.Button1Click(Sender: TObject);
{ �������� ����� }
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_heat');
      SQl.Add('from heat');
      SQl.Add('where (id_heat=:id)and(sdate=Convert(smalldatetime,:d,104))');
      SQl.Add('and(nameheat = :name)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      ParamByName('name').AsString := Edit1.Text;
      ParamByName('d').AsString := Form1.rdt;
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Add('insert into heat');
        SQL.Add('values (Convert(smalldatetime,:d,104), :id, :name, :tarif)');
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        DeleteHeat(Form1.dt);
        CreateHeat(Form1.dt);
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('������������ ������ � ��� ������ ���� ���������!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm19.Button2Click(Sender: TObject);
{ �������� ����� }
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')and (Edit3.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_heat');
      SQl.Add('from heat');
      SQl.Add('where (id_heat=:id)and(sdate=Convert(smalldatetime,:d,104))');
      SQl.Add('and(nameheat = :name)');
      ParamByName('id').AsInteger := StrToInt(Edit3.Text);
      ParamByName('name').AsString := Edit1.Text;
      ParamByName('d').AsString := Form1.rdt;
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_heat').AsInteger = oldid) then begin
        if IsEmpty then begin
          Close;
          SQL.Clear;
          SQL.Add('insert into heat');
          SQL.Add('values (Convert(smalldatetime,:d,104), :id, :name, :tarif)');
          ParamByName('id').AsInteger := StrToInt(Edit3.Text);
        end
        else begin
          Close;
          SQL.Clear;
          SQL.Add('update heat');
          SQL.Add('set nameheat = :name, tarifheat = :tarif');
          SQL.Add('where (id_heat = :id)and');
          SQL.Add('(sdate=Convert(smalldatetime,:d,104))');
          ParamByName('id').AsInteger := oldid;
        end;
        ParamByName('d').AsString := Form1.rdt;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('tarif').AsFloat := StrToFloat(Edit2.Text);
        ExecSQL;
        DeleteHeat(Form1.dt);
        CreateHeat(Form1.dt);
        SetDefault;
        Open;
        oldid := StrToInt(Edit3.Text);
      end
      else begin
        ShowMessage('������������ ������ � ��� ������ ���� ���������!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('��� ���� ����� ������ ���� ���������!');
end;

procedure TForm19.Button3Click(Sender: TObject);
{ ������� ����� }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from heat');
      SQl.Add('where (id_heat=:id)and(sdate=Convert(smalldatetime,:d,104))');
      ParamByName('d').AsString := Form1.rdt;
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      DeleteHeat(Form1.dt);
      CreateHeat(Form1.dt);
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := DBGrid1.Fields[2].AsString;
      Edit3.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit3.Text);
    end;
  end;
end;

procedure TForm19.DBGrid1CellClick(Column: TColumn);
{ ������� ������ }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := DBGrid1.Fields[2].AsString;
  Edit3.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit3.Text);
end;

procedure TForm19.Edit2Exit(Sender: TObject);
{ ���� ������ }
begin
  SetPoint(Edit2);
end;

procedure TForm19.FormShow(Sender: TObject);
begin
  CreateHeat(Form1.dt);
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

procedure TForm19.Edit3Exit(Sender: TObject);
begin
  if not IsNumber(Edit3.Text) then begin
    ShowMessage('� ���� ���� ����� ���� ������ �����!');
    Edit3.Text := '';
  end;
end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
  DeleteHeat(Form1.dt);
end;

procedure TForm19.Edit1Enter(Sender: TObject);
begin
  if IsRus(Edit1.Text) then
    Edit1.Font.Color := clWindowText
  else begin
    Edit1.Font.Color := clRed;
    ShowMessage('����� ������������ ����� ������ ���������!');
  end;
end;

end.