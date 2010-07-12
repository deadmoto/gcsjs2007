unit Client;

interface

uses Controls, Contnrs, Dialogs, sysutils, dateutils, DB, service;

type
  T2DInt = array of array of integer;
  
  TNumbTarifReal = array[0..(numbtarif-1)] of real;
  TNumbTarifInt = array[0..(numbtarif-1)] of smallint;
  TNumbTarifString = array[0..(numbtarif-1)] of string;
  TNumbTarifBool = array[0..(numbtarif-1)] of boolean;

  TCData = packed record
    dist: integer;//округ
    quanpriv: integer;//количество льготников в карте клиента,указанное инспектором
    calc: integer;//тип расчета
    mdd: integer;//мдд
    lsquare: real;//льготная площадь
    square: real;//общая площадь
    settl: integer;//тип заселения
    snorm: real;//норма площади
    hnorm: real;//норма расхода тепла
    psnorm: real;
    phnorm: real;
    mcount: integer;//число человек в семье
    rmcount: integer;//число зарегистрированных человек
    income: real;//совокупный доход семьи
    pmin: real;//прожиточный минимум семьи
    koef: real;//коэффициент СД/ПМ
    rstnd: integer;//региональный стандарт
    indrstnd: boolean;//индивидуальный региональьный стандарт
    indrstndval: real;//значение индивудуального стандарта
    begindate: TDate;//дата начала действия субсидии
    enddate: TDate;//дата окончания действия субсидии
    //------
    prevbegindate: TDate;//дата начала действия субсидии (прошлый период)
    prevenddate: TDate;//дата окончания действия субсидии (прошлый период)
    averageFact: real;//средний размер ф.расходов за прошлый период
    dolgFact: real;//долг за прошлый период
    //curMinus: real;//сумма текущих уменьшений
    //------
    period: integer;//срок субсидии
    boiler: integer;//бойлер 0 - нет, 1 - есть
    family: TObjectList;//семья
    priv: array of integer;//льготы членов семьи
    //данные по льготам семьи
    sq: T2DInt;//на какую площадь льгота распространяется
    pc: T2DInt;//% льготы
    f: T2DInt;//на всю семью распространяется льгота или нет
    min: array of integer;//минимумы членов семьи
    mid: array of real;//среднемесячные доходы членов семей
    tarifs: TNumbTarifInt;//тарифы
    cost: TNumbTarifReal;//значение тарифа по соответствующей услуге
    tarifnorm: TNumbTarifReal;//норматив тарифа по соответствующей услуге
    accounts: TNumbTarifString;//лиц. счета
    //счетчики
    counter: TNumbTarifBool;//есть ли счетчик по соответствующей услуге
    counterdata: TNumbTarifReal;//среднее показание по соответствующей услуге
    countertarifs: TNumbTarifInt;//тарифы для услуг с счетчиком
    countercost: TNumbTarifReal;//значение тарифа по соответствующей услуге с счетчиком
    counternorm: TNumbTarifReal;//норматив тарифа по соответствующей услуге с счетчиком
    //установочные данные
    bpm: TNumbTarifReal;//начисления по каждому тарифу
    bsnpm: TNumbTarifReal;
    bsub: TNumbTarifReal;
    bfpm: TNumbTarifReal;//платежи без учета льготы
    bstndsub : TNumbTarifReal; //субсидия по региональному стандарту на начало периода
    //текущие
    pm: TNumbTarifReal;//начисления по каждому тарифу
    snpm: TNumbTarifReal;//начисления по каждому тарифу
    stndsub : TNumbTarifReal; //субсидия по региональному стандарту
    sub: TNumbTarifReal;//субсидия по каждому тарифу
    fpm: TNumbTarifReal;//платежи без учета льготы

    stop: integer; //сведения по приостановке
    heating: smallint; //тип отопления
  end;

  TData = packed record
    regn: integer;//рег номер клиента
    regdate: TDate;//дата регистрации клиента
    fio: string;//ФИО клиента
    str: integer;//улица
    nh: string;//дом (125а/2) 125а
    corp: string;//корпус (125а/2) 2
    apart: string;//квартира
    tel: string;//телефон
    control: integer;//контроль
    reason: string;//причина постановки на контроль
    settl: integer;//тип заселения
    own: integer;//тип владения
    manager: integer;//распорядитель жилья
    fond: integer;//жилищный фонд
    cert: integer;//аттестация
    insp: integer;//инспектор
    dist: integer;//округ
    bank: integer;//банк
    acbank: string;//псс
    change: TDate;//дата последнего изменения
    declar: TDate;//дата подачи заявления
    mail: integer;//уведомление отправленно или нет (0/1)
  end;

  TClient = class
  public
    data: TData;
    cdata: TCData;
  public
    constructor Create;overload;
    constructor Create(d: TData;dc: TCData);overload;
    destructor Destroy;override;
    function Copy: TClient;
    function GetStandard: real;
    function GetMdd: integer;
    function HaveCounters: boolean;
    procedure Calc(sts: integer);//расчет за месяц
    procedure CalcSub(sts: integer);//расчет субсидии по рег. стандарту
    procedure CalcFinal(sts: integer);
    procedure CalcServ(s: integer);
    procedure calcservsq(service:integer;m:integer=0);//расчёт начислений по площади
    procedure calcserve(service:integer);
    procedure CalcServWC(s: integer);
    function CalcFull(arr: TNumbTarifReal): real;
    procedure CalcPriv;overload;
    procedure CalcPriv(nam: string;serv: integer);overload;
    procedure CalcHNorm(m: integer;var sq1, sq2: real);//вычислить норматив потребления тепла в ч/д
    function SearchOne(m: T2DInt;serv: integer): integer;//выяснить есть ли единица
    procedure SetClient(cl: integer;s: string);//взять данные на клиента
    procedure setcalc(regn: integer; date: string);
    procedure SetNorm;//установить норму
    procedure SetMin;//установить min
  end;

  TMan = class
    public
      fio: string;//ФИО
      birth: TDate;//дата рождения
      pol: integer;//пол
      status: integer;//соц статус
      priv: integer;//льгота
      mid: real;//среднемесячный доход
      rel: integer;//отношение к клиенту
    public
      constructor Create;overload;
      constructor Create(f: string;b: TDate;s,st,p: integer;mi: real;r: integer);overload;
      destructor Destroy;override;
      function Copy: TMan;
  end;

  procedure CopyData(s: TData; var d: TData);overload;
  procedure CopyData(s: TCData; var d: TCData);overload;
  function Empty: TData;
  function EmptyC: TCData;
  function FromSt(s:integer):integer;
  function GetCostTarif(s,id: integer;bdate: TDate;b,c,se:integer): real; //s-тариф,id-тип плиты,b-бойлер,c-mcount,se-тип заселения(settl)
  function GetNormTarif(s,id: integer;bdate: TDate;b,c,se:integer): real;

implementation

uses datamodule, math, main, sclient, min;

constructor TClient.Create;
begin
  inherited Create;
  data := Empty;
  cdata := EmptyC;
end;

constructor TClient.Create(d: TData; dc: TCData);
begin
  inherited Create;
  CopyData(d, data);
  cdata.family := TObjectList.Create;
  CopyData(dc, cdata);
end;

destructor TClient.Destroy;
begin
  inherited Destroy;
  cdata.family.Free;
end;

function TClient.Copy: TClient;
begin
  Result := TClient.Create(data,cdata);
end;

function TClient.HaveCounters: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to numbtarif - 1 do
    if cdata.counter[i] then
      Result := true;
end;

procedure TClient.SetClient(cl: integer;s: string);//Забирает данные клиента из SQLSub
begin
  with DModule.Query1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from cl');
    SQL.Add('where regn = :id');
    ParamByName('id').AsInteger := cl;
    Open;
    data.fio := FieldByName('fio').AsString;
    data.regn := FieldByName('regn').AsInteger;
    data.regdate := FieldByName('rdate').AsDateTime;
    data.change := FieldByName('change').AsDateTime;
    data.declar:= FieldByName('declardate').AsDateTime;
    data.dist := FieldByName('id_dist').AsInteger;
    data.str := FieldByName('id_street').AsInteger;
    data.nh := FieldByName('nhouse').AsString;
    data.corp := FieldByName('corp').AsString;
    data.apart := FieldByName('apart').AsString;
    data.tel := FieldByName('tel').AsString;
    data.settl := FieldByName('id_settl').AsInteger;
    data.mail := FieldByName('mail').AsInteger;
    Close;
    SQL.Clear;
    if Form1.status<>3 then
    begin
      SQL.Add('select *');
      SQL.Add('from hist');
      SQL.Add('where regn = :id and bdate<=convert(smalldatetime,:d,104)');
      SQL.Add('and edate>convert(smalldatetime,:d,104)');
    end
    else
    begin
      SQL.Add('select * ');
      SQL.Add('from hist');
      SQL.Add('where regn=:id and bdate=(select max(bdate) ');
      SQL.Add('from hist where bdate<=convert(smalldatetime,:d,104) and regn=:id)');
    end;
    ParamByName('id').AsInteger := cl;
    ParamByName('d').AsString := s;
    Open;
    data.insp := FieldByName('id_insp').AsInteger;
    data.control := FieldByName('id_cntrl').AsInteger;
    data.reason := FieldByName('reason').AsString;
    data.own := FieldByName('id_own').AsInteger;
    data.manager := FieldByName('id_mng').AsInteger;
    data.fond := FieldByName('id_fond').AsInteger;
    data.cert := FieldByName('id_cert').AsInteger;
    data.bank := FieldByName('id_bank').AsInteger;
    data.acbank := FieldByName('acbank').AsString;
    Close;
  end;
end;

procedure tclient.setcalc(regn: integer; date: string);
{*******************************************************************************
Загружает данные клиента из базы данных. regn - № клиента, date - учётный период
*******************************************************************************}
var
  serv,i:integer;
  man:tman;
begin
  with DModule.query1 do
    begin
      close;
      sql.clear;
      sql.add('select *');
      sql.add('from cl');
      sql.add('where regn = :id');
      parambyname('id').asinteger:=regn;
      open;
      cdata.dist:=form1.dist;
      cdata.lsquare:=fieldbyname('lsquare').asfloat;
      cdata.square:=fieldbyname('square').asfloat;
      cdata.rstnd:=fieldbyname('id_stnd').asinteger;
      cdata.boiler:=fieldbyname('boiler').asinteger;
      cdata.settl:=fieldbyname('id_settl').asinteger;
//
    Close;
    SQL.Clear;
    if Form1.status<>3 then
    begin
      SQL.Add('select *');
      SQL.Add('from hist');
      SQL.Add('where regn=:id and bdate<=convert(smalldatetime,:d,104)');
      SQL.Add('and edate>convert(smalldatetime,:d,104)');
    end
    else
    begin
      SQL.Add('select * ');
      SQL.Add('from hist');
      SQL.Add('where regn=:id and bdate=(select max(bdate) ');
      SQL.Add('from hist where bdate<=convert(smalldatetime,:d,104) and regn=:id)');
    end;
    parambyname('id').asinteger:=regn;
    parambyname('d').asstring:=date;
    Open;
    cdata.calc := FieldByName('calc').AsInteger;
    cdata.mdd := FieldByName('mdd').AsInteger;
    cdata.mcount := FieldByName('mcount').AsInteger;
    cdata.rmcount := FieldByName('rmcount').AsInteger;
    cdata.quanpriv := FieldByName('quanpriv').AsInteger;
    cdata.income := FieldByName('income').AsFloat;
    cdata.pmin := FieldByName('pmin').AsFloat;
    cdata.begindate := FieldByName('bdate').AsDateTime;
    cdata.enddate := FieldByName('edate').AsDateTime;
    if YearOf(cdata.enddate)=YearOf(cdata.begindate) then
      cdata.period := MonthOf(cdata.enddate)-MonthOf(cdata.begindate)
    else
      cdata.period := MonthOf(cdata.enddate)+12-MonthOf(cdata.begindate);
    cdata.heating:= FieldByName('id_heating').AsInteger;
    cdata.indrstnd := FieldByName('indrstnd').Value;
    cdata.indrstndval := FieldByName('indrstndval').Value;
    //------
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT *' + #13 +
      'FROM hist INNER JOIN' + #13 +
  	    '(SELECT regn, max(bdate) as bdate' + #13 +
          'FROM hist' + #13 +
	        'WHERE bdate < convert(smalldatetime,:bdate,104)' + #13 +
        	'GROUP BY regn) sb on hist.regn = sb.regn AND hist.bdate = sb.bdate' + #13 +
      'WHERE hist.regn = :regn';
    ParamByName('regn').AsInteger := data.regn;
    ParamByName('bdate').AsString := DateToStr(cdata.begindate);
    Open;
    //если запись в базе нет (нет прошлого периода)
    if RecordCount = 0 then
    begin
      cdata.prevbegindate := cdata.begindate;
      cdata.prevenddate := cdata.enddate;
    end
    else
    begin
      cdata.prevbegindate := FieldByName('bdate').AsDateTime;
      cdata.prevenddate := FieldByName('edate').AsDateTime;
    end;
    //------
    //------
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT *' + #13 +
      'FROM FactBalance' + #13 +
      'WHERE (regn = :regn) AND (bdate = convert(smalldatetime,:bdate,104))';
    ParamByName('regn').AsInteger := data.regn;
    ParamByName('bdate').AsString := DateToStr(cdata.prevbegindate);
    Open;
    cdata.dolgFact := FieldByName('dolg').AsFloat;
    cdata.averageFact := FieldByName('balance').AsFloat;

    if cdata.dolgFact > 0 then
    begin
      Close;
      SQL.Text := 'SELECT sum(sub) as sumsub' + #13 +
        'FROM Sluj' + #13 +
        'WHERE (regn = :regn) AND (factminus = 1) AND (sdate >= convert(smalldatetime,:bdate,104))' + #13 +
        'AND (sdate < convert(smalldatetime,:edate,104))';
      ParamByName('regn').AsInteger := data.regn;
      ParamByName('bdate').AsString := DateToStr(cdata.begindate);
      ParamByName('edate').AsString := DateToStr(cdata.enddate);
      Open;
      cdata.dolgFact := cdata.dolgFact - FieldByName('sumsub').AsFloat
    end;
    {Close;
    SQL.Clear;
    SQL.Text := 'SELECT sum(curminus) as curminus' + #13 +
      'FROM FactMinus' + #13 +
      'WHERE (regn = :regn) AND (bdate = convert(smalldatetime,:bdate,104)) AND (sdate = convert(smalldatetime,:sdate,104))';
    ParamByName('regn').AsInteger := data.regn;
    ParamByName('bdate').AsString := DateToStr(cdata.begindate);
    ParamByName('sdate').AsString := Form1.rdt;
    Open;
    cdata.curMinus := FieldByName('curminus').AsFloat;
    }
    //------

    Close;
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from fam');
    SQL.Add('where regn = :id');
    SQL.Add('order by fio');
    ParamByName('id').AsInteger :=regn;
    Open;
    First;
    cdata.family := TObjectList.Create;
    cdata.quanpriv := 0;
    while not Eof do
    begin
      man := TMan.Create(FieldByName('fio').AsString,
                        FieldByName('birth').AsDateTime,
                        FieldByName('pol').AsInteger,
                        FieldByName('id_status').AsInteger,
                        FieldByName('id_priv').AsInteger,
                        FieldByName('mid').AsFloat,
                        FieldByName('id_rel').AsInteger);
      cdata.family.Add(Man);
      if FieldByName('id_priv').AsInteger<>0 then
        inc(cdata.quanpriv);
      Next;
    end;
    //базовые данные
    Close;
  //проверка на изменивщееся кол-во семьи
  if cdata.mcount<>cdata.family.count
    then showmessage(inttostr(main.curregn));
//
    SQL.Clear;
    SQL.Add('select *');
    SQL.Add('from sub');
    SQL.Add('where (regn=:id)and(sdate=convert(smalldatetime,:s,104))');
//    SQL.Add('where regn=:id and sdate=(select max(sdate) ');
//    SQL.Add('from sub where sdate<=convert(smalldatetime,:s,104) and regn=:id)');
    SQL.Add('order by regn');
    ParamByName('id').AsInteger :=regn;
    ParamByName('s').AsString := DateToStr(cdata.begindate);
    Open;
    First;
    while not Eof do
    begin
      serv := FieldByName('service').AsInteger;//сервис
      cdata.accounts[serv] := FieldByName('acservice').AsString;
      cdata.tarifs[serv] := FieldByName('id_service').AsInteger;//тариф на него
      cdata.bpm[serv] := FieldByName('pm').AsFloat;//начисления;
      cdata.bsnpm[serv] := FieldByName('snpm').AsFloat;//начисления по сн
      cdata.bsub[serv] := FieldByName('sub').AsFloat;//субсидии по услуге
      cdata.bstndsub[serv] := FieldByName('stndsub').AsFloat;//субсидии по услуге по рег.стандарту
      cdata.bfpm[serv] := FieldByName('spfree').AsFloat;//начисления без учета льгот
      cdata.stop := FieldByName('stop').AsInteger;
      Next;
    end;
    //текущие данные
    Close;
    SQL.Clear;
    SQL.Add('select  *');
    SQL.Add('from sub');
    SQL.Add('where (regn = :id)and(sdate=convert(smalldatetime,:s,104))');
    SQL.Add('order by regn');
    ParamByName('id').AsInteger :=regn;
    ParamByName('s').AsString :=date;
    Open;
    First;
    while not EOF do
    begin
      serv := FieldByName('service').AsInteger;//сервис
      cdata.accounts[serv] := FieldByName('acservice').AsString;
      cdata.tarifs[serv] := FieldByName('id_service').AsInteger;//тариф на него
      cdata.pm[serv] := FieldByName('pm').AsFloat;//начисления;
      cdata.snpm[serv] := FieldByName('snpm').AsFloat;//начисления по сн
      cdata.stndsub[serv] := FieldByName('stndsub').AsFloat;//субсидии по услуге по рег. стандарту
      cdata.sub[serv] := FieldByName('sub').AsFloat;//субсидии по услуге
      cdata.fpm[serv] := FieldByName('spfree').AsFloat;//начисления без учета льгот
      cdata.stop := FieldByName('stop').AsInteger;
      Next;
    end;
    Close;
    //------счетчики
    SQL.Text := 'SELECT * FROM Counters' + #13 +
      'WHERE sdate=convert(smalldatetime,:s,104) AND regn=:r';
    ParamByName('r').AsInteger :=regn;
    ParamByName('s').AsString := DateToStr(cdata.begindate);//date;
    Open;
    First;
    while not EOF do
    begin
      serv := FieldByName('service').AsInteger;
      cdata.counter[serv] := FieldByName('counter').Value;
      cdata.counterdata[serv] := FieldByName('counterdata').Value;
      cdata.countertarifs[serv] := FieldByName('counter_serv').Value;
      Next;
    end;
    //------
    Close;
  end;
  SetNorm;
  SetLength(cdata.priv, cdata.family.Count);
  SetLength(cdata.mid, cdata.family.Count);
  SetLength(cdata.min, cdata.family.Count);
  for i:=0 to cdata.family.count-1 do
  begin
    cdata.priv[i] := TMan(cdata.family.Items[i]).priv;
    cdata.mid[i] := TMan(cdata.family.Items[i]).mid;
    cdata.min[i] := FromSt(TMan(cdata.family.Items[i]).status);
  end;
  CalcPriv;
  if (cdata.mcount=cdata.family.Count) then
    SetMin;
  cdata.koef := (cdata.income/cdata.mcount)/cdata.pmin;
  for i:=0 to numbtarif-1 do
    if (i<8)or(i>11) then
    begin
      cdata.cost[i] := GetCostTarif(i,cdata.tarifs[i],cdata.begindate,cdata.boiler,cdata.rmcount,cdata.settl);
      if i in [2..7] then
        cdata.tarifnorm[i] := GetNormTarif(i,cdata.tarifs[i],cdata.begindate,cdata.boiler,cdata.rmcount,cdata.settl);
      //тарифы по счетчику
      if cdata.counter[i] then
      begin
        cdata.countercost[i] := GetCostTarif(i,cdata.countertarifs[i],cdata.begindate,cdata.boiler,cdata.rmcount,cdata.settl);
        if i in [2..6] then
          cdata.counternorm[i] := GetNormTarif(i,cdata.countertarifs[i],cdata.begindate,cdata.boiler,cdata.rmcount,cdata.settl)
        else
        if (i = 7) then 
          cdata.counternorm[i] := GetNormTarif(i,cdata.tarifs[i],cdata.begindate,cdata.boiler,cdata.rmcount,cdata.settl);
      end;
    end;
end;

procedure TClient.SetNorm;//установить норму
var
  i, priv,mparam: integer;
  flag: boolean;
begin
  flag:=false;
  if cdata.rmcount<>0 then
    with DModule.norm1 do begin
      if cdata.rmcount in [1,2,3,4] then
        mparam:=cdata.rmcount
      else
        mparam:=5;
      open;
      for i:=0 to cdata.family.count-1 do begin
        priv := TMan(cdata.family.Items[i]).priv;
//       st := TMan(cdata.family.Items[i]).status;
        if (priv = 10) or (priv = 26)  then
           flag := true;
      end;
      Locate('countp', mparam, [loCaseInsensitive]);
      if cdata.mdd = 1 then
      begin
         cdata.snorm := cdata.rmcount*DModule.norm1.FieldByName('psnorm').AsFloat;
         cdata.hnorm := cdata.rmcount*FieldByName('phnorm').AsFloat;
      end
      else
      begin
        cdata.snorm := cdata.rmcount*DModule.norm1.FieldByName('snorm').AsFloat;
        cdata.hnorm := cdata.rmcount*FieldByName('hnorm').AsFloat;
      end;

      if flag and (cdata.quanpriv > 3) then
         cdata.snorm := 18 * cdata.quanpriv + FieldByName('snorm').AsFloat * (cdata.rmcount - cdata.quanpriv);

      cdata.psnorm := FieldByName('phnorm').AsFloat;
//      cdata.phnorm := cdata.rmcount*FieldByName('hnorm').AsFloat;

    end;
{    end;  }
end;

procedure TClient.SetMin;//установить min
var
  i:integer;
begin
  cdata.pmin := 0;
  for i:=0 to cdata.mcount-1 do
    cdata.pmin:=cdata.pmin+getmin(DModule.query1,cdata.min[i]);
  if cdata.mcount<>0 then
    cdata.pmin:=rnd(cdata.pmin/cdata.mcount);
{  with Datamodule1.Query4 do begin
    cdata.pmin := 0;
    for i:=0 to cdata.mcount-1 do begin
      Close;
      SQL.Clear;
      SQL.Add('select sbros.minim');
      SQL.Add('from "curlmin.dbf" sbros');
      SQL.Add('where sbros.id_min = :id');
      ParamByName('id').AsInteger := cdata.min[i];
      Open;
      cdata.pmin := cdata.pmin + FieldByName('minim').AsFloat;
      Close;
    end;
    if cdata.mcount<>0 then
      cdata.pmin := Rnd(cdata.pmin/cdata.mcount);
    Close;
  end;
}
end;

procedure TClient.CalcHNorm(m: integer;var sq1, sq2: real);
//вычислить норматив потребления 1 человеком тепла в ч/д в m месяце
var
  pval: real;
begin
  with DModule.Query1 do begin
    Close;
    SQl.Clear;
    SQL.Add('select pcharge');
    SQL.Add('from charge');
    SQL.Add('where id_month = :id');
    ParamByName('id').AsInteger := m;
    Open;
    pval := FieldByName('pcharge').AsInteger;
    Close;
  end;
  sq1 := Rnd(sq1*Rnd(cdata.hnorm/cdata.snorm)*(pval/100));
  sq2 := Rnd(sq2*Rnd(cdata.hnorm/cdata.snorm)*(pval/100));
end;

procedure TClient.CalcPriv;
var
  i: integer;
begin
  SetLength(cdata.pc, cdata.mcount);
  SetLength(cdata.sq, cdata.mcount);
  SetLength(cdata.f, cdata.mcount);
  for i:=0 to cdata.mcount-1 do begin
    SetLength(cdata.pc[i], numbtarif);
    SetLength(cdata.sq[i], numbtarif);
    SetLength(cdata.f[i], numbtarif);
  end;
  CalcPriv('cont',0);
  CalcPriv('rep',1);
  CalcPriv('cold',2);
  CalcPriv('hot',3);
  CalcPriv('canal',4);
  CalcPriv('heat',5);
  CalcPriv('gas',6);
  CalcPriv('el',7);
  CalcPriv('wood',12);
  CalcPriv('coal',13);
end;

procedure TClient.CalcPriv(nam: string;serv: integer);
var
  i, j: integer;
begin
//  if (main.curregn=30305704) and (serv=0) then
//    sleep(5);
  with DModule.pv do begin
    for i:=0 to cdata.mcount-1 do begin
//      Close;
//      SQL.Clear;
//      SQL.Add('select p'+nam+', f'+nam+', square');
//      SQL.Add('from priv');
//      SQL.Add('where (id_priv = :id)');
//      ParamByName('id').AsInteger := cdata.priv[i];
//      Open;

      Locate('id_priv', cdata.priv[i], [loCaseInsensitive]);
      cdata.pc[i][serv] := FieldByName('p'+nam).AsInteger;
      cdata.sq[i][serv] := FieldByName('square').AsInteger;
      if cdata.priv[i]<>0 then
        cdata.f[i][serv] := FieldByName('f'+nam).AsInteger
      else
        cdata.f[i][serv] := 0;

    end;
//    Close;

  end;
  for i:=0 to cdata.mcount-1 do begin
    if ((cdata.f[i][serv]=1)or(SearchOne(cdata.f,serv)=0))and(cdata.priv[i]<>0) then begin //льгота на всю семью
      for j:=0 to cdata.mcount-1 do begin
        if (cdata.sq[j][serv] > cdata.sq[i][serv])or(cdata.pc[j][serv] = 0) then
          cdata.sq[j][serv] := cdata.sq[i][serv];
        if (cdata.pc[j][serv] < cdata.pc[i][serv])and(cdata.sq[j][serv] = cdata.sq[i][serv]) then begin
          cdata.pc[j][serv] := cdata.pc[i][serv];
          cdata.f[j][serv] := cdata.f[i][serv];
        end;
      end;
    end;
  end;
end;

function TClient.SearchOne(m: T2DInt;serv: integer):integer;//выяснить есть ли единица
var
  i: integer;
begin
  for i:=0 to cdata.mcount-1 do
    if m[i][serv]<>0 then
      break;
  if i=cdata.mcount then
    Result := 1//все нули
  else
    Result := 0;
end;

function GetCostTarif(s,id: integer;bdate: TDate;b,c,se: integer): real;
var
  nam, strf: string;
  cgas, cel: real;
begin
  cel:=0;
  cgas:=0;
  Result:=0;

  case s of
    0: nam := 'cont';
    1: nam := 'rep';
    2: nam := 'cold';
    3: nam := 'hot';
    4: nam := 'canal';
    5: nam := 'heat';
    6: nam := 'gas';
    7: nam := 'el';
    12: nam := 'wood';
    13: nam := 'coal';
  end;

  with DModule do
  begin
    case s of
      0:
      begin
        t1.Locate('id_cont', id, [loCaseInsensitive]); tc := t1;
      end;
      1:
      begin
        t2.Locate('id_rep', id, [loCaseInsensitive]);  tc := t2;
      end;
      2:
      begin
        t3.Locate('id_cold', id, [loCaseInsensitive]); tc := t3;
      end;
      3:
      begin
        t4.Locate('id_hot', id, [loCaseInsensitive]);  tc := t4;
      end;
      4:
      begin
        t5.Locate('id_canal', id, [loCaseInsensitive]); tc := t5;
      end;
      5:
      begin
        t6.Locate('id_heat', id, [loCaseInsensitive]); tc := t6;
      end;
      6:
      begin
        t7.Locate('id_gas', id, [loCaseInsensitive]); tc := t7;
      end;
      7:
      begin
        t8.Locate('id_el', id, [loCaseInsensitive]); tc := t8;
      end;
      12:
      begin
        t9.Locate('id_wood', id, [loCaseInsensitive]); tc := t9;
      end;
      13:
      begin
        t10.Locate('id_coal', id, [loCaseInsensitive]); tc := t10;
      end;
    end;
    strf := tc.Fields[1].AsString;
  end;

  if s<12 then
  begin
    with DModule do
    begin
      if s<>7 then
      begin
        if (s=2)or(s=3) then
          Result := tc.Fields[2 + b].AsCurrency  //
        else
          Result := tc.Fields[2].AsCurrency;
      end;
      if s = 7 then
      begin
        cel := tc.Fields[2].AsCurrency;
        cgas :=  tc.Fields[2].AsCurrency;
      end;
    end;

    if s=7 then
    begin
      case id of
      1:
      begin
        case se of
        1:
        begin
          case c of
            0..1 : Result := 84*cgas;
            2 : Result := 52*cgas;
            3 : Result := 40*cgas;
            4 : Result := 33*cgas;
          else
            Result := 28*cgas;
          end;
        end;
        2:
        begin
          case c of
            0..1 : Result := 108*cgas;
            2 : Result := 67*cgas;
            3 : Result := 52*cgas;
            4 : Result := 42*cgas;
            else
              Result := 37*cgas;
          end;
        end;
        3:
        begin
          case c of
            0..1 : Result := 122*cgas;
            2 : Result := 76*cgas;
            3 : Result := 59*cgas;
            4 : Result := 48*cgas;
            else
              Result := 42*cgas;
          end;
        end;
        4..7:
        begin
          case c of
            0..1 : Result := 132*cgas;
            2 : Result := 82*cgas;
            3 : Result := 63*cgas;
            4 : Result := 52*cgas;
            else
              Result := 45*cgas;
          end;
        end;
        end;
      end;

      2:
      begin
        case se of
        1:
        begin
          case c of
            0..1 : Result := 134*cel;
            2 : Result := 83*cel;
            3 : Result := 64*cel;
            4 : Result := 52*cel;
            else
              Result := 45*cel;
          end;
        end;
        2:
        begin
          case c of
            0..1 : Result := 158*cel;
            2 : Result := 98*cel;
            3 : Result := 76*cel;
            4 : Result := 62*cel;
            else
              Result := 54*cel;
          end;
        end;
        3:
        begin
          case c of
            0..1 : Result := 172*cel;
            2 : Result := 107*cel;
            3 : Result := 83*cel;
            4 : Result := 67*cel;
            else
              Result := 59*cel;
          end;
        end;
        4..7:
        begin
          case c of
            0..1 : Result := 183*cel;
            2 : Result := 114*cel;
            3 : Result := 88*cel;
            4 : Result := 71*cel;
            else
              Result := 62*cel;
          end;
        end;
        end;
      end;

      3:
      begin
        with DModule do
        begin
          if c>0 then
          begin
            if (c<3) then
                Result := tc.Fields[2 + (c - 1)].AsCurrency
            else
                Result := tc.Fields[4].AsCurrency;
          end
          else
            Result := tc.Fields[2].AsCurrency;
        end;
      end;
      end;
    end;
  end
  else//wood, coal
  begin
    with DModule.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.add('select tarif'+nam+' as cost');
      SQL.add('from '+nam);
      SQL.add('where (id_dist=:idd)and(id_'+nam+'=:id)and ');
      SQL.add('sdate in (select max(sdate) from '+nam);
      SQL.add('where sdate<=convert(smalldatetime,:d,104)and(id_dist=:idd)and(id_'+nam+'=:id))');
      ParamByName('d').AsString := Form1.rdt;
      ParamByName('idd').AsInteger := Form1.dist;
      ParamByName('id').AsInteger := id;
      Open;
      Result := FieldByName('cost').AsFloat;
      Close;
    end;
  end;
end;

function GetNormTarif(s,id: integer;bdate: TDate;b,c,se:integer): real;
var
  nam: string;
begin
  Result:=0;

  case s of
    0: nam := 'cont';
    1: nam := 'rep';
    2: nam := 'cold';
    3: nam := 'hot';
    4: nam := 'canal';
    5: nam := 'heat';
    6: nam := 'gas';
    7: nam := 'el';
    12: nam := 'wood';
    13: nam := 'coal';
  end;

  with DModule do
  begin
    case s of
      0:
      begin
        t1.Locate('id_cont', id, [loCaseInsensitive]); tc := t1;
      end;
      1:
      begin
        t2.Locate('id_rep', id, [loCaseInsensitive]);  tc := t2;
      end;
      2:
      begin
        t3.Locate('id_cold', id, [loCaseInsensitive]); tc := t3;
      end;
      3:
      begin
        t4.Locate('id_hot', id, [loCaseInsensitive]);  tc := t4;
      end;
      4:
      begin
        t5.Locate('id_canal', id, [loCaseInsensitive]); tc := t5;
      end;
      5:
      begin
        t6.Locate('id_heat', id, [loCaseInsensitive]); tc := t6;
      end;
      6:
      begin
        t7.Locate('id_gas', id, [loCaseInsensitive]); tc := t7;
      end;
      7:
      begin
        t8.Locate('id_el', id, [loCaseInsensitive]); tc := t8;
      end;
      12:
      begin
        t9.Locate('id_wood', id, [loCaseInsensitive]); tc := t9;
      end;
      13:
      begin
        t10.Locate('id_coal', id, [loCaseInsensitive]); tc := t10;
      end;
    end;
  end;

  if s<12 then
  begin
    with DModule do
    begin
      if s in [2..6] then
      begin
        if (s = 2) or (s = 3) then
          Result := tc.Fields[4].AsCurrency
        else
          Result := tc.Fields[3].AsCurrency;
      end;

      if s=7 then
      begin
        case id of
        1:
        begin
          case se of
          1:
          begin
            case c of
              0..1 : Result := 84;
              2 : Result := 52;
              3 : Result := 40;
              4 : Result := 33;
            else
              Result := 28;
            end;
          end;
          2:
          begin
            case c of
              0..1 : Result := 108;
              2 : Result := 67;
              3 : Result := 52;
              4 : Result := 42;
              else
                Result := 37;
            end;
          end;
          3:
          begin
            case c of
              0..1 : Result := 122;
              2 : Result := 76;
              3 : Result := 59;
              4 : Result := 48;
              else
                Result := 42;
            end;
          end;
          4..7:
          begin
            case c of
              0..1 : Result := 132;
              2 : Result := 82;
              3 : Result := 63;
              4 : Result := 52;
              else
                Result := 45;
            end;
          end;
          end;
        end;

        2:
        begin
          case se of
          1:
          begin
            case c of
              0..1 : Result := 134;
              2 : Result := 83;
              3 : Result := 64;
              4 : Result := 52;
              else
                Result := 45;
            end;
          end;
          2:
          begin
            case c of
              0..1 : Result := 158;
              2 : Result := 98;
              3 : Result := 76;
              4 : Result := 62;
              else
                Result := 54;
            end;
          end;
          3:
          begin
            case c of
              0..1 : Result := 172;
              2 : Result := 107;
              3 : Result := 83;
              4 : Result := 67;
              else
                Result := 59;
            end;
          end;
          4..7:
          begin
            case c of
              0..1 : Result := 183;
              2 : Result := 114;
              3 : Result := 88;
              4 : Result := 71;
              else
                Result := 62;
            end;
          end;
          end;
        end;

        3:
        begin
          with DModule do
          begin
            if c>0 then
            begin
              if (c<3) then
                  Result := tc.Fields[2 + (c - 1)].AsCurrency
              else
                  Result := tc.Fields[4].AsCurrency;
            end
            else
              Result := tc.Fields[2].AsCurrency;
          end;
        end;
      end;
    end;
    end;
  end;
end;

function TClient.GetStandard: real;
var
  nv: string;
  manychild: boolean;
  i: integer;
begin
  Result:=0;
  if cdata.rmcount = 0 then
  begin
    Result := 0;
    exit;
  end;

  if (cdata.indrstnd) then
  begin
    Result := cdata.indrstndval;
    exit;
  end;

  if cdata.rmcount = 1 then nv := '1';
  if cdata.rmcount = 2 then nv := '2';
  if (cdata.rmcount = 3) or ((cdata.rmcount > 4)
    and (cdata.quanpriv  = cdata.rmcount)) then nv := '3';
  if cdata.rmcount = 4 then nv := '4';
  if cdata.rmcount >= 5 then nv := '5';

  //Многодетные
  manychild := true;
  for i:= 0 to cdata.mcount - 1 do
    if (cdata.priv[i] <> 10) and (cdata.priv[i] <> 26) then
      manychild := False;
  if (cdata.rmcount >= 4) and (cdata.quanpriv  = cdata.rmcount) and manychild then
    nv := '3';

  if (cdata.rmcount = 1) and (cdata.mdd = 1) then nv := '6';
  if (cdata.rmcount > 1) and (cdata.mdd = 1) then nv := '7';
  try
    with DModule.qTarif do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select value'+nv);
      SQL.Add('from "currstnd.dbf" sbros');
      SQL.Add('where sbros.id_stnd=:id');
      Parameters.ParamByName('id').Value := integer(cdata.rstnd);
      Open;
      Result := FieldByName('value'+nv).AsFloat;
      Close;
    end;
  except
    ShowMessage(floattostr(cdata.square)+' '+IntToStr(cdata.rstnd));
  end;
end;

function TClient.GetMdd: integer;
begin
  with DModule.qTarif do begin
    Close;
    SQL.Clear;
    SQL.Add('select sbros.vmdd');
    SQL.Add('from "curmdd.dbf" sbros');
    SQL.Add('where sbros.id_mdd=:id');
    Parameters.ParamByName('id').Value := integer(cdata.mdd);
    Open;
    Result := FieldByName('vmdd').AsInteger;
    Close;
  end;
end;

procedure TClient.Calc(sts: integer);//расчет за месяц
var
  i: integer;
begin

  if (sts<>3) then begin//расчет активного
    if (cdata.calc=0) then
    begin //типовой расчет
      //расчет начислений с учетом льгот
      CalcPriv;
      CalcServSq(0);
      CalcServe(1);
      CalcServ(2);
      CalcServ(3);
      CalcServ(4);
      CalcServSq(5,StrToInt(System.Copy(Form1.rdt,4,2)));
      CalcServ(6);
      CalcServ(7);
      CalcServWC(12);
      CalcServWC(13);
    end
    else
    begin //индивидуальный расчет
      if sts=0 then
      begin//первый месяц
        cdata.bfpm[0] := CalcFull(cdata.fpm);
        cdata.fpm[0] := cdata.bfpm[0];

        for i:=0 to numbtarif-1 do
        begin
          cdata.pm[i] := cdata.bpm[i];
          cdata.snpm[i] := cdata.bsnpm[i];
          if i<>0 then
            cdata.bfpm[i] := 0;
        end;

        CalcPriv;
        for i := 0 to numbtarif - 1 do
        if cdata.counter[i] then
        begin
          if i in [2..4,6,7] then
            CalcServ(i);
          if cdata.counter[5] then
            CalcServSq(5,StrToInt(System.Copy(Form1.rdt,4,2)));
        end
        else
          cdata.snpm[i] := cdata.pm[i];
      end
      else
      begin
        cdata.fpm[0] := CalcFull(cdata.fpm);

        CalcPriv;
        for i := 0 to numbtarif - 1 do
        if cdata.counter[i] then
        begin
          if i in [2..4,6,7] then
            CalcServ(i);
          if cdata.counter[5] then
            CalcServSq(5,StrToInt(System.Copy(Form1.rdt,4,2)));
        end
        else
          cdata.snpm[i] := cdata.pm[i];
          
        cdata.pm[12] := cdata.bpm[12];
        cdata.pm[13] := cdata.bpm[13];
        cdata.snpm[12] := cdata.bsnpm[12];
        cdata.snpm[13] := cdata.bsnpm[13];
      end;
      for i:=1 to numbtarif-1 do
        cdata.fpm[i] := 0;
    end;
    CalcSub(sts);
    CalcFinal(sts);
  end;
end;


procedure TClient.CalcSub(sts: integer);//расчет субсидии за месяц
var
  ppm, pm,fpm, subs, stnd,cnt, subold, tmpkoef, tmpLkoef: real;
  i,mdd, mbc: integer;
  p: array[0..numbtarif-1] of real;
  havePriv: boolean;
begin
  if (sts<>3) then
  //расчет активного
  begin
    mdd := GetMdd;
    fpm := CalcFull(cdata.fpm);
    stnd := GetStandard;

    if cdata.rstnd<>0 then
    //------с учетом стандарта
    begin
      pm := CalcFull(cdata.fpm);//полная оплата без учета льготы
      ppm := CalcFull(cdata.pm);//начисления по нормативам

      //% соответственно услугам
      if (ppm <> 0) then
      begin
        for i:=0 to numbtarif-1 do
          p[i] := cdata.pm[i]/ppm;
      end
      else
      begin
        for i:=0 to numbtarif-1 do
          p[i] := 0;
      end;
      if pm<>0 then
        pm := stnd*cdata.mcount*Rnd(ppm/pm);
    end
    else
    //------оплата по соц.норме
    begin
      ShowMessage(format('Не установлен региональный стандарт для клиента %s', [IntToStr(data.regn)]));
      exit;
    end;

    //------определение размера субсидии
    if fpm=0 then
    begin
      fpm:=1;
      ppm:=0;
    end;

    if cdata.rstnd=0 then
    begin
      //------типовой расчет
      ShowMessage(format('Не установлен региональный стандарт для клиента %s', [IntToStr(data.regn)]));
      exit;
    end
    else
    //------с учетом стандарта
    begin
      havePriv := False;
      //проверка на koef
      if cdata.koef <= 1 then
        tmpkoef := rnd(cdata.koef)
      else
        tmpkoef := 1;
      //проверка на льготный к.
      if rnd(ppm/fpm) <= 1 then
        tmpLkoef := rnd(ppm/fpm)
      else
        tmpLkoef := 1;

      for i:= 0 to cdata.mcount - 1 do
      if cdata.priv[i] <> 0 then
        havePriv := True;
      if havePriv then
        subs := (stnd * cdata.mcount * tmpLkoef - ((mdd / 100) * cdata.income * tmpkoef))
      else
        subs := (stnd * cdata.mcount - ((mdd / 100) * cdata.income * tmpkoef));
    end;

    subold := 0;
    for i:=0 to numbtarif-1 do
      subold := subold + cdata.stndsub[i];

    if (subs + 1 < subold ) and (cdata.mcount > 3) and (cdata.square > 60)
      and (sts <> 0) and (cdata.begindate < StrToDate('01.01.2007')) then
    begin
      mbc :=  MessageDlg('Произошло уменьшение субсидии' + #13#10 +
                    '   Имя - ' + TMan(cdata.family.Items[0]).fio + #13#10 +
                    '   значение площади - ' + FloatToStr(cdata.square) + #13#10 +
                    '   Кол-во чел. - ' + FloatToStr(cdata.mcount) + #13#10 +
                    '   Новое знач. субс. - ' + FloatToStr(subs) + #13#10 +
                    'Принять данное изменение?',
        mtConfirmation, [mbYes, mbNo], 0);
     if mbc = mrNo then
      exit;
    end;

    if subs>0 then
    begin
      begin
        cnt := 0;
        for i:=0 to numbtarif-1 do
        //------распределяем субсидию по тарифам
        begin
          cdata.stndsub[i] := rnd(subs*p[i]);
          cnt := cnt + cdata.stndsub[i];
        end;
        i:=0;
        while cdata.stndsub[i]=0 do
          inc(i);
        cnt := subs - cnt;
        cdata.stndsub[i] := rnd(cdata.stndsub[i] + cnt);
      end;
    end
    else//subs<0
    begin
      for i:=0 to numbtarif-1 do
        cdata.stndsub[i] := 0;
    end;
  end;
end;

procedure TClient.CalcFinal(sts: integer);
var
  fstndsub, fsnpm, tmpsubs, cnt, ppm: real;
  i : integer;
begin
  fstndsub := CalcFull(cdata.stndsub);
  fsnpm := CalcFull(cdata.snpm);
  ppm := CalcFull(cdata.pm);

  if (fstndsub >= fsnpm) then
  begin
    for i:=0 to numbtarif-1 do
    begin
      cdata.sub[i] := cdata.snpm[i];
    end;
  end
  else
  for i:=0 to numbtarif-1 do
    cdata.sub[i] := cdata.stndsub[i];

  if ((HaveCounters = false) and (cdata.calc=1)) then
  begin
    if fstndsub >= ppm then
    begin
      for i:=0 to numbtarif-1 do
        cdata.sub[i] := cdata.pm[i];
    end
    else
    begin
      for i:=0 to numbtarif-1 do
        cdata.sub[i] := cdata.stndsub[i];
    end;
    for i:=0 to numbtarif-1 do
      cdata.snpm[i] := cdata.pm[i];
  end;

  //обрезаем по факту (если он больше 0)
  if getConfValue('0.AverageFactMinus') then
  begin
    tmpsubs := 0;
    for i:=0 to numbtarif-1 do
      tmpsubs := tmpsubs + cdata.sub[i];
    if (cdata.averageFact > 0) and (tmpsubs > cdata.averageFact) and (data.cert <> 1) then
    begin
      for i:=0 to numbtarif-1 do
        cdata.sub[i] := (cdata.sub[i] * (cdata.averageFact/tmpsubs));
    end;
  end;

  if (sts=0) then
  begin //первый месяц
    if (cdata.calc=0) then
    begin //типовой расчет
      for i:=0 to numbtarif-1 do
      begin
        cdata.bpm[i]:=cdata.pm[i];
        cdata.bsnpm[i]:=cdata.snpm[i];
        cdata.bfpm[i]:=cdata.fpm[i];
      end;
    end;
    for i:=0 to numbtarif-1 do
    begin
      cdata.bsub[i]:=cdata.sub[i];
      cdata.bstndsub[i]:=cdata.stndsub[i];
    end;
  end
  else
  begin
    i := 0;
    while cdata.sub[i]=0 do
      inc(i);
    if cdata.sub[12] > cdata.bsub[12] then
      cnt := cdata.sub[12] - cdata.bsub[12]
    else
      cnt := cdata.bsub[12] - cdata.sub[12];
    if cdata.sub[13] > cdata.bsub[13] then
      cnt := cnt + cdata.sub[13] - cdata.bsub[13]
    else
      cnt := cnt + cdata.bsub[13] - cdata.sub[13];
    cdata.sub[i] := Rnd(cdata.sub[i] + cnt);
    if (cdata.calc = 0) and(cdata.tarifs[12] <> 0) then
    begin //типовой расчет
      cdata.pm[12] := 0;
      cdata.snpm[12] := 0;
      cdata.sub[12] := 0;
      cdata.fpm[12] := 0;
      cdata.stndsub[12] := 0;

      cdata.pm[13] := 0;
      cdata.snpm[13] := 0;
      cdata.sub[13] := 0;
      cdata.fpm[13] := 0;
      cdata.stndsub[13] := 0;
    end;
    if (cdata.calc = 1) and (cdata.tarifs[12] <> 0) then  //ИНДИВИДУАЛЬНЫЙ расчет
    begin
      cdata.sub[12] := 0;
      cdata.snpm[12] := 0;
      cdata.stndsub[12] := 0;

      cdata.sub[13] := 0;
      cdata.snpm[13] := 0;
      cdata.stndsub[13] := 0;
    end;
  end;
end;

function TClient.CalcFull(arr: TNumbTarifReal): real;
var
  i: integer;
begin
  Result := 0;
  for i:=0 to numbtarif - 1 do
    Result := Result + arr[i];
end;

procedure TClient.CalcServ(s: integer);
var
  valtarif, normData, counterData, cost: real;
  i, tval, canalServ: integer;
  canalCold, canalHot: boolean;
begin
  if cdata.calc <> 1 then
  begin
  if s <> 7 then
    valtarif := cdata.cost[s] * cdata.tarifnorm[s]
  else
    valtarif := cdata.cost[s];

  if valtarif <> 0 then
  begin
    normData := cdata.mcount;
    counterData := cdata.mcount;
    cdata.fpm[s] := Rnd(valtarif * normData);
    for i:=0 to cdata.mcount-1 do
    begin
      if cdata.pc[i][s]<>0 then
      begin//если ненулевая льгота
        normData := normData - cdata.pc[i][s]/100;
        counterData := counterData - cdata.pc[i][s]/100;
      end;
    end;
    cdata.pm[s] := rnd(valtarif * normData);
    cdata.snpm[s] := rnd(valtarif * counterData);
  end
  else
  begin
    cdata.fpm[s] := 0;
    cdata.pm[s] := 0;
    cdata.snpm[s] := 0;
  end;
  end;
  //счетчик
  if cdata.counter[s] then
  begin
    normData := cdata.counternorm[s];
    counterData := cdata.counterdata[s];

    if s <> 7 then cost := cdata.countercost[s]
    else//электоэнергия
    begin
      if cdata.mcount > 2 then
        tval := 3
      else
        tval := cdata.mcount;

      with DModule do
      begin
        if cdata.tarifs[7] > 2 then
          valtarif:=0
        else
        begin
          t8.Locate('id_el', cdata.tarifs[7], [loCaseInsensitive]);
          cost := t8.FieldByName('tarifel'+IntToStr(tval)).Value;//стоимоть тарифа
        end;
      end;
    end;

    //водоотведение (есть cold)
    if (s = 4) and (cdata.counter[2]) and (cdata.counter[3] = false) then
    begin
      canalCold := true;
      canalServ := 2;
    end;
    //водоотведение (есть hot)
    if (s = 4) and (cdata.counter[3]) and (cdata.counter[2] = false) then
    begin
      canalHot := true;
      canalServ := 3;
    end;

    if (canalCold) or (canalHot) then //canal
    begin
      counterData := counterData * cdata.mcount;
      normData := cdata.counterdata[canalServ];
      valtarif := cost * normData + counterData;
    end
    else//другие услуги
      valtarif := cost * counterData;

    for i:=0 to cdata.mcount-1 do
    begin
      if cdata.pc[i][s]<>0 then
      begin//если ненулевая льгота
        if (canalCold) or (canalHot) then //canal
        begin
          if (cdata.priv[i] in [3, {12,} 13, 22, 25, 1, 11, 10, 26]) then
            valtarif := valtarif - ((math.min(rnd(normData/cdata.mcount), cdata.counternorm[canalServ]) * cost + counterData / cdata.mcount) * cdata.pc[i][s]/100) //* math.min(valtarif, cost * (cdata.tarifnorm[2] + cdata.tarifnorm[3])) * cdata.pc[i][s]/100
          else
            valtarif := valtarif - ((normData/cdata.mcount * cost + (counterData/cdata.mcount)) * cdata.pc[i][s]/100);
        end
        else//другие услуги
        begin
          if (cdata.priv[i] in [3, {12,} 13, 22, 25, 1, 11, 10, 26]) then
            valtarif := valtarif - (math.min(normData, rnd(counterData/cdata.mcount)) * cost * cdata.pc[i][s]/100)
          else
            valtarif := valtarif - (cost * (counterData/cdata.mcount) * cdata.pc[i][s]/100);
        end;
      end;
    end;

    //cdata.pm[s] := Rnd(valtarif);
    cdata.snpm[s] := Rnd(valtarif);
    if Form1.GetStatus(cdata.begindate, cdata.enddate) = 0 then cdata.bsnpm[s] := Rnd(valtarif);
    
    //Exit;
  end;
end;

procedure tclient.calcservsq(service:integer;m:integer);
{*******************************************************************************
Расчёт начислений по тарифу в зависимости от жилой/льготной площади
*******************************************************************************}
var
  cost:real;//стоимость текущей услуги
  squarenp:real;//площадь, на которую не распространяется льгота
  squarep:real;//площадь, на которую распространяется льгота
  squareold:real;//разница площадей
  i,j,quan:integer;
  ab: Real;
  norm: Real;
begin
  if cdata.calc <> 1 then
  begin
  //расчет содержания жилья и отопления по тарифам
  cost := cdata.cost[service];//получаем стоимость услуги @service
  quan:=0;
  squareold:=cdata.square;

  if (service=0) and (cdata.square<>cdata.lsquare) and (data.fond in [2,3,4]) then
  begin
    cdata.square:=cdata.lsquare;
  end;

  if cost<>0 then
  begin
    squarenp:=cdata.square;//получаем полную площадь
    squarep:=math.min(cdata.square,cdata.snorm);//получаем льготную площадь
    cdata.fpm[service]:=rnd(cost*squarenp);//начисления по полной площади
    for i:=0 to cdata.mcount-1 do
    begin
      if cdata.pc[i][service]<>0 then//если ненулевая льгота
      begin
        if cdata.sq[i][service]=0 then
        begin//льгота распространяется на всю площадь
          squarenp:=squarenp-cdata.square/cdata.rmcount*(cdata.pc[i][service]/100);
          squarep:=squarep-math.min(cdata.square,cdata.snorm)/cdata.rmcount*(cdata.pc[i][service]/100);
        end
      else
      begin//льгота распространяется на соцнорму
        //inc(quan);
        for j:=0 to cdata.mcount-1 do
          if cdata.f[j][service]=1 then
            quan:=cdata.mcount;
        if quan=cdata.mcount then
        //if cdata.square<=cdata.psnorm*quan then
        begin
          squarenp:=squarenp-cdata.square/quan*(cdata.pc[i][service]/100);
          squarep:=squarep-cdata.square/quan*(cdata.pc[i][service]/100);
        end
        else
        begin
          if ((cdata.priv[i] in [3, {12,} 13, 22, 25, 1, 11, 10, 26]) or
            ((cdata.priv[i] = 30) and (service = 0))) then
          begin
            squarenp:=squarenp - math.min(cdata.square/cdata.rmcount,cdata.psnorm) *(cdata.pc[i][service]/100);
            squarep:=squarep - math.min(cdata.square/cdata.rmcount,cdata.psnorm) *(cdata.pc[i][service]/100);
          end
          else
          begin
            if ((cdata.priv[i] = 30) and (service = 5)) then //ветеран тр. инв.
            begin
              squarenp:=squarenp-cdata.square/cdata.rmcount*(cdata.pc[i][service]/100);
              squarep:=squarep-math.min(cdata.square,cdata.snorm)/cdata.rmcount*(cdata.pc[i][service]/100);
            end
            else
            begin
              squarenp:=squarenp - cdata.psnorm *(cdata.pc[i][service]/100);
              squarep:=squarep - cdata.psnorm *(cdata.pc[i][service]/100);
            end;
          end;
        end;
//      squarenp:=math.max(squarenp,cdata.snorm/2);
//      squarep:=math.max(squarep,math.min(cdata.snorm/2,cdata.square/2));
      end;
    end;
  end;

  if (service=5) and (cdata.tarifs[5]=99) then//частный дом
    calchnorm(m,squarenp,squarep);

  cdata.pm[service]:=rnd(cost*squarenp);
  cdata.snpm[service]:= cdata.pm[service];//rnd(cost*squarep); для правильного расчета по счеьчикам
  end
  else
  begin
    cdata.fpm[service]:=0;
    cdata.pm[service]:=0;
    cdata.snpm[service]:=0;
  end;

  cdata.square:=squareold;
  end;

  //расчет отопления по счетчику
  if (service = 5) then
  begin
    if cdata.counter[service] then
    begin
      cost := cdata.countercost[service] * cdata.counterdata[service];
      for i:=0 to cdata.mcount-1 do
      begin
        if cdata.pc[i][service]<>0 then//если ненулевая льгота
        begin
        if (cdata.priv[i] in [3, {12,} 13, 22, 25, 1, 11, 10, 26]) then
          begin
            norm := math.min(cdata.square/cdata.rmcount, cdata.psnorm);
            ab := math.min(cdata.counterdata[service]/cdata.rmcount, norm * cdata.counternorm[service]);

            cost := cost - (ab * cdata.pc[i][service]/100 * cdata.countercost[service])
          end
          else
            cost := cost - ((cdata.counterdata[service]/cdata.rmcount) * cdata.pc[i][service]/100 * cdata.countercost[service]);
        end;
      end;
      cdata.snpm[service] := rnd(cost);
      if Form1.GetStatus(cdata.begindate, cdata.enddate) = 0 then  cdata.bsnpm[service] := Rnd(cost);
    end
    else
      cost := cdata.countercost[service] * cdata.counternorm[service];
  end;
end;

procedure tclient.calcserve(service:integer);
{*******************************************************************************
Расчёт начислений по освещению мест общего пользования
*******************************************************************************}
var
  cost,price,norm:real;//стоимость текущей услуги
  i, tval:integer;
begin
  price:=0;

  if cdata.mcount > 2 then
    tval := 3
  else
    tval := cdata.mcount;

  with DModule do
  begin
  if cdata.tarifs[7] > 2 then
    cost:=0
  else
    begin
      t8.Locate('id_el', cdata.tarifs[7], [loCaseInsensitive]);
      cost := t8.FieldByName('tarifel'+IntToStr(tval)).Value;
    end;
  end;

  norm:=cdata.cost[service];//получаем стоимость услуги @service

  for i:=0 to cdata.mcount-1 do
  begin
    price:=price+(cost*norm*(100-cdata.pc[i][service])/100);
  end;
  cdata.fpm[service]:= rnd(cdata.mcount*cost*norm); //rnd(price);
  cdata.pm[service]:=rnd(price);
  cdata.snpm[service]:=rnd(price);
end;

procedure TClient.CalcServWC(s: integer);
var
  valtarif, value1, value2, norm: real;
  i,j,quan:integer;
begin
  valtarif := cdata.cost[s];
  if valtarif<>0 then
  begin
    norm := 0;
    case s of
      12 : norm := Form1.normw;
      13 : norm := Form1.normc;
    end;

    value1 := cdata.square;
    value2 := math.min(cdata.square,cdata.snorm);

    cdata.fpm[s] := rnd((valtarif * norm * value1)/12);

    quan:=0;
    if value2 < 0 then ShowMessage('Проверьте льготную площадь');

    for i := 0 to cdata.mcount - 1 do
    begin
      if cdata.pc[i][s] <> 0 then//если ненулевая льгота
      begin
        if cdata.sq[i][s] = 0 then
        begin//льгота распространяется на всю площадь
          value1 := value1 - cdata.square / cdata.mcount * (cdata.pc[i][s] / 100);
          value2 := value2 - Math.min(cdata.square, cdata.snorm) / cdata.mcount * (cdata.pc[i][s] / 100);
        end
        else
        begin//льгота распространяется на соцнорму
          Inc(quan);
          for j := 0 to cdata.mcount - 1 do
            if cdata.f[j][s] = 1 then
              quan := cdata.mcount;
          if cdata.square <= cdata.psnorm * quan then
          begin
            value1 := value1 - cdata.square / quan * (cdata.pc[i][s] / 100);
            value2 := value2 - cdata.square / quan * (cdata.pc[i][s] / 100);
          end
          else
          begin
            if (cdata.priv[i] = 3) or (cdata.priv[i] = 12) or (cdata.priv[i] = 13) or (cdata.priv[i] = 22) then
            begin
              value1 := value1 - math.min(cdata.square/cdata.rmcount,cdata.psnorm) * (cdata.pc[i][s] / 100);
              value2 := value2 - math.min(cdata.square/cdata.rmcount,cdata.psnorm) * (cdata.pc[i][s] / 100);
            end;
          end;
//          value1 := Math.max(value1, cdata.snorm / 2);
//          value2 := Math.max(value2, Math.min(cdata.snorm / 2, cdata.square / 2));
        end;
      end;
    end;
    cdata.pm[s] := Rnd((valtarif * value1 * norm)/12);
    cdata.snpm[s] := Rnd((valtarif * value2 * norm))/12;
  end
  else
  begin
    cdata.fpm[s] := 0;
    cdata.pm[s] := 0;
    cdata.snpm[s] := 0;
  end;
end;

constructor TMan.Create;
begin
  inherited Create;
end;

constructor TMan.Create(f: string;b: TDate;s,st,p: integer;mi: real;r: integer);
begin
  inherited Create;
  fio := f;
  birth := b;
  pol := s;
  status := st;
  priv := p;
  mid := mi;
  rel := r;
end;

destructor TMan.Destroy;
begin
  inherited Destroy;
end;

function TMan.Copy: TMan;
begin
  Result := TMan.Create(fio, birth, pol, status, priv, mid, rel);
end;

procedure CopyData(s: TData; var d: TData);//скопировать данные из s в d
begin
  d := Empty;
  d.regn := s.regn;
  d.regdate := s.regdate;
  d.fio := s.fio;
  d.str := s.str;
  d.nh := s.nh;
  d.corp := s.corp;
  d.apart := s.apart;
  d.tel := s.tel;
  d.control := s.control;
  d.reason := s.reason;
  d.settl := s.settl;
  d.own := s.own;
  d.manager := s.manager;
  d.fond := s.fond;
  d.cert := s.cert;
  d.insp := s.insp;
  d.dist := s.dist;
  d.bank := s.bank;
  d.acbank := s.acbank;
  d.change := s.change;
  d.declar:= s.declar;
end;

procedure CopyData(s: TCData; var d: TCData);//скопировать данные из s в d
var
  i,j: integer;
begin
  d := EmptyC;
  d.quanpriv := s.quanpriv;
  d.pmin := s.pmin;
  d.income := s.income;
  d.koef := s.koef;
  d.calc := s.calc;
  d.mdd := s.mdd;
  d.lsquare := s.lsquare;
  d.square := s.square;
  d.family.Free;
  d.family := TObjectList.Create;
  SetLength(d.priv, Length(s.priv));
  SetLength(d.mid, Length(s.mid));
  SetLength(d.min, Length(s.min));
  SetLength(d.sq, s.mcount);
  SetLength(d.pc, s.mcount);
  SetLength(d.f, s.mcount);
  for i:=0 to s.mcount-1 do
  begin
    d.family.Add(s.family[i]);
    d.priv[i] := s.priv[i];
    SetLength(d.sq[i], numbtarif);
    SetLength(d.pc[i], numbtarif);
    SetLength(d.f[i], numbtarif);
    for j:=0 to numbtarif-1 do
    begin
      d.sq[i][j] := s.sq[i][j];
      d.pc[i][j] := s.pc[i][j];
      d.f[i][j] := s.f[i][j];
    end;
    d.min[i] := s.min[i];
    d.mid[i] := s.mid[i];
  end;
  d.mcount := s.mcount;
  d.rmcount := s.rmcount;
  d.rstnd := s.rstnd;
  d.indrstnd := s.indrstnd;
  d.indrstndval := s.indrstndval;
  d.dist := s.dist;
  d.begindate := s.begindate;
  d.enddate := s.enddate;
  //------
  d.prevbegindate := s.prevbegindate;
  d.prevenddate := s.prevenddate;
  d.averageFact := s.averageFact;
  d.dolgFact := s.dolgFact;
  //d.curMinus := s.curMinus;
  //------
  d.period := s.period;
  d.snorm := s.snorm;
  d.psnorm := s.psnorm;
  d.phnorm := s.phnorm;
  d.hnorm := s.hnorm;
  d.boiler := s.boiler;
  d.stop := s.stop;
  for i:=0 to numbtarif-1 do
  begin
    d.accounts[i] := s.accounts[i];
    d.tarifs[i] := s.tarifs[i];
    d.cost[i] := s.cost[i];
    d.tarifnorm[i] := s.tarifnorm[i];
    d.counter[i] := s.counter[i];
    d.counterdata[i] := s.counterdata[i];
    d.countertarifs[i] := s.countertarifs[i];
    d.countercost[i] := s.countercost[i];
    d.counternorm[i] := s.counternorm[i];
    d.pm[i] := s.pm[i];
    d.snpm[i] := s.snpm[i];
    d.sub[i] := s.sub[i];
    d.stndsub[i] := s.stndsub[i];
    d.fpm[i] := s.fpm[i];
    d.bpm[i] := s.bpm[i];
    d.bsnpm[i] := s.bsnpm[i];
    d.bsub[i] := s.bsub[i];
    d.bstndsub[i] := s.bstndsub[i];
    d.bfpm[i] := s.bfpm[i];
  end;
end;

function FromSt(s:integer):integer;
begin
  with DModule.Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id_min');
    SQL.Add('from stat');
    SQL.Add('where id_status = :id');
    ParamByName('id').AsInteger := s;
    Open;
    Result := FieldByName('id_min').AsInteger;
    Close;
  end;
end;

function Empty: TData;
{*******************************************************************************
Возвращает пустую запись TData
*******************************************************************************}
begin
  Result.regn := 0;
  Result.regdate := 0;
  Result.fio := '';
  Result.str := 0;
  Result.nh := '';
  Result.corp := '';
  Result.apart := '';
  Result.tel := '';
  Result.control := 0;
  Result.reason := '';
  Result.settl := 0;
  Result.own := 0;
  Result.manager := 0;
  Result.fond := 0;
  Result.cert := 0;
  Result.insp := 0;
  Result.dist := 0;
  Result.bank := 0;
  Result.acbank := '';
  Result.change := 0;
  Result.declar:= 0;
end;

function EmptyC: TCData;
{*******************************************************************************
Возвращает пустую запись TCData
*******************************************************************************}
var
  i: integer;
begin
  Result.dist := 2;
  Result.quanpriv := 0;
  Result.pmin := 0;
  Result.income := 0;
  Result.koef := 0;
  Result.calc := 0;
  Result.mdd := 0;
  Result.lsquare := 0;
  Result.square := 0;
  Result.family := TObjectList.Create;
  Result.mcount := 0;
  Result.rmcount := 0;
  Result.rstnd := 0;
  Result.indrstnd := False;
  Result.indrstndval := 0;
  Result.begindate := 0;
  Result.enddate := 0;
  //------
  Result.prevbegindate := 0;
  Result.prevenddate := 0;
  Result.averageFact := 0;
  Result.dolgFact := 0;
  //Result.curMinus := 0;
  //------
  Result.period := 6;
  Result.snorm := 0;
  Result.psnorm := 0;
  Result.phnorm := 0;
  Result.hnorm := 0;
  Result.boiler := 0;
  Result.stop := 0;
  for i:=0 to numbtarif-1 do
  begin
    Result.tarifs[i] := 0;
    Result.cost[i] := 0;
    Result.tarifnorm[i] := 0;
    Result.accounts[i] := '';
    Result.counter[i] := False;
    Result.counterdata[i] := 0;
    Result.countertarifs[i] := 0;
    Result.countercost[i] := 0;
    Result.counternorm[i] := 0;
    Result.pm[i] := 0;
    Result.snpm[i] := 0;
    Result.sub[i] := 0;
    Result.fpm[i] := 0;
    Result.stndsub[i] := 0;
    Result.bstndsub[i] := 0;
    Result.bpm[i] := 0;
    Result.bsnpm[i] := 0;
    Result.bsub[i] := 0;
    Result.bfpm[i] := 0;
  end;
end;

end.
