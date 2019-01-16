// Audio
var audio = new Audio('pong.mp3');
var audio2 = new Audio('ping.mp3');
var audio3 = new Audio('over.mp3');
// Zmienne
var rakietka = document.getElementById("rakietka");
var piłka = document.getElementById("piłka");
var wall = document.getElementById("wall");
var Points=0;
var items = [];
var speed = 2;
piłka.vh = speed;
piłka.vv = speed;
// Funkcja wyswietlająca wynik
		function Score() {
			document.getElementById('zdobytePunkty').firstChild.data = Points;	
		}
// Funkcja losujaca			
		function randInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
// Funkcja odpowiadająca za zmianę polożenia		
		function doAnimation() {
			piłka.cx.baseVal.value += piłka.vh;
			piłka.cy.baseVal.value += piłka.vv;
			Obszar();
			kolizjarakietka();
			kolizjaItem();
			Score();
		}
// Kolizja z rakietką		
		function kolizjarakietka() {
			speed+=0.001;
			var pX = rakietka.x.baseVal.value;
			var pY = rakietka.y.baseVal.value;
			var pW = rakietka.width.baseVal.value;
			var cX = piłka.cx.baseVal.value;
			var cY = piłka.cy.baseVal.value;
			var cR = piłka.r.baseVal.value;
			if (cY + cR > pY && cY < pY) {
				if (cX > pX && cX < pX + pW) {
                    piłka.vv = -speed;
                    audio.play();
				}}
			}
// Kolizja z kóleczkiem        
        function kolizjaItem() {
		var isEmpty = true;
		for (var i = items.length - 1; i >= 0; i--) {
        var item = items[i];
        if (item == null) continue;
        isEmpty = false;
        var deltaX = item.cx.baseVal.value - piłka.cx.baseVal.value;
        var deltaY = item.cy.baseVal.value - piłka.cy.baseVal.value;
        var d = Math.sqrt( (deltaX*deltaX) + (deltaY*deltaY) );
        if (d <= ( item.r.baseVal.value + piłka.r.baseVal.value )) {
            wall.removeChild(item);
            items[i] = null;
            piłka.vh = deltaX < 0 ? speed : -speed;
            piłka.vv = deltaY < 0 ? speed : -speed;
            Points++;
            audio2.play();
            return;
        }}
        if (isEmpty) zapelnij();}
// Zapelnienie kolami         
        function zapelnij() {
			while (wall.hasChildNodes()) 
				{ wall.removeChild(wall.lastChild);}
				for (var i = 0; i < 13; i++) {
					for (var j = 0; j < 3; j++) {
						var item = document.createElementNS("http://www.w3.org/2000/svg", "circle");
						item.r.baseVal.value = 10;
						item.cx.baseVal.value = i*30+20;
						item.cy.baseVal.value = j*25+25;
						item.style.fill = "#8ca5cc";
						item.style.stroke = "black";
						items.push(item);
						wall.appendChild(item);}}}
		
		function sleep(ms) {
			return new Promise(resolve => setTimeout(resolve, ms));
		}
		  
		async function spanko() {
			console.log('Nie mogę, mam spanko...');
			await sleep(10000);
			console.log('Już nie XD');
		}

		function Obszar() {
		var r = piłka.r.baseVal.value;
		if (piłka.cx.baseVal.value + r >= 400) {
		piłka.vh = -speed;
		} else if (piłka.cx.baseVal.value -r <= 0) {
		piłka.vh = speed;
		}
		if (piłka.cy.baseVal.value + r >= 300) {
		piłka.vv = 0;
		piłka.vh = 0;
		audio3.play();
		spanko();
		alert("GAME OVER! Twój wynik to: " + Points);
		location.reload(); 
		} else if (piłka.cy.baseVal.value -r  <= 0) {
		piłka.vv = speed;
		}}

		function processKeys(e) {
		switch (e.keyCode) {
		case 39 :
			var x = rakietka.x.baseVal.value;
			x = x + 20;
			if (x > 310) x = 310;
			rakietka.x.baseVal.value = x;
		break;
		case 37 :
			var x = rakietka.x.baseVal.value;
			x = x - 20;
			if (x < 10) x = 10;
			rakietka.x.baseVal.value = x;
		break;
	}
}
window.addEventListener('keydown', processKeys, false);
		zapelnij();
		setInterval('doAnimation()',16.7);