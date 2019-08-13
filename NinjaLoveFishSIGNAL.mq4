//+------------------------------------------------------------------+
//|                                          NinjaLoveFishSIGNAL.mq4 |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
//#define __DEBUG__

#define Version "1.17"
#define EAName "NinjaLoveFishSIGNAL"

#property strict
#property version Version
#property copyright "Copyright @2018, Qin Zhao"
#property link "https://www.mql5.com/en/users/zq535228"
#property icon "3232.ico"
#include <stderror.mqh>
#include <stdlib.mqh>
#include "comm.mqh"

#property indicator_chart_window    // Indicator is drawn in the main window
#property indicator_buffers 1       // Number of buffers
#property indicator_color1 Blue     // Color of the 1st line

extern int               FilterPairsNum=1;
extern int               mnb = 12345678;
extern int               mns = 87654321;
extern ENUM_TIMEFRAMES   TMVIEW= PERIOD_H4;
extern ENUM_TIMEFRAMES   TMEXE = PERIOD_M30;


double Buf_0[];             // Declaring arrays (for indicator buffers)
int n=1;                    //一行的行数。
//--------------------------------------------------------------------
int OnInit() // Special function init()
  {
   BG();
   SetIndexBuffer(0,Buf_0);         // Assigning an array to a buffer
   SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,1);// Line style
   return 0;                          // Exit the special funct. init()
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void start()
  {

   label(EA,EA,50,60,5);

   Symb("txt机会货币兑如下：");
   Symb("AUDCAD");
   Symb("AUDNZD");
   Symb("EURCAD");
   Symb("EURCHF");
   Symb("EURGBP");
   Symb("EURUSD");
   Symb("GBPAUD");
   Symb("GBPCAD");
   Symb("GBPCHF");
   Symb("NZDCAD");
   Symb("USDSGD");
   Symb("XAUUSD");
   Symb("==");
   
   aorders();//现有仓位列表


   ObjectSetInteger(0,Symbol(),OBJPROP_BGCOLOR,clrGreenYellow);//设置当前的货币兑btn的颜色.
   ObjectSetInteger(0,Symbol()+".",OBJPROP_BGCOLOR,clrGreenYellow);//设置当前持仓货币兑btn的颜色.

   label("Comm0","买点：寻找内部结构的对称点，估算挂单，考虑止损跨度。",50,30,10+25*(n+1));
   label("Comm1","开仓：GPB和JPY开仓RSI指标M5周期12，其他货币兑为8。",50,30,10+25*(n+2));
   label("Comm2","止损：仓位（0.01/2300），一般情况下可以接受2000-2500的跨度！",50,30,10+25*(n+3));
   label("Comm3","切记：一切皆有可能的价格，被套三层再开新网格，本金重要！",50,30,10+25*(n+4));

   n=1;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void aorders()
  {
   Symb("txt现有仓位如下：");

   string a;

   for(int pos=OrdersTotal()-1; pos>=0; pos--)
     {
      if(OrderSelect(pos,SELECT_BY_POS,MODE_TRADES))
        {
         if(StringFind(a,OrderSymbol())==-1)
           {
            a+=OrderSymbol()+",";
           }
        }
     }

   string result[];
   int k=StringSplit(a,',',result);

   for(int i=0;i<k;i++)
     {
      if(result[i]!="")
        {
         Symb2(result[i]);
        }
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string getPeriodName()
  {
   int p=Period();

   if(p==240)
     {
      return "H4";
     }
   if(p==10080)
     {
      return "W";
     }
   return IntegerToString(p);
  }
//+------------------------------------------------------------------+

string EA=EAName+" v"+Version+" "+Symbol()+" "+getPeriodName();
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   ObjectsDeleteAll(0,OBJ_BUTTON);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   double h=0;
//--- If you click on the object with the name buttonID
   if(id==CHARTEVENT_OBJECT_CLICK && ObjectGetInteger(0,sparam,OBJPROP_STATE))
     {
      bool selected1=ObjectGetInteger(0,sparam,OBJPROP_STATE);
      string sy=StringSubstr(sparam,0,6);

      if(Symbol()==sy && Period()==TMVIEW)
        {
         ChartSetSymbolPeriod(0,sy,TMEXE);
        }
      else
        {
         ChartSetSymbolPeriod(0,sy,TMVIEW);
        }
Print(sparam);
      ObjectSetInteger(0,sparam,OBJPROP_STATE,0);
      ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrGreenYellow);

     }
//键盘向右，就是打开
   if(id==CHARTEVENT_KEYDOWN)
     {
      if((int)lparam==39)
        {
         ChartOpen(Symbol(),TMEXE);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void btn(string name,int x,int y)
  {
   ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetString(0,name,OBJPROP_TEXT,name);
//ObjectSetInteger(0,name,OBJPROP_BGCOLOR,clrTomato);
   ObjectSet(name,OBJPROP_SELECTABLE,0);
//ObjectSetString(0,name,OBJPROP_TOOLTIP,name);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,80);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,20);

   string sym1 = StringSubstr(Symbol(),0,3);
   string sym2 = StringSubstr(Symbol(),3,6);
   if((StringFind(name,sym1)!=-1 || StringFind(name,sym2)!=-1))
     {
      ObjectSetInteger(0,name,OBJPROP_BGCOLOR,clrPaleTurquoise);//设置当前的货币兑btn的颜色.
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void label(string name,string value,double rsi,int x,int y)
  {

   int windows=0;
   ObjectDelete(name);
   ObjectCreate(name,OBJ_LABEL,windows,0,0);
   color cc=clrWhite;

   if(rsi>70) cc = clrRed;
   if(rsi<30) cc = clrBlue;

   ObjectSetText(name,value,10,"Calibri",cc);
   if(StringFind(name,"Nin")!=-1)
     {
      ObjectSetText(name,value,12,"Calibri",cc);
     }
   if(StringFind(name,"Comm")!=-1)
     {
      ObjectSetText(name,value,8,"Calibri",cc);
     }
   if(StringFind(name,"txt")!=-1)
     {
      ObjectSetText(name,value,8,"Calibri",cc);
     }
   ObjectSet(name,OBJPROP_CORNER,ANCHOR_LEFT_UPPER);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSet(name,OBJPROP_ANCHOR,ANCHOR_LEFT_UPPER);
   ObjectSetString(0,name,OBJPROP_TOOLTIP,name);
   ObjectSet(name,OBJPROP_SELECTABLE,0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Symb(string sy)
  {
   int pnum=GetPositionExistNum(sy,mnb)+GetPositionExistNum(sy,mns);

   if(pnum>=FilterPairsNum)
     {
      return;
     }

   double b=MarketInfo(sy,MODE_BID);
   int m=25;//竖行的距离.
   int btop=10;

   if(sy=="==")
     {
      label(sy+"==","",50,0,btop+m*n);
      n++;
      return;
     }

   if(StringFind(sy,"txt")!=-1)
     {
      StringReplace(sy,"txt","");
      label("txt"+IntegerToString(n),sy,50,30,btop+m*n);
      n++;
      return;
     }

   double rsi15=iRSI(sy,PERIOD_M15,8,PRICE_CLOSE,0);
   label(sy+"M15","M15",rsi15,30,btop+m*n);
   double rsi30=iRSI(sy,PERIOD_M30,8,PRICE_CLOSE,0);
   label(sy+"M30","M30",rsi30,80,btop+m*n);
   double rsi4h=iRSI(sy,PERIOD_H4,8,PRICE_CLOSE,0);
   label(sy+"H4","H4",rsi4h,130,btop+m*n);
   double rsid1=iRSI(sy,PERIOD_D1,8,PRICE_CLOSE,0);
   label(sy+"D1","D1",rsid1,180,btop+m*n);

   double cc=50;
   double ma=iMA(sy,PERIOD_H4,700,0,MODE_SMMA,PRICE_CLOSE,0);
   double Ma_Bid_Diff=MathAbs(ma-b)/MarketInfo(sy,MODE_POINT);

   if(Ma_Bid_Diff > 1500 && b > ma) cc = 100;
   if(Ma_Bid_Diff > 1500 && b < ma) cc = 0;

   label(sy+"MA","MA",cc,230,btop+m*n);

   double sp=(int)MarketInfo(sy,MODE_SPREAD);
//统计当前的货币兑点差
//label(sy+"SP",DoubleToStr(sp,0),50,280,btop+m*n);
//统计持仓货币的数量
   label(sy+"pnum",DoubleToStr(pnum,0),50,280,btop+m*n);

   btn(sy,320,btop+m*n);

   n++;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Symb2(string sy)
  {
   int pnum=GetPositionExistNum(sy);
   double b=MarketInfo(sy,MODE_BID);
   int m=25;//竖行的距离.
   int btop=10;

   double rsi15=iRSI(sy,PERIOD_M15,8,PRICE_CLOSE,0);
   label(sy+"cM15","M15",rsi15,30,btop+m*n);
   double rsi30=iRSI(sy,PERIOD_M30,8,PRICE_CLOSE,0);
   label(sy+"cM30","M30",rsi30,80,btop+m*n);
   double rsi4h=iRSI(sy,PERIOD_H4,8,PRICE_CLOSE,0);
   label(sy+"cH4","H4",rsi4h,130,btop+m*n);
   double rsid1=iRSI(sy,PERIOD_D1,8,PRICE_CLOSE,0);
   label(sy+"cD1","D1",rsid1,180,btop+m*n);

   double cc=50;
   double ma=iMA(sy,PERIOD_H4,700,0,MODE_SMMA,PRICE_CLOSE,0);
   double Ma_Bid_Diff=MathAbs(ma-b)/MarketInfo(sy,MODE_POINT);

   if(Ma_Bid_Diff > 1500 && b > ma) cc = 100;
   if(Ma_Bid_Diff > 1500 && b < ma) cc = 0;

   label(sy+"cMA","MA",cc,230,btop+m*n);

   double sp=(int)MarketInfo(sy,MODE_SPREAD);

   label(sy+"cpnum",DoubleToStr(pnum,0),50,280,btop+m*n);

   btn(sy+".",320,btop+m*n);

   n++;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BG()
  {
   string name="name";
   string value="g";

   ObjectDelete(name);
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSetText(name,value,900,"Webdings",clrBlack);
   ObjectSet(name,OBJPROP_CORNER,ANCHOR_LEFT_UPPER);
   ObjectSet(name,OBJPROP_ANCHOR,ANCHOR_LEFT_UPPER);
//ObjectSetString(0,name,OBJPROP_TOOLTIP,"NinjaLoveFishSIGNAL");
   ObjectSet(name,OBJPROP_SELECTABLE,0);
   ObjectSet(name,OBJPROP_XDISTANCE,-780);
   ObjectSet(name,OBJPROP_YDISTANCE,0);
//---
  }
//+------------------------------------------------------------------+
