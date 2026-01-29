<script type="text/javascript">
    function validateSearchForm() {
        if (document.SearchForm.q.value == " " || document.SearchForm.q.value == "" || document.SearchForm.q.value == "AstroSage Search") {
            alert("Please fill out this field.");
            document.forms["SearchForm"]["q"].value = " ";
            document.SearchForm.q.focus();
            return false;
        }
    }
</script>
<form class="navbar-form" action="http://www.astrosage.com/search.asp" id="cse-search-box" name="SearchForm" onsubmit="return validateSearchForm();">
<div class="form-group">
    <input type="hidden" name="cx" value="partner-pub-7494543079410386:j4sx8h3aj6u" />
    <input type="hidden" name="cof" value="FORID:10" />
    <input type="hidden" name="num" value="20" />    
    <input type="text" name="q" class="search-input br-radius card-shadow" placeholder=" एस्ट्रोसेज में खोजें" />    
</div>
<button type="submit" class="btn-search"><i class="material-icons">&#xE8B6;</i></button>

</form>
