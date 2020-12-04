function check() {
  const chats = document.querySelectorAll(".chat");
  chats.forEach(function (chat) {
    if (chat.getAttribute("data-load") != null) {
      return null;
    }
    chat.setAttribute("data-load", "true");
    chat.addEventListener("click", () => {
      const chatId = chat.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/chats/${chatId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        const item = XHR.response.chat;
        if (item.checked === true) {
          chat.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          chat.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);