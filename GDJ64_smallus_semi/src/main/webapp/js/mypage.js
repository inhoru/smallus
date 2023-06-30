
    
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
 