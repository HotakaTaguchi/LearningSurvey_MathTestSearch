
$(".toggle").on("click", function() {
  $(".toggle").toggleClass("checked");
  if(!$('input[name="check"]').prop("checked")) {
    $(".toggle input").prop("checked", true);
  } else {
    $(".toggle input").prop("checked", false);
  }
}); 

var flg = "close";
$(function() {
    $("#detail").click(function() {
        $("#search_box").slideToggle();
        if(flg === "open"){
          document.getElementById('detail').firstElementChild.textContent="⊞ 詳細";
          flg = "close";
        }else if(flg === "close"){
          document.getElementById('detail').firstElementChild.textContent="⊟ 詳細";
          flg = "open";
        }
    });
});


document.querySelector('[name="sort"]').onchange = event => { 
  if(location.pathname=="/mathtestsearch/index"){
    let checkSaveFlg = window.confirm('全検索になりますがよろしいですか?');
    if(checkSaveFlg) {
      document.getElementById("sort").submit();
    }else{
      document.getElementById("sort").sort.options[0].selected = true;
      return false;
    }
  }
  document.getElementById("sort").submit();
}

function check1(){
  if(document.form.correct_rate1.value==""){
    document.form.correct_rate1.value="0"
  }
}

function check2(){
  if(document.form.correct_rate2.value==""){
    document.form.correct_rate2.value="100"
  }
}

// URLを取得
let url = new URL(window.location.href);

// URLSearchParamsオブジェクトを取得
let params = url.searchParams;
document.getElementById("keyward").value = params.get('name');
let year = params.get('year')
if(params.get('year')>0){
  year = params.get('year')-2006;
}


document.form.year.options[year].selected = true;
let year_op = params.get('year_op')-1;
document.form.year_op.options[year_op].selected = true;
let subject = '1';
switch (params.get('subject')) {
  case 'A':
    subject = '1';
    break;
  case 'B':
    subject = '2';
    break;
  default:
    subject = '0';
    break;
}
document.form.subject.options[subject].selected = true;
document.form.correct_rate1.value = params.get('correct_rate1');
document.form.correct_rate2.value = params.get('correct_rate2');
document.form.grade.options[params.get('grade')].selected = true;
document.form.field.options[params.get('field')].selected = true;
document.form.category.options[params.get('category')].selected = true;
