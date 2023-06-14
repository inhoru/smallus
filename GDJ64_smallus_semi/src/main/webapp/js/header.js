// 검색아이콘 클릭시 발생하는 이벤트
const $img = document.getElementsByClassName("icon")[0];
let isToggled = false;

$img.addEventListener("click", e => {
    const nav = document.querySelector("#headerContainer #categories");
    const nav1 = document.querySelector("#headerContainer #hiddenseach");
    const icon = document.querySelector(".iconContainer").children;
    const icon2 = document.querySelector(".iconContainer>.icon>input");
    const searchField = document.getElementById("search");
    const bodys = document.getElementById("mainOpacity");
    const searchForm = document.querySelector("#hiddenseach form");

    
    if (isToggled) {
        searchForm.submit();
    } else {
        icon[0].style.transform = "translateX(-170px)";
        icon[0].style.transition = "0.7s";
        nav.style.display = "none";
        nav1.style.display = "flex";
        bodys.style.opacity = "0.5";
        searchField.value = "";
        searchField.focus();  
    }
    isToggled = !isToggled;
});

// 검색창 활성화 상태에서 다른곳 클릭시 다시돌아가는 이벤트
document.addEventListener("click", function (e) {
    const searchIcon = document.getElementsByClassName("icon")[0];
    const clickedInsideSearch = searchIcon.contains(e.target);
    const searchField = document.getElementById("search");
    const clickedInsideField = searchField.contains(e.target);

    if (!clickedInsideSearch && !clickedInsideField && isToggled) {
        const nav = document.querySelector("#headerContainer #categories");
        const nav1 = document.querySelector("#headerContainer #hiddenseach");
        const icon = document.querySelector(".iconContainer").children;
        const bodys = document.getElementById("mainOpacity");

        icon[0].style.transform = "translateX(0px)";
        icon[0].style.transition = "0.7";
        nav.style.display = "";
        nav1.style.display = "";
        bodys.style.opacity = "";
        searchField.value = "";

        isToggled = false;
    }
});

//카테고리 숨긴상태로 시작
$(document).ready(() => {
    $("#categoriesTable").hide();
});

//카테고리 클릭시 열리고 닫히고 
$("#categories").click(() => {
    $("#categoriesTable").slideToggle(500)
    
});

//카테고리 열었을때 다른곳을 클릭해도 닫힘
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

$(".notification-icon").on("click", e => {
    $(".notification-container").slideToggle(300)
});
  

  
  