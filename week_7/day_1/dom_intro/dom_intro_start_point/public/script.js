window.onload = function() {
	console.log( 'Window has loaded' );
	var paragraph = document.getElementById( 'myId' );
	console.log( paragraph );
	paragraph.onclick = function() {
		console.log( 'Ive been clicked!!' )
	}
}

