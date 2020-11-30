window.addEventListener('load', function(){

  const informationDetail = document.getElementById("information");
  const removeHidden = document.getElementById("remove-hidden2");

  informationDetail.addEventListener(`mouseover`, function(){
    removeHidden.setAttribute("style", "display:block;")
  });

  informationDetail.addEventListener(`mouseout`, function(){
    removeHidden.removeAttribute("style", "display:block;")
  });

});