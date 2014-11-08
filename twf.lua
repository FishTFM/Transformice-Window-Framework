----------------------------------
--  Transformice Window Framework.
--  @author     Fish.
--  @version    0.0.1
--  @proof      http://i.imgur.com/fRHs0PE.png
--  @date       21/08/2014
----------------------------------

twf = { -- Start the package.
    ui = {  -- Start the ui part of the Framework.
        
        popups = {},

        -- Start of popups section.
        createPopup = function (id, title, content, targetPlayer, buttons, closable, x, y, width, height, backgroundColor, borderColor, backgroundAlpha, fixedPos) -- Define the var as a function.
            ui.addTextArea(9 ..id.. 36 .. 21, "<font color='white'>"..content.."</font", targetPlayer, x, y + 25, width, height, backgroundColor, borderColor, backgroundAlpha, fixedPos);
            ui.addTextArea(9 ..id.. 36 .. 22, "<b><font size='14' color='#009D9D'>"..title.."</font></b>", targetPlayer, x - 10, y, width + 20, 20, "0x1c3c41", borderColor, backgroundAlpha, fixedPos);
           
            if closable then
                ui.addTextArea(9 ..id.. 36 .. 23, "<a href='event:closeTWFPopup_".. 9 ..id.. 36 .."'><font face='serif' color='#2b2b2b' size='12'><b>&#10005;</b></font></a>", targetPlayer, x + width - 8, y + 2, 16, 16, "0x009D9D", "0x009D9D", backgroundAlpha, fixedPos);
            end;

            twf.ui.popups[tostring("9"..id.."36")] = 9 ..id.. 36;

        end,
        
        removePopup = function (id, targetPlayer) -- Define the var as a function.
            ui.removeTextArea(twf.ui.popups[id] .. 21, targetPlayer);
            ui.removeTextArea(twf.ui.popups[id] .. 22, targetPlayer);
            ui.removeTextArea(twf.ui.popups[id] .. 23, targetPlayer);
        end,
        -- End of popups section.
        
        -- Start of labels section.
        createLabel = function (id, text, targetPlayer, x, y)
           ui.addTextArea(9 ..id.. 72 .. 22, "<font color='#000000' size='14'>"..text.."</font>", targetPlayer, x - 1, y, 600, 20, nil, nil, 0.0, true);
           ui.addTextArea(9 ..id.. 72 .. 22, "<font color='#000000' size='14'>"..text.."</font>", targetPlayer, x + 1, y, 600, 20, nil, nil, 0.0, true);
           ui.addTextArea(9 ..id.. 72 .. 22, "<font color='#000000' size='14'>"..text.."</font>", targetPlayer, x, y - 1, 600, 20, nil, nil, 0.0, true);
           ui.addTextArea(9 ..id.. 72 .. 22, "<font color='#000000' size='14'>"..text.."</font>", targetPlayer, x, y + 1, 600, 20, nil, nil, 0.0, true);
           ui.addTextArea(9 ..id.. 72 .. 21, "<font color='#ffffff' size='14'>"..text.."</font>", targetPlayer, x, y, 600, 20, nil, nil, 0.0, true);
        end;
        -- End of labels section.
    },
    trigger = {
        popupClose = function (popupId, playerName, callback)
            if string.sub(callback, 0, 14) == "closeTWFPopup_"  then
                print("Fermeture de "..popupId.." demandée par "..playerName.." ("..callback..")");
                twf.ui.removePopup(callback:sub(15), playerName);
            end
        end;
    }
}

-- Implementation :
function eventTextAreaCallback (textAreaId, playerName, callback)
   twf.trigger.popupClose(textAreaId, playerName, callback);
end;

-- Usable for now :
buttonsArray = "";
twf.ui.createPopup(1, "<font color='#30BA76'>•</font> <font color='#009D9D'>Profil de Fish</font>", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus non ipsum cursus, malesuada magna eget, tincidunt enim. Pellentesque mauris ipsum, consequat eu leo eu, facilisis tincidunt ligula. Integer vitae porttitor dolor, eget rhoncus dui. Pellentesque porttitor nec velit a aliquet. Ut non mattis turpis. Duis scelerisque, nulla et elementum scelerisque, justo diam fringilla felis, ut pellentesque massa elit sed ante. Nunc in diam elit. Cras condimentum sem id posuere vehicula.", nil, buttonsArray, true, 500, 100, 250, 200, "0x324650", "0x1c3c41", 1.0, true);
twf.ui.createPopup(2, "<font color='#30BA76'>•</font> <font color='#009D9D'>Profil de Youngness</font>", "Nunc urna quam, placerat vitae sollicitudin quis, suscipit at orci. Curabitur et tellus quis sem mollis sagittis vel ac dolor. Donec consectetur nunc a sagittis placerat. Etiam eget massa eget erat tincidunt viverra. Nunc augue arcu, congue sed aliquam ac, aliquam sed libero. Sed volutpat nulla vitae nisl tempus, id consequat sem elementum. Quisque dignissim, nisl a fringilla varius, erat ante porttitor nunc, a venenatis felis eros sit amet felis. Aliquam feugiat tortor at risus suscipit pulvinar. Etiam vitae turpis risus. In sit amet ultricies arcu. Cras eu efficitur nisl. Curabitur vitae elementum purus. Donec posuere nisi at aliquet molestie. Nulla mollis nulla nunc, sed vulputate orci pellentesque sed.", nil, buttonsArray, true, 50, 100, 250, 200, "0x324650", "0x1c3c41", 1.0, true);
twf.ui.createPopup(3, "<font color='#30BA76'>•</font> <font color='#009D9D'>Who is the best ?</font>", "«- Youngness ?<br><br>                        Fish ? -»", nil, buttonsArray, true, 325, 150, 150, 100, "0x324650", "0x1c3c41", 1.0, true);
twf.ui.createLabel(1, "Version: 0.0.1", nil, 690, 375);
