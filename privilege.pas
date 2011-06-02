unit privilege;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  DBCtrls;

type
  TForm12 = class(TForm)
    Label1:       TLabel;
    GroupBox1:    TGroupBox;
    GroupBox2:    TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox3:    TGroupBox;
    Label36:      TLabel;
    Label37:      TLabel;
    Label38:      TLabel;
    Label39:      TLabel;
    Label40:      TLabel;
    Label41:      TLabel;
    Label42:      TLabel;
    Label44:      TLabel;
    Label45:      TLabel;
    Label2:       TLabel;
    Label3:       TLabel;
    Label4:       TLabel;
    Label5:       TLabel;
    Label6:       TLabel;
    CheckBox1:    TCheckBox;
    CheckBox2:    TCheckBox;
    CheckBox3:    TCheckBox;
    CheckBox4:    TCheckBox;
    CheckBox5:    TCheckBox;
    Label7:       TLabel;
    CheckBox6:    TCheckBox;
    Label8:       TLabel;
    CheckBox7:    TCheckBox;
    Label9:       TLabel;
    CheckBox8:    TCheckBox;
    Label10:      TLabel;
    CheckBox9:    TCheckBox;
    Button1:      TButton;
    Button2:      TButton;
    Edit2:        TEdit;
    Edit3:        TEdit;
    Edit4:        TEdit;
    Edit5:        TEdit;
    Edit6:        TEdit;
    Edit7:        TEdit;
    Edit8:        TEdit;
    Edit9:        TEdit;
    Edit10:       TEdit;
    Edit1:        TEdit;
    Label11:      TLabel;
    Edit11:       TEdit;
    Label12:      TLabel;
    Edit12:       TEdit;
    Label13:      TLabel;
    CheckBox10:   TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    sec:    integer;
    oldid:  integer;//текущая льгота
    status: integer;//0 - открыта для добавления, 1 - открыта для изменения,
  public
    procedure Add;
    procedure Modify;
    procedure Del;
    procedure Clear;
  end;

var
  Form12: TForm12;

implementation

uses
  datamodule,
  chpriv,
  main,
  service;

{$R *.dfm}

procedure TForm12.Clear;
begin
  Edit1.Text  := '';
  Edit2.Text  := '';
  Edit3.Text  := '';
  Edit4.Text  := '';
  Edit5.Text  := '';
  Edit6.Text  := '';
  Edit7.Text  := '';
  Edit8.Text  := '';
  Edit9.Text  := '';
  Edit10.Text := '';
  Edit11.Text := '';
  Edit12.Text := '';
  Checkbox1.Checked := False;
  Checkbox2.Checked := False;
  Checkbox3.Checked := False;
  Checkbox4.Checked := False;
  Checkbox5.Checked := False;
  Checkbox6.Checked := False;
  Checkbox7.Checked := False;
  Checkbox8.Checked := False;
  Checkbox9.Checked := False;
  Checkbox10.Checked := False;
  Radiobutton1.Checked := True;
  Radiobutton2.Checked := False;
  Radiobutton4.Checked := True;
  Radiobutton5.Checked := False;
end;

procedure TForm12.Add;
{ добавить льготу }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') and (Edit6.Text <> '') and (Edit7.Text <> '') and (Edit8.Text <> '') and (Edit9.Text <> '') and (Edit10.Text <> '') and (Edit11.Text <> '') and (Edit12.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_priv');
      SQL.Add('from priv');
      SQL.Add('where (id_priv=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit11.Text));
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_priv');
        SQL.Add('from priv');
        SQL.Add('where (namepriv = :name)');
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
        SQL.Add('insert into priv');
        SQL.Add('values (:id, :name, :sq, :lev,');
        SQL.Add(':pcont,:fcont,:prep,:frep,:pcold,:fcold,:phot,:fhot,');
        SQL.Add(':pcanal,:fcanal,:pheat,:fheat,:pgas,:fgas,:pel,:fel,');
        SQL.Add(':pwood,:fwood,:pcoal,:fcoal)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', StrToInt(Edit11.Text));
        SetParam(Parameters, 'name', Edit1.Text);
        if RadioButton1.Checked = True then
          SetParam(Parameters, 'sq', 0) //вся)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'sq', 1);//соцнорма
        if RadioButton4.Checked = True then
          SetParam(Parameters, 'lev', 0)//региональный)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'lev', 1);//федеральный
        SetParam(Parameters, 'pcont', StrToInt(Edit2.Text));
        SetParam(Parameters, 'prep', StrToInt(Edit3.Text));
        SetParam(Parameters, 'pcold', StrToInt(Edit4.Text));
        SetParam(Parameters, 'phot', StrToInt(Edit5.Text));
        SetParam(Parameters, 'pcanal', StrToInt(Edit12.Text));
        SetParam(Parameters, 'pheat', StrToInt(Edit6.Text));
        SetParam(Parameters, 'pgas', StrToInt(Edit7.Text));
        SetParam(Parameters, 'pel', StrToInt(Edit8.Text));
        SetParam(Parameters, 'pwood', StrToInt(Edit9.Text));
        SetParam(Parameters, 'pcoal', StrToInt(Edit10.Text));
        if Checkbox1.Checked = True then
          SetParam(Parameters, 'fcont', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcont', 0);
        if Checkbox2.Checked = True then
          SetParam(Parameters, 'frep', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'frep', 0);
        if Checkbox3.Checked = True then
          SetParam(Parameters, 'fcold', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcold', 0);
        if Checkbox4.Checked = True then
          SetParam(Parameters, 'fhot', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fhot', 0);
        if Checkbox10.Checked = True then
          SetParam(Parameters, 'fcanal', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcanal', 0);
        if Checkbox5.Checked = True then
          SetParam(Parameters, 'fheat', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fheat', 0);
        if Checkbox6.Checked = True then
          SetParam(Parameters, 'fgas', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fgas', 0);
        if Checkbox7.Checked = True then
          SetParam(Parameters, 'fel', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fel', 0);
        if Checkbox8.Checked = True then
          SetParam(Parameters, 'fwood', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fwood', 0);
        if Checkbox9.Checked = True then
          SetParam(Parameters, 'fcoal', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcoal', 0);
        ExecSQL;
        oldid := StrToInt(Edit11.Text);
        Close;
      end
      else
        ShowMessage('Наименование льготы и код должны быть уникальны!');
    end;
  end
  else
    ShowMessage('Все поля должны быть заполнены!');
end;

procedure TForm12.Modify;
{ изменить льготу }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '') and (Edit6.Text <> '') and (Edit7.Text <> '') and (Edit8.Text <> '') and (Edit9.Text <> '') and (Edit10.Text <> '') and (Edit11.Text <> '') and (Edit12.Text <> '') then
  begin
    with DModule.sqlQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_priv');
      SQL.Add('from priv');
      SQL.Add('where (id_priv=:id)');
      Parameters.ParseSQL(SQL.Text, True);
      SetParam(Parameters, 'id', StrToInt(Edit11.Text));
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_priv').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_priv');
        SQL.Add('from priv');
        SQL.Add('where (namepriv = :name)');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'name', Edit1.Text);
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_priv').AsInteger = oldid) then
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
        SQL.Add('update priv');
        SQL.Add('set namepriv=:name,square=:sq,levelp=:lev,');
        SQL.Add('pcont=:pcont,fcont=:fcont,prep=:prep,frep=:frep,');
        SQL.Add('pcold=:pcold,fcold=:fcold,phot=:phot,fhot=:fhot,');
        SQL.Add('pcanal=:pcanal,fcanal=:fcanal,pheat=:pheat,fheat=:fheat,');
        SQL.Add('pgas=:pgas,fgas=:fgas,pel=:pel,fel=:fel,');
        SQL.Add('pwood=:pwood,fwood=:fwood,pcoal=:pcoal,fcoal=:fcoal');
        SQL.Add('where id_priv = :id');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', oldid);
        SetParam(Parameters, 'name', Edit1.Text);
        if RadioButton1.Checked = True then
          SetParam(Parameters, 'sq', 0)//вся)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'sq', 1);
        if RadioButton4.Checked = True then
          SetParam(Parameters, 'lev', 0)//регион)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'lev', 1);
        SetParam(Parameters, 'pcont', StrToInt(Edit2.Text));
        SetParam(Parameters, 'prep', StrToInt(Edit3.Text));
        SetParam(Parameters, 'pcold', StrToInt(Edit4.Text));
        SetParam(Parameters, 'phot', StrToInt(Edit5.Text));
        SetParam(Parameters, 'pcanal', StrToInt(Edit12.Text));
        SetParam(Parameters, 'pheat', StrToInt(Edit6.Text));
        SetParam(Parameters, 'pgas', StrToInt(Edit7.Text));
        SetParam(Parameters, 'pel', StrToInt(Edit8.Text));
        SetParam(Parameters, 'pwood', StrToInt(Edit9.Text));
        SetParam(Parameters, 'pcoal', StrToInt(Edit10.Text));
        if Checkbox1.Checked = True then
          SetParam(Parameters, 'fcont', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcont', 0);
        if Checkbox2.Checked = True then
          SetParam(Parameters, 'frep', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'frep', 0);
        if Checkbox3.Checked = True then
          SetParam(Parameters, 'fcold', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcold', 0);
        if Checkbox4.Checked = True then
          SetParam(Parameters, 'fhot', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fhot', 0);
        if Checkbox10.Checked = True then
          SetParam(Parameters, 'fcanal', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcanal', 0);
        if Checkbox5.Checked = True then
          SetParam(Parameters, 'fheat', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fheat', 0);
        if Checkbox6.Checked = True then
          SetParam(Parameters, 'fgas', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fgas', 0);
        if Checkbox7.Checked = True then
          SetParam(Parameters, 'fel', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fel', 0);
        if Checkbox8.Checked = True then
          SetParam(Parameters, 'fwood', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fwood', 0);
        if Checkbox9.Checked = True then
          SetParam(Parameters, 'fcoal', 1)
        else
          Parameters.ParseSQL(SQL.Text, True);
          SetParam(Parameters, 'fcoal', 0);
        ExecSQL;
        oldid := StrToInt(Edit11.Text);
        Close;
      end
      else
        ShowMessage('Наименование льготы и код должны быть уникальны!');
    end;
  end
  else
    ShowMessage('Все поля должны быть заполнены!');
end;

procedure TForm12.Del;
{ удалить льготу }
begin
  with DModule.sqlQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from priv');
    SQL.Add('where (id_priv = :id)');
    Parameters.ParseSQL(SQL.Text, True);
    SetParam(Parameters, 'id', oldid);
    ExecSQL;
    Close;
  end;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  case status of
    0://добавить льготу
      Add;
    1://изменить льготу
      Modify;
    2://удалить льготу
    begin
      Del;
      Close;
    end;
  end;
end;

procedure TForm12.Button1Click(Sender: TObject);
{ выйти }
begin
  Close;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
{ закрытие формы }
begin
  Clear;
end;

procedure TForm12.FormShow(Sender: TObject);
var
  s: integer;
begin
  if sec = 0 then
    Button2.Enabled := False
  else
    Button2.Enabled := True;
  case status of
    0://добавить льготу
    begin
      Clear;
      Form12.Caption  := 'Добавить льготу';
      Button2.Caption := 'Добавить';
    end;
    1, 2:
    begin
      if status = 1 then
      begin//изменить льготу
        if sec <> 0 then
        begin
          Form12.Caption  := 'Изменить льготу';
          Button2.Caption := 'Изменить';
        end
        else
        begin
          Form12.Caption  := 'Просмотр льготы';
          Button2.Caption := 'Просмотр';
        end;
      end
      else
      begin//удалить льготу
        Form12.Caption  := 'Удалить льготу';
        Button2.Caption := 'Удалить';
      end;
      with DModule.sqlQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from priv');
        SQL.Add('where id_priv = :id');
        SQL.Add('order by namepriv');
        Parameters.ParseSQL(SQL.Text, True);
        SetParam(Parameters, 'id', Form11.priv);
        Open;
        Edit1.Text := FieldByName('namepriv').AsString;
        Edit2.Text := FieldByName('pcont').AsString;
        Edit3.Text := FieldByName('prep').AsString;
        Edit4.Text := FieldByName('pcold').AsString;
        Edit5.Text := FieldByName('phot').AsString;
        Edit12.Text := FieldByName('pcanal').AsString;
        Edit6.Text := FieldByName('pheat').AsString;
        Edit7.Text := FieldByName('pgas').AsString;
        Edit8.Text := FieldByName('pel').AsString;
        Edit9.Text := FieldByName('pwood').AsString;
        Edit10.Text := FieldByName('pcoal').AsString;
        Edit11.Text := IntToStr(Form11.priv);
        s := FieldByName('square').AsInteger;
        if s = 0 then                        //вся площадь
          RadioButton1.Checked := True
        else                                 //соцнорма
          RadioButton2.Checked := True;
        s := FieldByName('levelp').AsInteger;
        if s = 0 then                        //региональный уровень
          RadioButton4.Checked := True
        else                                 //федеральный уровень
          RadioButton5.Checked := True;
        s := FieldByName('fcont').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox1.Checked := True;
        s := FieldByName('frep').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox2.Checked := True;
        s := FieldByName('fcold').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox3.Checked := True;
        s := FieldByName('fhot').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox4.Checked := True;
        s := FieldByName('fcanal').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox10.Checked := True;
        s := FieldByName('fheat').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox5.Checked := True;
        s := FieldByName('fgas').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox6.Checked := True;
        s := FieldByName('fel').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox7.Checked := True;
        s := FieldByName('fwood').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox8.Checked := True;
        s := FieldByName('fcoal').AsInteger;
        if s = 1 then                           //на всю семью
          Checkbox9.Checked := True;
        Close;
      end;
      oldid := StrToInt(Edit11.Text);
    end;
  end;
end;

procedure TForm12.Edit2Exit(Sender: TObject);
begin
  CheckInt(TEdit(Sender));
end;

procedure TForm12.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(TEdit(Sender));
end;

procedure TForm12.Edit1Exit(Sender: TObject);
begin
  CheckRus(edit1);
end;

procedure TForm12.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit1);
end;

end.
