/* 패스워드 변경창 */

const context="http://localhost:8080/GDJ64_smallus_semi";
const memberId=$(".i-memberId").val();
    const fn_updatePassword=()=>{
		 event.preventDefault();
		window.open(context+"/member/updatePassword.do?userId="+memberId,"_blank",'width=500 , height=330, left=670, top=300')
		
	}
    /* 닉네임 변경창 */
    const fn_updateNickname=()=>{
		window.open(context+"/updatenickname.do","_blank",'width=500 , height=330, left=670, top=300');
		 event.preventDefault();
		}
		/*이메일 변경창*/
		const fn_updateEmail=()=>{
		window.open(context+"/updateEmail.do","_blank",'width=550 , height=330, left=670, top=300');
		 event.preventDefault();
		}
    
    /* 프로필사진변경 */
    $(".i-proFileInfoimg").click(e=>{
 		$("#profileInput").click();
 	});
 	
 	$("#profileInput").change(e=>{
 		const reader=new FileReader();
 		reader.onload=e=>{
 			//e.target.result속성에 변경된 file이 나옴.
 			$(".i-myprofile").attr({src:e.target.result});
 		}
 		reader.readAsDataURL(e.target.files[0]);

 	});
 