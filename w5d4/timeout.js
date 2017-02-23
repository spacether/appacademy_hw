
function hammertime(time) {
  window.setTimeout(() => {
    window.alert(`${time} is hammertime!`);
  }, time);
}

window.hammertime(5000);
