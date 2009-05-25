// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
    $('#board1').chess({fen : "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"});
    $('[id^=board1_]').draggable();
});



// peça -> .mouseDown(validadePiece), .mouseUp(move(); if(validadeMove()) registerMove; push no outro jogador;)