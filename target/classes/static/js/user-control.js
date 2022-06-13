function showForm() {
		let form = document.getElementById("changing-form-container");
		if(form.classList.contains("closed1")) {
			form.classList.remove("closed1");
		}
		else {
			form.classList.add("closed1");
		}
	}

	function init() {
		
		let closeChangeButton = document.getElementById("form-close-btn");
		
		closeChangeButton.addEventListener("click", showForm);
		let openChangeButton1 = document.getElementById("change-btn1");
		let openChangeButton2 = document.getElementById("change-btn2");
		let openChangeButton3 = document.getElementById("change-btn3");
		let openChangeButton4 = document.getElementById("change-btn4");
		let openChangeButton5 = document.getElementById("change-btn5");

		openChangeButton1.addEventListener("click", showForm);
		openChangeButton2.addEventListener("click", showForm);
		openChangeButton3.addEventListener("click", showForm);
		openChangeButton4.addEventListener("click", showForm);
		openChangeButton5.addEventListener("click", showForm);
	}

	window.onload = init;


	function removeRecord(id) {
        	index = id[id.length - 1];
        	let record = document.getElementById("record" + index);
        	record.style.display = "none";
	}




