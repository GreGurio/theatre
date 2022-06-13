function removeActor(ev) {
		let buttonWord = "remove-btn";
		let id = ev.currentTarget.id;
		let index = id.slice(buttonWord.length, id.length);
		let record = document.getElementById("actor" + index);
		record.remove();

		let actorToDatalist = record.getElementsByClassName("actor-name");
	
		let datalist = document.getElementById("actors");
		datalist.innerHTML = datalist.innerHTML + `<option value="${actorToDatalist[0].innerHTML}">`;
		inputActors();
}

function addActorIntoSpectacle() {
		let spectacleMembers = document.getElementById("spectacleMembers");

		if(spectacleMembers.children.length > 0) {
			numOfElements = spectacleMembers.getElementsByClassName('actor-element').length;
		}
		else {
			numOfElements = 0;
		}

		let input = document.getElementById("actorsListContent");
		let actorName = input.value;
		
		if(actorName == "") {
			return;
		}
		
		let newContent = `<span id="actor${numOfElements + 1}" class="actor-element add-margin">
				    			<span class="actor-name">${actorName}</span>
				    			<span class="btn-container">
				    			<button id="remove-btn${numOfElements + 1}" type="button" onclick="removeActor(event)" class="actor-delete-btn"><img src="/static/img/icons/remove-from-list.svg" alt="delete"></button>
				    			</span>
				    		</span>`
		spectacleMembers.innerHTML += newContent;
		input.value = "";

		let datalist = document.getElementById("actors");
		let options = datalist.getElementsByTagName("option");
		
		for(let i = 0; i < options.length; i++) {
			if(options[i].value == actorName) {
				options[i].remove();
			}
		}

		inputActors();
}



function removeAvailableActorsFromDatalist() {
	let datalist = document.getElementById("actors");
	if(datalist.children.length < 1) {
			console.log("no");
			return;
		}
		
	const namesCollection = document.getElementsByClassName("actor-name");
	const names = []

	for(let i = 0; i < namesCollection.length; i++) {
		names.push(namesCollection[i].innerHTML);
	}

	const optionsCollection = Array.from(datalist.childNodes);

	for(let i = 0; i < optionsCollection.length; i++){
		if(names.includes(optionsCollection[i].value)) {
			optionsCollection[i].remove();
		}
	}
	inputActors();
}


// ********************************************************************************************************************************
// ********************************************************************************************************************************
// ********************************************************************************************************************************
// ********************************************************************************************************************************
// ********************************************************************************************************************************


function removeWorker(ev) {
		let buttonWord = "removeWorker-btn";
		let id = ev.currentTarget.id;
		let index = id.slice(buttonWord.length, id.length);
		let record = document.getElementById("worker" + index);
		record.remove();

		let workerToDatalist = record.getElementsByClassName("worker-name");
	
		let datalist = document.getElementById("workers");
		datalist.innerHTML = datalist.innerHTML + `<option value="${workerToDatalist[0].innerHTML}">`;
		inputWorkers();
}

function addWorkerIntoSpectacle() {
		let spectacleWorkers = document.getElementById("spectacleWorkers");

		if(spectacleWorkers.children.length > 0) {
			numOfElements = spectacleWorkers.getElementsByClassName('worker-element').length;
		}
		else {
			numOfElements = 0;
		}

		let input = document.getElementById("workersListContent");
		let workerName = input.value;
		
		if(workerName == "") {
			return;
		}
		
		let newContent = `<span id="worker${numOfElements + 1}" class="worker-element actor-element add-margin">
				    			<span class="worker-name actor-name">${workerName}</span>
				    			<span class="btn-container">
				    			<button id="removeWorker-btn${numOfElements + 1}" type="button" onclick="removeWorker(event)" class="actor-delete-btn"><img src="/static/img/icons/remove-from-list.svg" alt="delete"></button>
				    			</span>
				    		</span>`
		spectacleWorkers.innerHTML = spectacleWorkers.innerHTML + newContent;
		input.value = "";

		let datalist = document.getElementById("workers");
		let options = datalist.getElementsByTagName("option");
		
		for(let i = 0; i < options.length; i++) {
			if(options[i].value == workerName) {
				options[i].remove();
			}
		}

		inputWorkers();
}



function removeAvailableWorkersFromDatalist() {
	let datalist = document.getElementById("workers");
	if(datalist.children.length < 1) {
			console.log("no");
			return;
		}
		
	const namesCollection = document.getElementsByClassName("worker-name");
	const names = []

	for(let i = 0; i < namesCollection.length; i++) {
		names.push(namesCollection[i].innerHTML);
	}

	const optionsCollection = Array.from(datalist.childNodes);

	for(let i = 0; i < optionsCollection.length; i++){
		if(names.includes(optionsCollection[i].value)) {
			optionsCollection[i].remove();
		}
	}
	inputWorkers();
}



function init() {
	removeAvailableActorsFromDatalist();
	removeAvailableWorkersFromDatalist();
}

window.onload = init;


function inputActors() {
	const actorsFields = document.getElementById("spectacleMembers");
	const namesCollection = actorsFields.getElementsByClassName("actor-name");
	let actorsString = "";
	for(let i = 0; i < namesCollection.length; i++) {
		actorsString += namesCollection[i].innerHTML + ",";
	}
	actorsString = actorsString.slice(0, actorsString.length - 1); 
	
	let actorsNames = document.getElementById("actorsInput");
	actorsNames.value = actorsString;
}

function inputWorkers() {
	const namesCollection = document.getElementsByClassName("worker-name");
	let workersString = "";
	for(let i = 0; i < namesCollection.length; i++) {
		workersString += namesCollection[i].innerHTML + ",";
	}
	workersString = workersString.slice(0, workersString.length - 1); 
	
	let workersNames = document.getElementById("workersInput");
	workersNames.value = workersString;
}
