function change_category(){
			var selectBox = $("select[name=selectBox]").val();
			switch(selectBox){
			case "all": 
				$("select[name=sub_music]").hide();
				$("select[name=sub_game]").hide();
				$("select[name=sub_issue]").hide();
				$("select[name=sub_travel]").hide();
				break;
			case "music": 
				$("select[name=sub_music]").show();
				$("select[name=sub_game]").hide();
				$("select[name=sub_issue]").hide();
				$("select[name=sub_travel]").hide();
				break;
			case "game": 
				$("select[name=sub_music]").hide();
				$("select[name=sub_game]").show();
				$("select[name=sub_issue]").hide();
				$("select[name=sub_travel]").hide();
				break;
			case "issue": 
				$("select[name=sub_music]").hide();
				$("select[name=sub_game]").hide();
				$("select[name=sub_issue]").show();
				$("select[name=sub_travel]").hide();
				break;
			case "travel": 
				$("select[name=sub_music]").hide();
				$("select[name=sub_game]").hide();
				$("select[name=sub_issue]").hide();
				$("select[name=sub_travel]").show();
				break; 
			};
		}