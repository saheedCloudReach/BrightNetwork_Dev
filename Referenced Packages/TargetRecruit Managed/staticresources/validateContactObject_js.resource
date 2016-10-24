function submitforthisopportunity(noac){
	var flag_selected=false;
	for(var iii=0;iii<noac;iii++){
		box = document.getElementById("thePage:theForm:block:searchCriteria:table:"+iii+":theCheckbox" );
		if (box.checked == true) {
			flag_selected=true;
			return true
		}
	}
	alert("Please select the Job.");
	return false;
}