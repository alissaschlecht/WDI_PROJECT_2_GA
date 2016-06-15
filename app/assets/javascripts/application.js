//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery

//= require bootstrap-sprockets



// front page toggle menu

$(document).ready(function(){
  $('.hide_button_container').click(function () {
      $('#hideshow').toggle('hide');
  });
});



// YOUTUBE

var videos;

// items that need to be in document.ready

$(document).ready(function(){
  videos = $('#youtubeVideosList').val();
  videos = JSON.parse(videos);

  $('#restart').click(function(){
    if (isPlayerReady) {
      currentPlayed = 0;
      playNextVideo();
    } else {
      // recreate the player if needed
      onYouTubeIframeAPIReady()
    }
  });

});

var player; 
var currentPlayed;

function onYouTubeIframeAPIReady() { 
  player = new YT.Player('youtubePlayer', {
    playerVars: {
      rel: 0, // do not play anything else after
      showinfo: 0, // do not show the title
      modestbranding: 1, // remove youtube logo
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange,
    }
  });
}

var isPlayerReady = true;
function onPlayerReady() {
  currentPlayed = 0;
  isPlayerReady = true;
  playNextVideo();
}

function playNextVideo() {
  player.loadVideoById(videos[currentPlayed]);
  play();
}

function play() {
  player.playVideo();
}

function stop() {
  player.stopVideo();
  player.destroy();
  isPlayerReady = false;
}

var hasPausedBeforeStop = false;
function  onPlayerStateChange(event) {
  if (!hasPausedBeforeStop && event.data == YT.PlayerState.PAUSED) {
    hasPausedBeforeStop = true;
  } else if (hasPausedBeforeStop && event.data == YT.PlayerState.ENDED) {
    if (currentPlayed !== videos.length - 1) {
      currentPlayed = currentPlayed + 1;
      playNextVideo();
    } else {
      stop();
    }
  } else {
    hasPausedBeforeStop = false;
  }
}

    





