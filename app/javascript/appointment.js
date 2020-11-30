window.addEventListener('load', function(){

  const appointmentDetail = document.getElementById("appointment");
  const removeHidden = document.getElementById("remove-hidden");

  appointmentDetail.addEventListener(`mouseover`, function(){
    removeHidden.setAttribute("style", "display:block;")
  });

  appointmentDetail.addEventListener(`mouseout`, function(){
    removeHidden.removeAttribute("style", "display:block;")
  });

});

