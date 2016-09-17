-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.DarkStatusBar);
display.setDefault("background", 0);
display.setDefault("fillColor", 1);
Cx = display.contentWidth*0.5;
Cy = display.contentHeight*0.5;
-----------------------------------------------------------------------------------------
display.newText("PRESS", Cx, 200, "Arial", 125);--HelveticaNeueCyr-Light Текст
display.newText("TO WIN", Cx, 480, "Arial", 100);--HelveticaNeueCyr-Light
-----------------------------------------------------------------------------------------
-- Ненужный код
--butX1 = display.newImageRect("img/x.png", 150, 150);--/В надписи
--butX1.x = 360;
--butX1.y = 340;
-----------------------------------------------------------------------------------------
-- Ненужный код 2
--local gradient = {
--    type="gradient",
--    color1={ 1/255, 1/255, 1/255 }, color2={ 255/255, 255/255, 255/255 }, direction="down" }
-----------------------------------------------------------------------------------------
local MainButtons = display.newGroup();
---SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE----
Score = 0;
ScoreText = display.newText(Score,Cx, 75, "HelveticaNeueCyr", 75);
--local memTimer = timer.performWithDelay( 1000, showMem, 1 )
---SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE--SCORE----
MainButtons.x = Cx;
MainButtons.y = 700;
--▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲
OffTr = display.newImageRect(MainButtons, "img/tr.png", 150, 150);--Triangle

OnTr = display.newImageRect(MainButtons, "img/tr.png", 175, 175);--OnTriangle
--✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖
OffX = display.newImageRect(MainButtons, "img/x.png", 150, 150);--Cross
OffX.y = 20+150+150;

OnX = display.newImageRect(MainButtons, "img/x.png", 175, 175);--OnCross
OnX.y = 20+150+150;
--■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■
OffSq = display.newImageRect(MainButtons, "img/sq.png", 150, 150);--Square
OffSq.x=-10-150;
OffSq.y=10+150;

OnSq = display.newImageRect(MainButtons, "img/sq.png", 175, 175);--onSquare
OnSq.x=-10-150;
OnSq.y=10+150;

--● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ●
OffO = display.newImageRect(MainButtons, "img/o1.png", 150, 150);--Circle
OffO.x=10+150;
OffO.y=10+150;

OnO = display.newImageRect(MainButtons, "img/o1.png", 175, 175);--onCircle
OnO.x=10+150;
OnO.y=10+150;
-----------------------------------------------------------------------------------------
local Krug = display.newGroup();--Тип круг
Krug.x=360;
Krug.y=160+700;

display.newCircle(Krug, 0, 0, 265):setFillColor( 1 );
display.newCircle(Krug, 0, 0, 263):setFillColor( 0 );
-----------------------------------------------------------------------------------------
MainButtons:toFront(); -- на передний план

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-------------  _____   _____   ___    _   _   _____   _   _  _____     __    ------------
------------- |  ___| | ___ | ||\ \  | |_| | | ___ | ||  // | ___ |   //\\   ------------
------------- | |     ||   || ||/_/  |     | ||   || ||_//  ||   ||  ||  ||  ------------
------------- | |     ||___|| || \ \ |  _  | ||___|| || \\  ||___|| _||__||_ ------------
------------- |_|     |_____| ||_/_/ |_| |_| |_____| ||  \\ |_____| \_\  /_/ ------------
-------------                                                                ------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
Def = "Стандартный";
if (Def) then
    OnTr.isVisible = false; -- скрываем от просмотра
    OnX.isVisible = false;
    OnSq.isVisible = false;
    OnO.isVisible = false;
else
    OffTr.isVisible = false; -- скрываем от просмотра
    OffX.isVisible = false;
    OffSq.isVisible = false;
    OffO.isVisible = false;
end

function pressX (event)
    if (event.phase == "began") then
         -- меняем текст
        OnX.isVisible = true; -- показываем картинку
        OffTr.isVisible = true;
        OffSq.isVisible = true;
        OffO.isVisible = true;
        Score = Score+1;--Score
        ScoreText.text = Score;
        OffX.isVisible = false; -- прячем картинку
        OnTr.isVisible = false;
        OnSq.isVisible = false;
        OnO.isVisible = false;
        else
            OnX.isVisible = false;
            OffX.isVisible = true;
    end
    return true
end
--BETA
--BETA
function pressTr (event)
    if (event.phase == "began") then
        Def = "Нестандартный";

        OnTr.isVisible = true;
        OffX.isVisible = true;
        OffSq.isVisible = true;
        OffO.isVisible = true;

        OffTr.isVisible = false;
        OnX.isVisible = false;-- прячем картинку
        OnSq.isVisible = false;
        OnO.isVisible = false;
    end
    return true
end

function pressSq (event)
    if (event.phase == "began") then
        Def="Стандартный";

        OnSq.isVisible = true;
        OffO.isVisible = true;
        OffX.isVisible = true;
        OffTr.isVisible = true;

        OffSq.isVisible = false;
        OnO.isVisible = false;
        OnX.isVisible = false;
        OnTr.isVisible = false;
    end
    return true
end

function pressO (event)
    if (event.phase == "began") then
        Def="Стандартный";
        -- меняем текст
        OnO.isVisible = true;
        OffX.isVisible = true;
        OffTr.isVisible = true;
        OffSq.isVisible = true;

        OffO.isVisible = false;
        OnX.isVisible = false;
        OnTr.isVisible = false;
        OnSq.isVisible = false;
    end
    return true
end

-- добавляем обработчик нажатия
OffX:addEventListener("touch", pressX);
OffTr:addEventListener("touch", pressTr);
OffSq:addEventListener("touch", pressSq);
OffO:addEventListener("touch", pressO);

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-------------  _____   _____   ___    _   _   _____   _   _  _____     __    ------------
------------- |  ___| | ___ | ||\ \  | |_| | | ___ | ||  // | ___ |   //\\   ------------
------------- | |     ||   || ||/_/  |     | ||   || ||_//  ||   ||  ||  ||  ------------
------------- | |     ||___|| || \ \ |  _  | ||___|| || \\  ||___|| _||__||_ ------------
------------- |_|     |_____| ||_/_/ |_| |_| |_____| ||  \\ |_____| \_\  /_/ ------------
-------------                                                                ------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------
----------------------------------------------------------------------  ___  ___  -------
-------  _____   _____   ___    _   _   _____   _   _  _____     __    |_ _||_ _| -------
------- |  ___| | ___ | ||\ \  | |_| | | ___ | ||  // | ___ |   //\\    | |  | |  -------
------- | |     ||   || ||/_/  |     | ||   || ||_//  ||   ||  ||  ||   | |  | |  -------
------- | |     ||___|| || \ \ |  _  | ||___|| || \\  ||___|| _||__||_  | |  | |  -------
------- |_|     |_____| ||_/_/ |_| |_| |_____| ||  \\ |_____| \_\  /_/  | |  | |  -------
-------                                                                |___||___| -------
-------------------------------------------------------------------            ----------
-----------------------------------------------------------------------------------------
WymP = math.random(4);
WymPtext = display.newText(WymP,Cx, 340, "HelveticaNeueCyr", 75);
--random '0' to '4';
--print( display.fps );
--print(WyoP);       
--print(Score);