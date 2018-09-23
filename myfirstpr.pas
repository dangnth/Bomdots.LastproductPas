unit MyFirstPr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, mmsystem;

type

  { TScreen }

  TScreen = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Screen: TScreen;

implementation

{$R *.lfm}

{ TScreen }
var targetspeed,playerspeed,score,best:integer;
    targettoleft:boolean;

procedure TScreen.Timer1Timer(Sender: TObject);
begin
    if targettoleft then begin
       image5.left:=image5.left-targetspeed;
       image1.refresh;
       if image5.left<=0 then targettoleft:=false;
    end
    else begin
       image5.left:=image5.left+targetspeed;
       image1.refresh;
       if image5.left+32>=360 then targettoleft:=true;
    end;
end;

procedure TScreen.FormShow(Sender: TObject);
begin
  targetspeed:=3;
  playerspeed:=7;
  score:=0;
  best:=0;
  randomize;
end;

procedure TScreen.FormCreate(Sender: TObject);
begin

end;



procedure TScreen.Image2Click(Sender: TObject);
begin
    image1click(image1);
end;

procedure TScreen.Image3Click(Sender: TObject);
begin
    image1click(image1);
end;

procedure TScreen.Image4Click(Sender: TObject);
begin
    image1click(image1);
end;

procedure TScreen.Image5Click(Sender: TObject);
begin
    image1click(image1);
end;

procedure TScreen.Timer2Timer(Sender: TObject);
var r:integer;
begin
    image4.top:=image4.top-playerspeed;
    r:=sqr(image4.Left+16-(image5.Left+24))+sqr(image4.top+16-(image5.Top+24));
    if sqrt(r) <= 40 then begin
       timer2.enabled:=false;
       sndplaysound('Sounds\Scored.wav',Snd_async or snd_nodefault);
       inc(score);
       image4.top:=472;
       label1.caption:=inttostr(score);
       image5.Top:=150+random(150);
       if score mod 5 = 0 then inc(targetspeed);
       if score mod 10 = 0 then inc(playerspeed);
    end
    else if image4.top<=26 then begin
       timer2.enabled:=false;
       if score>best then best:=score;
       Showmessage('Game Over <3');
       score:=0;
       label1.caption:='0';
       image4.top:=472;
       targetspeed:=3;
       playerspeed:=7;
    end;
end;
procedure TScreen.Image1Click(Sender: TObject);
begin
    timer2.enabled:=true;
end;

end.

