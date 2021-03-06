Symb("AUDCAD");
Symb("AUDNZD");
Symb("AUDUSD");
Symb("EURCAD");
Symb("EURCHF");
Symb("EURGBP");
Symb("EURUSD");
Symb("GBPAUD");
Symb("GBPCAD");
Symb("GBPCHF");
Symb("NZDCAD");
Symb("NZDUSD");
Symb("USDSGD");



//+------------------------------------------------------------------+
//|在非DEBUG得时候运行此函数                                           |
//+------------------------------------------------------------------+
bool SetEA()
  {
   bool re=false;
   
   string sym=StringSubstr(Symbol(),0,6);

   if(sym=="NZDCAD") re=NZDCAD();
   if(sym=="EURGBP") re=EURGBP();
   if(sym=="EURSGD") re=EURSGD();
   if(sym=="NZDJPY") re=NZDJPY();
   if(sym=="EURUSD") re=EURUSD();
   if(sym=="EURNZD") re=EURNZD();
   if(sym=="AUDUSD") re=AUDUSD();
   if(sym=="GBPCAD") re=GBPCAD();
   if(sym=="GBPUSD") re=GBPUSD();
   if(sym=="EURCAD") re=EURCAD();
   if(sym=="EURAUD") re=EURAUD();
   if(sym=="USDSGD") re=USDSGD();
   if(sym=="EURCHF") re=EURCHF();
   if(sym=="GBPJPY") re=GBPJPY();
   if(sym=="AUDCAD") re=AUDCAD();
   if(sym=="USDJPY") re=USDJPY();
   if(sym=="AUDJPY") re=AUDJPY();
   if(sym=="USDCAD") re=USDCAD();

   if(!re)
     {
      //主要是因为在init的时候,这两个参数会被判断是否扩大10倍,如果是,那么不重新复制就很麻烦.
      TakeProfit                                  = 20;
      RZDistance                                  = 50;//可变
     }

   return re;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NZDCAD()
  {
//
   TakeProfit         = 30;
   StepATRMultiplier  = 3;
   RZBars             = 40;
   RZDistance         = 35;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURGBP()
  {
//
   TakeProfit         = 30;
   StepATRMultiplier  = 3.6;
   RZBars             = 40;
   RZDistance         = 40;
   return true;
  }
//+------------------------------------------------------------------+

bool EURSGD()
  {
//
   TakeProfit         = 35;
   StepATRMultiplier  = 3.4;
   RZBars             = 20;
   RZDistance         = 50;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NZDJPY()
  {
//
   TakeProfit         = 20;
   StepATRMultiplier  = 3.4;
   RZBars             = 20;
   RZDistance         = 50;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURUSD()
  {
//46312626.146623.4219.078055.327.55%0.00000000TakeProfit=37 LotMutiple=1.9 BaseGridNum=4 StepATRMultiplier=3.6 RZBars=24 RZDistance=50MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit        = 37;
   LotMutiple        = 1.9;
   BaseGridNum       = 4;
   StepATRMultiplier = 3.6;
   RZBars            = 24;
   RZDistance        = 50;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURNZD()
  {
//
   TakeProfit         = 25;
   StepATRMultiplier  = 3;
   RZBars             = 30;
   RZDistance         = 80;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool AUDUSD()
  {
//7015658.994325.6736.253677.233.67%0.00000000TakeProfit=47 LotMutiple=1.5 BaseGridNum=2 StepATRMultiplier=4.4 RZBars=39 RZDistance=40MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit        =  47;
   LotMutiple        =  1.5;
   StepATRMultiplier =  4.4;
   RZBars            =  39;
   RZDistance        =  40;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GBPCAD()
  {
//
   TakeProfit         = 35;
   StepATRMultiplier  = 3.6;
   RZBars             = 45;
   RZDistance         = 80;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool AUDNZD()
  {
//
   TakeProfit         = 15;
   StepATRMultiplier  = 2.4;
   RZBars             = 25;
   RZDistance         = 20;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GBPUSD()
  {
//16223447.815333.6143.997245.746.78%0.00000000TakeProfit=35 LotMutiple=2 BaseGridNum=2 StepATRMultiplier=3.6 RZBars=24 RZDistance=60MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit        = 35;
   LotMutiple        = 2;
   StepATRMultiplier = 3.6;
   RZBars            = 24;
   RZDistance        = 60;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURCAD()
  {
//
   TakeProfit         = 35;
   StepATRMultiplier  = 3.4;
   RZBars             = 25;
   RZDistance         = 80;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURAUD()
  {
//
   TakeProfit         = 30;
   StepATRMultiplier  = 2.6;
   RZBars             = 35;
   RZDistance         = 80;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool USDSGD()
  {
//
   TakeProfit         = 35;
   StepATRMultiplier  = 5.0;
   RZBars             = 25;
   RZDistance         = 40;
   return true;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EURCHF()
  {
//338868.412319.3638.392593.672.48%0.00000000TakeProfit=49 LotMutiple=1.9 BaseGridNum=4 StepATRMultiplier=3.2 RZBars=21 RZDistance=40MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit         = 49;
   BaseGridNum        = 4;
   StepATRMultiplier  = 3.2;
   RZBars             = 21;
   RZDistance         = 40;
   return true;

  }
//+------------------------------------------------------------------+

bool GBPJPY()
  {
//
   TakeProfit         = 40;
   StepATRMultiplier  = 2.5;
   RZBars             = 30;
   RZDistance         = 60;
   return true;

  }
//+------------------------------------------------------------------+

bool AUDCAD()
  {
//   
   TakeProfit         = 35;
   StepATRMultiplier  = 3.0;
   RZBars             = 35;
   RZDistance         = 50;
   return true;

  }
//+------------------------------------------------------------------+
bool USDJPY()
  {
//94158658.1515383.5538.1426817.4323.30%0.00000000TakeProfit=27 LotMutiple=1.9 BaseGridNum=2 StepATRMultiplier=2.6 RZBars=21 RZDistance=30MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit        = 27;
   StepATRMultiplier = 2.6;
   RZBars            = 21;
   RZDistance        = 30;

   return true;

  }
//+------------------------------------------------------------------+
bool AUDJPY()
  {
//40185289.6712134.1870.3121729.1113.51%0.00000000TakeProfit=39 LotMutiple=1.9 BaseGridNum=2 StepATRMultiplier=3.6 RZBars=33 RZDistance=30MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=0 ShowLine=0 StopLossPercent=0 ManualLotPer001=1000 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=0 AutoLotPer001=30000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 MaxLot001=100 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHour=1 IsOverlapping=0 ProfitPer
   TakeProfit        = 39;
   StepATRMultiplier = 3.6;
   RZBars            = 33;
   RZDistance        = 30;

   return true;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
bool USDCAD()
  {
//5829634.6214571.8020.3415481.0514.61%0.00000000TakeProfit=20 StepATRMultiplier=4.4 RZBars=45 RZDistance=35MagicNumberBuy=1234 MagicNumberSell=4321 ShowInfo=1 ShowLine=1 StopLossPercent=10 ManualLotPer001=500 AutoCancelPending=1 EnableVirtualOrder=1 VirtualOrderATRMultiplier=4 AutoMode=1 AutoLotPer001=10000 MaxTrades=10 MaxSymbolInPosition=1 MaxSpreadPoint=40 TimeFilter=1 NewsFilter=1 NewsOffset=2 NewsVhigh=1 NewsVmedium=1 NewsVlow=0 BeforeNewsStopMin=5 AfterNewsStopMin=5 TPDecreasePercent=15 LotMutiple=1.9 MaxLot001=100 BaseGridNum=2 StepATRPeriod=14 PipStepExponent=1.1 GridSplitHou
   TakeProfit        = 20;
   StepATRMultiplier = 4.4;
   RZBars            = 45;
   RZDistance        = 35;
   return true;
  }
//+------------------------------------------------------------------+
