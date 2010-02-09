unit uGenRefBook;

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
  TFormMode = (
    mOwnType { справочник типов владения },
    mCertification, { справочник типов аттестации }
    mSettlingType,  { справочник типов заселения }
    mControl,       { справочник типов контроля }
    mRelation       { справочник отношений }
    );

  TGenRefBookFrm = class(TForm)
    Panel1:      TPanel;
    StringGrid1: TStringGrid;
    Panel2:      TPanel;
    Label1:      TLabel;
    Edit1:       TEdit;
    Edit2:       TEdit;
    Label2:      TLabel;
    FlowPanel1:  TFlowPanel;
    Button1:     TButton;
    Button2:     TButton;
    Button3:     TButton;
    Button4:     TButton;
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
    { Private declarations }
    oldid: integer;
    procedure SetDefault;

    procedure mOwnTypeAdd(Sender: TObject);
    procedure mOwnTypeEdit(Sender: TObject);
    procedure mOwnTypeDelete(Sender: TObject);

    procedure mCertificationAdd(Sender: TObject);
    procedure mCertificationEdit(Sender: TObject);
    procedure mCertificationDelete(Sender: TObject);

    procedure mSettlingTypeAdd(Sender: TObject);
    procedure mSettlingTypeEdit(Sender: TObject);
    procedure mSettlingTypeDelete(Sender: TObject);

    procedure mControlAdd(Sender: TObject);
    procedure mControlEdit(Sender: TObject);
    procedure mControlDelete(Sender: TObject);

    procedure mRelationAdd(Sender: TObject);
    procedure mRelationEdit(Sender: TObject);
    procedure mRelationDelete(Sender: TObject);
  public
    { Public declarations }
    status: integer;
    mode:   TFormMode;
  end;

var
  GenRefBookFrm: TGenRefBookFrm;

implementation

uses
  DataModule,
  service;

{$R *.dfm}

procedure TGenRefBookFrm.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TGenRefBookFrm.Edit1Exit(Sender: TObject);
begin
  CheckInt(Edit1);
end;

procedure TGenRefBookFrm.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckInt(edit1);
end;

procedure TGenRefBookFrm.Edit2Exit(Sender: TObject);
begin
  CheckRus(edit2);
end;

procedure TGenRefBookFrm.Edit2KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = vk_return then
    CheckRus(edit2);
end;

procedure TGenRefBookFrm.FormShow(Sender: TObject);
begin
  SetDefault;

  case mode of
    mOwnType:
    begin
      Button1.OnClick := mOwnTypeAdd;
      Button2.OnClick := mOwnTypeEdit;
      Button3.OnClick := mOwnTypeDelete;
      GenRefBookFrm.Caption := 'Типы владения';
    end;

    mCertification:
    begin
      Button1.OnClick := mCertificationAdd;
      Button2.OnClick := mCertificationEdit;
      Button3.OnClick := mCertificationDelete;
      GenRefBookFrm.Caption := 'Типы аттестации';
    end;

    mSettlingType:
    begin
      Button1.OnClick := mSettlingTypeAdd;
      Button2.OnClick := mSettlingTypeEdit;
      Button3.OnClick := mSettlingTypeDelete;
      GenRefBookFrm.Caption := 'Типы заселения';
    end;

    mControl:
    begin
      Button1.OnClick := mControlAdd;
      Button2.OnClick := mControlEdit;
      Button3.OnClick := mControlDelete;
      GenRefBookFrm.Caption := 'Типы контроля';
    end;

    mRelation:
    begin
      Button1.OnClick := mRelationAdd;
      Button2.OnClick := mRelationEdit;
      Button3.OnClick := mRelationDelete;
      GenRefBookFrm.Caption := 'Типы отношений';
    end;

  end;

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

procedure TGenRefBookFrm.mCertificationAdd(Sender: TObject);
{ добавить тип аттестации }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_cert');
      SQL.Add('from cert');
      SQL.Add('where (id_cert=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_cert');
        SQL.Add('from cert');
        SQL.Add('where (namecert = :name)');
        ParamByName('name').AsString := Edit2.Text;
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
        SQL.Add('insert into cert');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit1.Text);
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа аттестации и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mCertificationDelete(Sender: TObject);
{ удалить тип аттестации}
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from cert');
      SQL.Add('where id_cert = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TGenRefBookFrm.mCertificationEdit(Sender: TObject);
{ изменить тип аттестации }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_cert');
      SQL.Add('from cert');
      SQL.Add('where (id_cert=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty or not IsEmpty and (FieldByName('id_cert').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_cert');
        SQL.Add('from cert');
        SQL.Add('where (namecert = :name)');
        ParamByName('name').AsString := Edit2.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_cert').AsInteger = oldid) then
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
        SQL.Add('update cert');
        SQL.Add('set namecert = :name');
        SQL.Add('where id_cert = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа аттестации и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mControlAdd(Sender: TObject);
{ добавить тип контроля }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_cntrl');
      SQL.Add('from cntrl');
      SQL.Add('where (id_cntrl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_cntrl');
        SQL.Add('from cntrl');
        SQL.Add('where (namecntrl = :name)');
        ParamByName('name').AsString := Edit2.Text;
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
        SQL.Add('insert into cntrl');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit1.Text);
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа контроля и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mControlDelete(Sender: TObject);
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from cntrl');
      SQL.Add('where id_cntrl = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TGenRefBookFrm.mControlEdit(Sender: TObject);
{ изменить тип контроля }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_cntrl');
      SQL.Add('from cntrl');
      SQL.Add('where (id_cntrl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_cntrl').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_cntrl');
        SQL.Add('from cntrl');
        SQL.Add('where (namecntrl = :name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_cntrl').AsInteger = oldid) then
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
        SQL.Add('update cntrl');
        SQL.Add('set namecntrl = :name');
        SQL.Add('where id_cntrl = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа контроля и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mOwnTypeAdd(Sender: TObject);
{ добавить тип владения }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_own');
      SQL.Add('from own');
      SQL.Add('where (id_own=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_own');
        SQL.Add('from own');
        SQL.Add('where (nameown = :name)');
        ParamByName('name').AsString := Edit2.Text;
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
        SQL.Add('insert into own');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit1.Text);
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа владения и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mOwnTypeDelete(Sender: TObject);
{ удалить тип владения }
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from own');
      SQL.Add('where id_own = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TGenRefBookFrm.mOwnTypeEdit(Sender: TObject);
{ изменить тип владения }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_own');
      SQL.Add('from own');
      SQL.Add('where (id_own=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_own').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_own');
        SQL.Add('from own');
        SQL.Add('where (nameown = :name)');
        ParamByName('name').AsString := Edit2.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_own').AsInteger = oldid) then
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
        SQL.Add('update own');
        SQL.Add('set nameown = :name');
        SQL.Add('where id_own = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа владения и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mRelationAdd(Sender: TObject);
{ добавить отношение }
var
  flag: boolean;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_rel');
      SQL.Add('from rel');
      SQL.Add('where (id_rel=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_rel');
        SQL.Add('from rel');
        SQL.Add('where (namerel = :name)');
        ParamByName('name').AsString := Edit2.Text;
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
        SQL.Add('insert into rel');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit1.Text);
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mRelationDelete(Sender: TObject);
{ удалить отношение }
begin
  if Edit2.Text <> 'клиент' then
    with DataModule1.Query1 do
    begin
      if not IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from rel');
        SQL.Add('where (id_rel = :id)');
        ParamByName('id').AsInteger := oldid;
        ExecSQL;
        SetDefault;
      end;
    end
  else
    ShowMessage('Эту запись удалить нельзя!');
end;

procedure TGenRefBookFrm.mRelationEdit(Sender: TObject);
{ изменить отношение }
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_rel');
      SQL.Add('from rel');
      SQL.Add('where (id_rel=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_rel').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_rel');
        SQL.Add('from rel');
        SQL.Add('where (namerel = :name)');
        ParamByName('name').AsString := Edit2.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_rel').AsInteger = oldid) then
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
        SQL.Add('update rel');
        SQL.Add('set namerel = :name');
        SQL.Add('where (id_rel = :id)');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mSettlingTypeAdd(Sender: TObject);
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_settl');
      SQL.Add('from settl');
      SQL.Add('where (id_settl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_settl');
        SQL.Add('from settl');
        SQL.Add('where (namesettl = :name)');
        ParamByName('name').AsString := Edit2.Text;
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
        SQL.Add('insert into settl');
        SQL.Add('values (:id, :name)');
        ParamByName('id').AsInteger  := StrToInt(Edit1.Text);
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа заселения и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.mSettlingTypeDelete(Sender: TObject);
{*******************************************************************************
  Процедура Button3Click обрабатывает нажатие клавиши Удалить на форме. Из таблицы
  удаляется запись, которая соответствует текущему id.
*******************************************************************************}
begin
  with DataModule1.Query1 do
  begin
    if not IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from settl');
      SQL.Add('where id_settl = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
    end;
  end;
end;

procedure TGenRefBookFrm.mSettlingTypeEdit(Sender: TObject);
{*******************************************************************************
  Процедура Button2Click обрабатывает нажатие клавиши Изменить на форме.
  Если все поля ввода заполнены, то проверяется существует ли в таблице запись с
  такими данными. Если не существует, то происходит добавление записи в таблицу.
  Если в таблице существует запись с таким же id, но наименование другое и не
  совпадает с наименование других записей, то происходит изменение записи.
  Если хотя бы одно поле ввода не заполнено или в таблице наименование совпадает
  с наименованием другой записи, то изменения не происходит и выдается
  соответствующее сообщение.
*******************************************************************************}
var
  flag: bool;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    with DataModule1.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_settl');
      SQL.Add('from settl');
      SQL.Add('where (id_settl=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit1.Text);
      Open;
      if IsEmpty or not IsEmpty and
        (FieldByName('id_settl').AsInteger = oldid) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select id_settl');
        SQL.Add('from settl');
        SQL.Add('where (namesettl = :name)');
        ParamByName('name').AsString := Edit2.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_settl').AsInteger = oldid) then
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
        SQL.Add('update settl');
        SQL.Add('set namesettl = :name');
        SQL.Add('where id_settl = :id');
        ParamByName('id').AsInteger  := oldid;
        ParamByName('name').AsString := Edit2.Text;
        ExecSQL;
        SetDefault;
      end
      else
      begin
        ShowMessage('Наименование типа заселения и код должны быть уникальны!');
        SetDefault;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TGenRefBookFrm.SetDefault;
var
  i: integer;
begin
  case mode of
    mOwnType:
    begin
      with Datamodule1.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from own');
        SQL.Add('order by id_own');
        Open;
        First;
      end;

      FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование'),
        TIntArray.Create(25, 225), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount + 1 do
      begin
        with StringGrid1 do
        begin
          Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_own').AsString;
          Cells[1, i + 1] := Datamodule1.Query1.FieldByName('nameown').AsString;
        end;
        Datamodule1.Query1.Next;
      end;
    end;
    {******************************************************************************}
    mCertification:
    begin
      with Datamodule1.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from cert');
        SQL.Add('order by id_cert');
        Open;
        First;
      end;

      FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование'),
        TIntArray.Create(25, 225), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount + 1 do
      begin
        with StringGrid1 do
        begin
          Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_cert').AsString;
          Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namecert').AsString;
        end;
        Datamodule1.Query1.Next;
      end;
    end;
    {******************************************************************************}
    mSettlingType:
    begin
      with Datamodule1.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from settl');
        SQL.Add('order by id_settl');
        Open;
        First;
      end;

      FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование'),
        TIntArray.Create(25, 225), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount + 1 do
      begin
        with StringGrid1 do
        begin
          Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_settl').AsString;
          Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namesettl').AsString;
        end;
        Datamodule1.Query1.Next;
      end;
    end;
    {******************************************************************************}
    mControl:
    begin
      with Datamodule1.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from cntrl');
        SQL.Add('order by id_cntrl');
        Open;
        First;
      end;

      FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование'),
        TIntArray.Create(25, 225), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount + 1 do
      begin
        with StringGrid1 do
        begin
          Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_cntrl').AsString;
          Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namecntrl').AsString;
        end;
        Datamodule1.Query1.Next;
      end;
    end;
    {******************************************************************************}
    mRelation:
    begin
      with Datamodule1.Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select *');
        SQL.Add('from rel');
        SQL.Add('order by id_rel');
        Open;
        First;
      end;

      FormerStringGrid(StringGrid1, TStringArray.Create('Код', 'Наименование'),
        TIntArray.Create(25, 225), Datamodule1.Query1.RecordCount + 1);

      for i := 0 to Datamodule1.Query1.RecordCount + 1 do
      begin
        with StringGrid1 do
        begin
          Cells[0, i + 1] := Datamodule1.Query1.FieldByName('id_rel').AsString;
          Cells[1, i + 1] := Datamodule1.Query1.FieldByName('namerel').AsString;
        end;
        Datamodule1.Query1.Next;
      end;
    end;
  end;
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TGenRefBookFrm.StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  if ARow <> 0 then
  begin
    Edit1.Text := StringGrid1.Cells[0, ARow];
    Edit2.Text := StringGrid1.Cells[1, ARow];
    if Edit2.Text <> '' then
      oldid := StrToInt(Edit1.Text);
  end;
end;

end.
