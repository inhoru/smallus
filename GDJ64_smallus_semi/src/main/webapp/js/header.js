//검색창 상태 열린상태 true/닫힌상태 false
let isSearchFieldActive = false;
// 검색아이콘 클릭시 발생하는 이벤트
$(".i-searchIcon").click((e) => {
  const icon = $(".i-iconinfo");
  const searchField = $(".search");
  const categories = $("#categories");
  const form = $("form"); 

  if (isSearchFieldActive) {
    form.submit();  // 폼을 제출하여 검색을 실행합니다.
    return;
  }

  icon.css("visibility", "hidden");
  searchField.css("display", "flex");
  categories.css("visibility", "hidden");
  $(".i-searchIcon").css("transform", "translateX(-115px)");
  $(".i-searchIcon").css("transition", "0.7s");
  $("#mainOpacity").css("opacity", "0.5");

   searchField.focus();
  isSearchFieldActive = true; 

  // 다른 곳 클릭 시 검색창과 아이콘을 되돌림
  $(document).one("click", (e) => {
    const clickedInsideSearchIcon = $(e.target).hasClass("i-searchIcon");
    const clickedInsideSearchField = $(e.target).is(".search");
    const searchContainer = $(".iconContainer");

    if (!clickedInsideSearchIcon && !clickedInsideSearchField && !searchContainer.has(e.target).length) {
      icon.css("visibility", "visible");
      searchField.css("display", "none");
      categories.css("visibility", "visible");
      $(".i-searchIcon").css("transform", "translateX(0)");
      $(".i-searchIcon").css("transition", "0.4s");
      $("#mainOpacity").css("opacity", "1.0");
       isSearchFieldActive = false;
       searchField.val(""); 
    }
  });

  // 이벤트 전파 방지
  e.stopPropagation();
});

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