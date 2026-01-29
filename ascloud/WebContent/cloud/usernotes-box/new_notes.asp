<!--#include virtual = "/cloud/util/new_notes.res" -->
<!--#include virtual = "/cloud/util/new_notes_hi.res" -->
<!--#include virtual = "/cloud/util/new_notes_ta.res" -->
<!--#include virtual = "/cloud/util/new_notes_te.res" -->
<!--#include virtual = "/cloud/util/new_notes_mr.res" -->
<center>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td width="100%" class="boxtopbg">
                    <div class="boxhdg">
                        ||&nbsp;&nbsp;<%=GetString("COMMENTS")%>&nbsp;&nbsp;||</div>
                    <div id="headad" align="center" style="padding-top: 10px;">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</center>

<div id="usercontent" style="display:none;">
<form name="notesfrm" id="notesfrm" action="" method="get">
<div align="center" style="border:#000 0px solid; text-align:center;" id="usertext">   
</div>
<div align="center" >
    <textarea id="comments" rows="10" cols="50" name="notes" onkeypress="limitcharById('comments','remainchar',4000);" onkeydown="limitcharById('comments','remainchar',4000);" onkeyup="limitcharById('comments','remainchar',4000);"></textarea>
    <br /><%=GetString("REMAINS_CHAR") %>(<span id="remainchar">4000</span>)
</div>
<div align="center">
    <input type="button" class="mybutton" onclick="saveComments();" name="save" value="<%=GetString("SAVE") %>" />
    <input class="mybutton" id="cancel-usernotes" type="button"  name="cancel" value="<%=GetString("CANCEL") %>" />
</div>
</form>
</div>

<div class="user-msg" id="user-msg" style="display:none;"></div>

