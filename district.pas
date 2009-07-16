unit district;      

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, {Mask, {DBCtrls,} Grids, ExtCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    FlowPanel1: TFlowPanel;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Button5: TButton;
    distGrid: TStringGrid;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure distGridClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

uses datamodule, main, service;

{$R *.dfm}

procedure TForm4.SetDefault;
var i: integer;
begin
  with Datamodule1.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from dist');
    SQL.Add('order by id_dist');
    Open;
  end;

  with distGrid do begin
    cells[0,0]:= 'Код';
    cells[1,0]:= 'Наименование';
    cells[2,0]:= 'Начальник отдела';
    cells[3,0]:= 'Адрес';
    cells[4,0]:= 'Телефон';
    ColWidths[0]:= 25;
    ColWidths[1]:= 90;
    ColWidths[2]:= 100;
    ColWidths[3]:= 120;
    ColWidths[4]:= 90;
  end;

  distGrid.RowCount:= Datamodule1.Query1.RecordCount+1;
  distGrid.Height:= 20*(distGrid.RowCount+1);

  Datamodule1.Query1.First;
  for i:= 0 to Datamodule1.Query1.RecordCount+1 do begin
    with distGrid do begin
      Cells[0,i+1]:= Datamodule1.Query1.FieldByName('id_dist').AsString;
      Cells[1,i+1]:= Datamodule1.Query1.FieldByName('namedist').AsString;
      Cells[2,i+1]:= Datamodule1.Query1.FieldByName('boss').AsString;
      Cells[3,i+1]:= Datamodule1.Query1.FieldByName('adr').AsString;
      Cells[4,i+1]:= Datamodule1.Query1.FieldByName('tel').AsString;
    end;
    Datamodule1.Query1.Next;
  end;

end;

procedure TForm4.Button4Click(Sender: TObject);
{ выйти }
begin
  Form4.Close;
end;

procedure TForm4.Button5Click(Sender: TObject);
var i: shortint;
begin
  for i:=0 to Form4.ComponentCount-1 do
    if Form4.Components[i] is TEdit then TEdit(Form4.Components[i]).Text:='';

    
end;

procedure TForm4.distGridClick(Sender: TObject);
begin
  Edit1.Text := distGrid.Cells[1,distGrid.Row]; //DBGrid1.Fields[1].AsString;
  Edit2.Text := distGrid.Cells[0,distGrid.Row]; //DBGrid1.Fields[0].AsString;
  Edit3.Text := distGrid.Cells[2,distGrid.Row]; //DBGrid1.Fields[2].AsString;
  Edit4.Text := distGrid.Cells[3,distGrid.Row];
  Edit5.Text := distGrid.Cells[4,distGrid.Row];
  oldid := StrToInt(Edit2.Text);
end;

procedure TForm4.Button1Click(Sender: TObject);
{ добавить округ }
var
  flag: bool;
begin
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_dist');
      SQl.Add('from dist');
      SQl.Add('where (id_dist=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_dist');
        SQl.Add('from dist');
        SQl.Add('where (namedist=:name)');
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
        SQL.Add('insert into dist');
        SQL.Add('values (:id, :name, :boss, :adr, :tel)');
        ParamByName('id').AsInteger := StrToInt(Edit2.Text);
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('boss').AsString := Edit3.Text;
        ParamByName('adr').AsString := Edit4.Text;
        ParamByName('tel').AsString := Edit5.Text;
        ExecSQL;
        SetDefault;
//        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
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
  if (Edit1.Text <> '')and(Edit2.Text <> '') then begin
    with DataModule1.Query1 do begin
      Close;
      SQL.Clear;
      SQl.Add('select id_dist');
      SQl.Add('from dist');
      SQl.Add('where (id_dist=:id)');
      ParamByName('id').AsInteger := StrToInt(Edit2.Text);
      Open;
      if IsEmpty or not IsEmpty and
          (FieldByName('id_dist').AsInteger = oldid) then begin
        Close;
        SQL.Clear;
        SQl.Add('select id_dist');
        SQl.Add('from dist');
        SQl.Add('where (namedist=:name)');
        ParamByName('name').AsString := Edit1.Text;
        Open;
        if IsEmpty or not IsEmpty and
          (FieldByName('id_dist').AsInteger = oldid) then
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
        SQL.Add('update dist');
        SQL.Add('set namedist = :name, boss=:boss, adr=:adr, tel=:tel');
        SQL.Add('where id_dist = :id');
        ParamByName('id').AsInteger := oldid;
        ParamByName('name').AsString := Edit1.Text;
        ParamByName('boss').AsString := Edit3.Text;
        ParamByName('adr').AsString := Edit4.Text;
        ParamByName('tel').AsString := Edit5.Text;

        ExecSQL;
        SetDefault;
//        Open;
        oldid := StrToInt(Edit2.Text);
      end
      else begin
        ShowMessage('Наименование округа и код должны быть уникальны!');
        SetDefault;
 //       Open;
      end;
    end;
  end
  else
    ShowMessage('Все поля ввода должны быть заполнены!');
end;

procedure TForm4.Button3Click(Sender: TObject);
{ удалить округ }
begin
  with DataModule1.Query1 do begin
    if not IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Add('delete from dist');
      SQL.Add('where id_dist = :id');
      ParamByName('id').AsInteger := oldid;
      ExecSQL;
      SetDefault;
//      Open;
      Edit1.Text := distGrid.Cells[1,distGrid.Row];//DBGrid1.Fields[1].AsString;
      Edit2.Text := distGrid.Cells[0,distGrid.Row];//DBGrid1.Fields[0].AsString;
      oldid := StrToInt(Edit2.Text);
    end;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);

begin
//  with DataModule1.Query1 do begin
  SetDefault;
//    Open;
//  end;

  Edit1.Text := distGrid.Cells[1,distGrid.Row];//DBGrid1.Fields[1].AsString;
  Edit2.Text := distGrid.Cells[0,distGrid.Row];//DBGrid1.Fields[0].AsString;
  Edit3.Text := distGrid.Cells[2,distGrid.Row];//DBGrid1.Fields[2].AsString;
  oldid := StrToInt(Edit2.Text);
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

procedure TForm4.Edit2Exit(Sender: TObject);
begin
  CheckInt(edit2);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.Query1.Close;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
  CheckRus(TEdit(Sender));
end;

procedure TForm4.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    checkInt(edit2);
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    CheckRus(TEdit(Sender));
end;

end.
