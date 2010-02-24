unit uReportData;

interface

uses
  Classes, Controls, Dialogs, ExtCtrls, Forms, Graphics, Messages, StdCtrls,
  SysUtils, Variants, Windows, Grids;

const
  cSolut : array[0..2] of WideString = (
    'Неуплата текущих платежей за жилое помещение и коммунальные услуги в течение 2 месяцев.',
    'Невыполнение условий соглашения по погашению задолженности.',
    ('Неисполнение требований по предоставлению в течение одного месяца документов, подтверждающих' +
      ' события, влекущие прекращение права на получение субсидии (изменение места постоянного жительства' +
      ' получателя субсидии, основания проживания, состава семьи, гражданства получателя субсидии и (или) ' +
      'членов его семьи, материального положения получателя субсидии и (или) членов его семьи).'
      )
    );

  cSolutb : array[0..2] of WideString = (
    'наличие уважительных причин (стационарное лечение, смерть близких родственников, невыплата заработной платы в срок и др.) вне зависимости от условий приостановления предоставления субсидии;',
    'полное погашение задолженности, образовавшейся в течение всего срока предоставления субсидии (в случае возникновения задолженности впервые - при согласовании срока погашения задолженности);',
    ('выполнение требований по предоставлению документов в течение одного месяца с даты ' +
      'приостановления предоставления субсидии, подтверждающих события, влекущие прекращение ' +
      'права на получение субсидии  (изменение места постоянного жительства получателя субсидии, ' +
      'основания проживания, состава семьи, гражданства получателя субсидии и (или) членов его семьи, ' +
      'материального положения получателя субсидии и (или) членов его семьи).'
      )
     );

  cSolute : array[0..3] of WideString = (
    'Изменение места постоянного жительства.',
    'Изменение основания проживания, состава семьи, гражданства получателя субсидии и (или) членов его семьи, материального положения получателя субсидии и (или) членов его семьи.',
    ('Предоставление заявителем (получателем субсидии) и (или) членами его семьи заведомо недостоверной информации, ' +
	    'имеющей существенное значение для предоставления субсидии или определения (изменения) ее размера, либо невыполнение ' +
	    'требований по предоставлению документов, подтверждающих события, влекущие прекращение права на получение субсидии '+
	    '(изменение места постоянного жительства получателя субсидии, основания проживания, состава семьи, гражданства '+
	    'получателя субсидии и (или) членов его семьи, материального положения получателя субсидии и (или) членов его семьи),'+
	    'в течение одного месяца с даты уведомления получателя субсидии о приостановлении предоставления субсидии '+
	    '(при отсутствии уважительной причины ее образования).'),
    'Непогашение задолженности или несогласование срока погашения задолженности в течение одного месяца с даты уведомления о приостановлении предоставления субсидии (при отсутствии уважительной причины ее образования).'
  );
type

  TRepFiles = (rSolut, rSolutb, rSolute, rUvedom, rUvedomo);
  TRepList  = set of TRepFiles;

  TReportDataFrm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1:     TEdit;
    Label1:    TLabel;
    Edit2:     TEdit;
    Label2:    TLabel;
    Edit3:     TEdit;
    Edit4:     TEdit;
    Label3:    TLabel;
    Button1:   TButton;
    GroupBox4: TGroupBox;
    Edit6:     TEdit;
    Panel1:    TPanel;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Edit5:     TEdit;
    GroupBox5: TGroupBox;
    Edit7: TEdit;
    GroupBox6: TGroupBox;
    Edit8: TEdit;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Click(Sender: TObject);
  private
    function ReturnCheckedRow: integer;
  public
    { Public declarations }
    RepType: TRepFiles;
  end;

var
  ReportDataFrm: TReportDataFrm;

implementation

uses
  main, service;

{$R *.dfm}

procedure TReportDataFrm.Button1Click(Sender: TObject);
begin
  //  Form1.ARepData:=allocmem(sizeof(PAdditionRepData));
  if (Edit1.Text <> '') then
    Form1.ARepData.Num1 := Edit1.Text;
  if (Edit2.Text <> '') then
    Form1.ARepData.Num2 := Edit2.Text;
  if (Edit3.Text <> '') then
    Form1.ARepData.toNum := Edit3.Text;
  if (Edit4.Text <> '') then
    Form1.ARepData.soluteNum := Edit4.Text;
  if (Edit6.Text <> '') then
    Form1.ARepData.zipCode := Edit6.Text;
  if (Edit7.Text <> '') then
    Form1.ARepData.StartDate := Edit7.Text;
  if (Edit8.Text <> '') then
    Form1.ARepData.sumBeg := Edit8.Text;

  if CheckBox1.Checked = False then
    if (Edit5.Text <> '') then
      Form1.ARepData.spec2 := Edit5.Text;

  if ReturnCheckedRow <> -1 then
    Form1.ARepData.basetext := StringGrid1.Cells[1,ReturnCheckedRow];
  
  Form1.ARepData.insp := CheckBox1.Checked;
  Close;
end;

procedure TReportDataFrm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    GroupBox3.Enabled := False;
    Edit5.Text := '';
  end
  else
    GroupBox3.Enabled := True;
end;

procedure TReportDataFrm.FormShow(Sender: TObject);

  procedure EnableAll;
  begin
    GroupBox1.Enabled := True;
    GroupBox2.Enabled := True;
    GroupBox4.Enabled := True;
    GroupBox5.Enabled := True;
    GroupBox6.Enabled := True;
    Panel1.Enabled := True;

    GroupBox1.Color := clActiveBorder;
    GroupBox2.Color := clActiveBorder;
    GroupBox4.Color := clActiveBorder;
    GroupBox5.Color := clActiveBorder;
    GroupBox6.Color := clActiveBorder;
    Panel1.Color := clActiveBorder;
    ScrollBox1.Visible := False;
  end;

  procedure FormBaseText;
  var
    i: integer;
  begin
    with StringGrid1 do
    begin
      case RepType of
        rSolut:
          RowCount := length(cSolut);
        rSolutb:
          RowCount := length(cSolutb);
        rSolute:
          RowCount := length(cSolute);
      end;

      ColWidths[0] := 20;
      ColWidths[1] := Width - 30;
      for i := 0 to RowCount - 1 do
      begin
        case RepType of
          rSolut:
            Cells[1,i] := cSolut[i];
          rSolutb:
            Cells[1,i] := cSolutb[i];
          rSolute:
            Cells[1,i] := cSolute[i];
        end;
      end;
      ScrollBox1.Visible := True;
      StringGrid1.Refresh;
    end;
  end;

begin
  case RepType of
    rSolut:
    begin
      EnableAll();
      GroupBox5.Enabled := False;
      GroupBox6.Enabled := False;

      GroupBox5.Color := clBtnFace;
      GroupBox6.Color := clBtnFace;

      FormBaseText;
    end;

    rSolutb:
    begin
      EnableAll();
      GroupBox4.Enabled := False;
      GroupBox4.Color := clBtnFace;

      FormBaseText;
    end;

    rSolute:
    begin
      EnableAll();
      GroupBox6.Enabled := False;
      GroupBox6.Color := clBtnFace;

      FormBaseText;
    end;

    rUvedomo:
    begin
      EnableAll();
      GroupBox1.Enabled := False;
      GroupBox4.Enabled := False;
      GroupBox5.Enabled := False;
      GroupBox6.Enabled := False;

      GroupBox1.Color := clBtnFace;
      GroupBox4.Color := clBtnFace;
      GroupBox5.Color := clBtnFace;
      GroupBox6.Color := clBtnFace;
    end;
  end;
end;

function TReportDataFrm.ReturnCheckedRow: integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to StringGrid1.RowCount - 1 do
    if StringGrid1.Objects[0, i] is TRadioButton then
      if TRadioButton(StringGrid1.Objects[0, i]).Checked then
        Result := i;
end;

procedure TReportDataFrm.StringGrid1Click(Sender: TObject);
begin
  if (Sender as TStrinGgrid).Objects[0, (Sender as TStrinGgrid).Row] is TRadioButton then
    TRadioButton((Sender as TStrinGgrid).Objects[0, (Sender as TStrinGgrid).Row]).Checked := True;
end;

procedure TReportDataFrm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  r: TRect;
  H: integer;
  buffer: string;
begin
  if ACol = 0 then
    if assigned(((Sender as TStrinGgrid).Objects[ACol, ARow]) as TRadioButton) then
    begin
      //FixObjPosn((Sender as TStrinGgrid), ACol, ARow);
      r := (Sender as TStrinGgrid).CellRect(ACol,ARow);
//      r.Left := r.Left + (Sender as TStrinGgrid).Left;
//      r.Right := r.Right + (Sender as TStrinGgrid).Left;
//      r.Top := r.Top + (Sender as TStrinGgrid).Top;
//      r.Bottom := r.Bottom + (Sender as TStrinGgrid).Top;
//      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).BoundsRect := r;
      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).Left := StringGrid1.Left + r.Left+1;
      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).Top := StringGrid1.Top + r.Top+1;
      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).Width := r.Right - r.Left;
      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).Height := r.Bottom - r.Top;


      TRadioButton((Sender as TStrinGgrid).Objects[ACol, ARow]).Visible := True;
    end
    else
    begin
      (Sender as TStrinGgrid).Objects[ACol,ARow] := TRadioButton.Create(ScrollBox1);
      TRadioButton(StringGrid1.Objects[ACol,ARow]).Visible := False;
      TRadioButton(StringGrid1.Objects[ACol,ARow]).Parent := ScrollBox1;
    end;

  with (Sender as TStrinGgrid) do
  if (Canvas.TextWidth(Cells[ACol, ARow]) > ColWidths[ACol]) then
    begin
      (Sender as TStrinGgrid).Canvas.FillRect(Rect);
      buffer:= (Sender as TStrinGgrid).Cells[ACol, ARow];
      Inc(Rect.Left,3);
      Dec(Rect.Right,3);
      H := DrawText((Sender as TStrinGgrid).Canvas.Handle, PChar(buffer),
        length(buffer), Rect, DT_WORDBREAK);
      if H > (Sender as TStrinGgrid).RowHeights[ARow] then
        (Sender as TStrinGgrid).RowHeights[ARow] := H;
    end;
end;

end.
