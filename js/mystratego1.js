var me={};
var game_status={};



$(function () {
	draw_empty_board();
	fill_board();
	choice();
	
	//fill_board_player();
	
	
	
});





function draw_empty_board() {
	var t='<table id="stratego_table">';
	
	for(var i=8;i>0;i--) {
		t += '<tr>';
		for(var j=1;j<6;j++) {
			t += '<td class="chess_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#stratego_board').html(t);
}




function choice(p) {

if(p!='B') {p='R';}
	var draw_init = {
		'R': {i1:10,i2:0,istep:-1,j1:1,j2:9,jstep:1},
		'B': {i1:1,i2:9,istep:1, j1:10,j2:0,jstep:-1}
	};
	var s=draw_init[p];
	var t='<table id="stratego_table1">';
	for(var i=s.i1;i!=s.i2;i+=s.istep) {
		t += '<tr>';
		for(var j=s.j1;j!=s.j2;j+=s.jstep) {
			t += '<td class="chess_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';	
	$('#stratego_choice').html(t);
}














function fill_board() {
	$.ajax({url: "index1.php/board_player/", success: fill_board_by_data });
	
}


function reset_board() {
	$.ajax({url: "index1.php/board/", method: 'POST',  success: fill_board_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
}



/*
function fill_board_player() {
	$.ajax({url: "index1.php/board_player/", success: fill_board_by_data_player });
	
}



fill_board_by_data_player(data) {


	board=data;
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var im = (o.piece!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);




}

}
*/




function fill_board_by_data(data) {


	board=data;
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var im = (o.piece!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
		
	}
	
	
	
	
	
}






function game_status_update() {
	$.ajax({url: "index1.php/status/", success: update_status });
}

function update_status(data) {
	game_status=data[0];
	update_info();
	if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
		x=0;
		// do play
		$('#move_div').show(1000);
		setTimeout(function() { game_status_update();}, 15000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		setTimeout(function() { game_status_update();}, 4000);
	}
 	
}

function update_info(){
	$('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
	
}

function do_move() {
	var s = $('#the_move').val();
	
	var a = s.trim().split(/[ ]+/);
	if(a.length!=4) {
		alert('Must give 4 numbers');
		return;
	}
	$.ajax({url: "index1.php/board/piece/"+a[0]+'/'+a[1], 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {x: a[2], y: a[3]}),
			success: move_result,
			error: login_error});
	
}

function move_result(data){
	
}

































