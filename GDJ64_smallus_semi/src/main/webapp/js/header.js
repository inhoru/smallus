
// 카테고리 숨긴 상태로 시작
$(document).ready(() => {
  $("#categoriesTable").hide();
});

// 카테고리 클릭시 열리고 닫히는 이벤트
$("#categories").click(() => {
  $("#categoriesTable").slideToggle(500);
});

// 카테고리 열었을 때 다른 곳을 클릭해도 닫힘
$(document).click((e) => {
  const categoriesTable = $("#categoriesTable");
  const categories = $("#categories");
  const isCategoriesTableVisible = categoriesTable.is(":visible");
  const isClickedInsideCategories = categories[0].contains(e.target);
  const isClickedInsideTable = categoriesTable[0].contains(e.target);

  if (isCategoriesTableVisible && !isClickedInsideCategories && !isClickedInsideTable) {
    categoriesTable.slideUp(500);
  }
});

// 알람
$(".i-noticon").on("click", () => {
  $(".notification-container").slideToggle(300);
});
//비로그인시 마이페이지 클릭시 생기는 로그인창
$(".i-loginPage").on("click",()=>{
  $(".i-loginMove").slideToggle(300);
})