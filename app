@charset="UTF-8"

var TxtRotate = function(el, toRotate, period) {
  this.toRotate = toRotate;
  this.el = el;
  this.loopNum = 0;
  this.period = parseInt(period, 10) || 2000;
  this.txt = '';
  this.tick();
  this.isDeleting = false;
};



TxtRotate.prototype.tick = function() {
  var i = this.loopNum % this.toRotate.length;
  var fullTxt = this.toRotate[i];

  if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
  } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
  }

  this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

  var that = this;
  var delta = 300 - Math.random() * 100;

  if (this.isDeleting) { delta /= 2; }

  if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
  } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
  }

  setTimeout(function() {
    that.tick();
  }, delta);
};

window.onload = function() {
  var elements = document.getElementsByClassName('txt-rotate');
  for (var i=0; i<elements.length; i++) {
    var toRotate = elements[i].getAttribute('data-rotate');
    var period = elements[i].getAttribute('data-period');
    if (toRotate) {
      new TxtRotate(elements[i], JSON.parse(toRotate), period);
    }
  }
  // INJECT CSS
  var css = document.createElement("style");
  css.type = "text/css";
  css.innerHTML = ".txt-rotate > .wrap { border-right: 0.08em solid #666 }";
  document.body.appendChild(css);
};

$(function(){
  $(".slideshow-slide li").css({"position":"relative"});
  $(".slideshow-slide li").hide().css({"position":"absolute"});
  $(".slideshow-slide li:first").addClass("slide");
  $(".slideshow-slide li:nth-child(2)").css({"display":"block"});
  setInterval(function(){
    var $active = $(".slideshow-slide li.slide");
    var $next = $active.next("li").length?$active.next("li"):$(".slideshow-slide li:first");
    var $nextnext = $next.next("li");
    $active.fadeOut(0).removeClass("slide");
    $next.show().addClass("slide");
    $nextnext.css({"display":"block"});
  },3000);
});

.grid1 {
  /* この要素はflexコンテナとなり、子要素は自動的にflexアイテムとなる */
  display: flex;

  /* 横並びに表示する */
  flex-direction: row;

  /* 画面幅に収まらない場合は折り返す */
  flex-wrap: wrap;
}
.card-info {

}
.container{
  width:600px;
  height:auto;
  position: relative;
}
.container img{
  width:100%;
  height:auto;
}
.card-group{
  position: absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  padding:0;
  margin:0;
  font-size:30px;
  color: red;
}
.grid2 {
  /* この要素はflexコンテナとなり、子要素は自動的にflexアイテムとなる */
  display: flex;

  /* 横並びに表示する */
  flex-direction: row;

  /* 画面幅に収まらない場合は折り返す */
  flex-wrap: wrap;
}
