unit norm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm27 = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
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
  Form27: TForm27;

implementation

uses datamodule, service, main;

{$R *.dfm}

procedure TForm27.SetDefault;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from norm');
    SQL.Add('order by id_norm');
  end;
end;

procedure TForm27.DBGrid1CellClick(Column: TColumn);
{ выбрана ячейка }
begin
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit6.Text := FlToStr(DBGrid1.Fields[5].AsFloat);
  Edit4.Text := DBGrid1.Fields[0].AsString;
  oldid := StrToInt(Edit4.Text);
end;

procedure TForm27.Button1Click(Sender: TObject);
{ добавить норму }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text<>'') and
    (Edit5.Text <> '') and (Edit6.Text<>'') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_norm');
      SQl.Add('from norm');
      SQL.Add('where (id_norm=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_norm');
        SQl.Add('from norm');
        SQL.Add('where (countp = :count)');
        ParamByName('count').AsString := Edit1.Text;
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
        SQL.Add('insert into norm');
        SQL.Add('values (:id, :count, :sn, :spn, :hn, :hpn)');
        ParamByName('id').AsInteger := StrToInt(Edit4.Text);
        ParamByName('count').AsString := Edit1.Text;
        ParamByName('sn').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('hn').AsFloat := StrToFloat(Edit3.Text);
        ParamByName('spn').AsFloat := StrToFloat(Edit5.Text);
        ParamByName('hpn').AsFloat := StrToFloat(Edit6.Text);
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit4.Text);
      end
      else begin
        ShowMessage('Число человек и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm27.Button2Click(Sender: TObject);
{ изменить норму }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and
    (Edit3.Text <> '') and (Edit4.Text<>'') and
    (Edit5.Text <> '') and (Edit6.Text<>'')then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_norm');
      SQl.Add('from norm');
      SQL.Add('where (id_norm=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit4.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_norm').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_norm');
        SQl.Add('from norm');
        SQL.Add('where (countp = :count)');
        ParamByName('count').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_norm').AsInteger = oldid) then
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
        SQL.Add('update norm');
        SQL.Add('set countp = :count, snorm = :sn, psnorm = :spn, hnorm = :hn, phnorm = :hpn');
        SQL.Add('where (id_norm = :id)');
        ParamByName('id').AsInteger := oldid;
        ParamByName('count').AsString := Edit1.Text;
        ParamByName('sn').AsFloat := StrToFloat(Edit2.Text);
        ParamByName('hn').AsFloat := StrToFloat(Edit3.Text);
        ParamByName('spn').AsFloat := StrToFloat(Edit5.Text);
        ParamByName('hpn').AsFloat := StrToFloat(Edit6.Text);
        ExecSQL;
        SetDefault;
        Open;
        oldid := StrToInt(Edit4.Text);
      end
      else begin
        ShowMessage('Число человек  и код должны быть уникальны!');
        SetDefault;
        Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm27.Button3Click(Sender: TObject);
{ удалить норму }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from norm');
      SQL.Add('where id_norm=:id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
      Open;
      Edit1.Text := DBGrid1.Fields[1].AsString;
      Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
      Edit5.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
      Edit3.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
      Edit6.Text := FlToStr(DBGrid1.Fields[5].AsFloat);
      Edit4.Text := DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit4.Text);
    end;
  end;
end;

procedure TForm27.Button4Click(Sender: TObject);
{ выйти }
begin
  Form27.Close;
end;

procedure TForm27.Edit2Exit(Sender: TObject);
{ ввод нормы площади }
begin
  SetPoint(TEdit(Sender));
end;

procedure TForm27.FormShow(Sender: TObject);
begin
  with DataModule1.Query1 do begin
    SetDefault;
    Open;
  end;
  Edit1.Text := DBGrid1.Fields[1].AsString;
  Edit2.Text := FlToStr(DBGrid1.Fields[2].AsFloat);
  Edit5.Text := FlToStr(DBGrid1.Fields[3].AsFloat);
  Edit3.Text := FlToStr(DBGrid1.Fields[4].AsFloat);
  Edit6.Text := FlToStr(DBGrid1.Fields[5].AsFloat);
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

procedure TForm27.Edit1Exit(Sender: TObject);
begin
  CheckInt(tedit(sender));
end;

procedure TForm27.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule1.norm1.Close;
  DataModule1.norm1.SQL.Clear;
  DataModule1.norm1.SQL.Add('select * from norm');
  DataModule1.norm1.Open;
  Datamodule1.Query1.Close;
end;

procedure TForm27.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckInt(tedit(sender));
end;

procedure TForm27.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SetPoint(TEdit(sender));
end;

end.
