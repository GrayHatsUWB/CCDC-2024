var timerElement = document.getElementById("timer");
var timerInterval;
var remainingTime = 5 * 60;
const socket = io();


function createInject()
{  
  //TURN INPUT FIELDS INTO VARIABLE VALUES
  var injectName = document.getElementById("injectName").value.trim();
  var injectType = document.getElementById("injectType").value;
  var overallTime = document.getElementById("overallTime").value.trim();
  var priorityLevel = document.getElementById("priorityLevel").value;
  var difficultyLevel = document.getElementById("difficultyLevel").value;
  
  //CHECK FOR USABLE INPUT
  if (injectName === "" || overallTime === "") {
    alert("Please enter inject name and overall time.");
    return;
  }
  
  //CREATE DICTIONARY FOR TABLE ADDITION
  var newInject = {
    'inject_name': injectName,
    'inject_type': injectType,
    'overall_time': overallTime,
    'priority': priorityLevel,
    'difficulty': difficultyLevel
  }
  socket.emit("new_inject", newInject);

  //RESET INPUT FIELDS
  document.getElementById("injectName").value = "";
  document.getElementById("injectType").value = "Misc";
  document.getElementById("overallTime").value = "";
  document.getElementById("priorityLevel").value = "1";
  document.getElementById("difficultyLevel").value = "1";
}

//IGNORE THIS - FOR ALL INTENTES AND PURPOSES SOLVED
function addInject(inject) 
{
  //Get inject table

  var injectTable = document.getElementById("injectTable");
  var foundSpot = false;
  var rowChoice = 1;

  while(!foundSpot)
  {
    if (rowChoice == injectTable.rows.length) foundSpot = true;
    else if (injectTable.rows[rowChoice].cells[1].innerHTML.localeCompare(inject.inject_type) < 0) rowChoice++;
    else if (parseInt(injectTable.rows[rowChoice].cells[3].innerHTML) * parseInt(injectTable.rows[rowChoice].cells[4].innerHTML) >= inject.priority * inject.difficulty) rowChoice++;
    else foundSpot = true;
  }
  var newRow = injectTable.insertRow(rowChoice);

  //CREATE CELLS WITHIN ROW
  var nameCell = newRow.insertCell();
  var injectTypeCell = newRow.insertCell();
  var remainingTimeCell = newRow.insertCell();
  var priorityLevelCell = newRow.insertCell();
  var difficultyLevelCell = newRow.insertCell();
  var overallTimeCell = newRow.insertCell();
  var moveButtonCell = newRow.insertCell();

  //POPULATE CELLS WITH DATA
  nameCell.innerHTML = inject.inject_name;
  injectTypeCell.innerHTML = inject.inject_type;
  overallTimeCell.innerHTML = inject.overall_time;
  priorityLevelCell.innerHTML = inject.priority;
  difficultyLevelCell.innerHTML = inject.difficulty;

  //BEGIN REMAINING TIME COUNTDOWN
  var remainingTime = convertTimeToSeconds(inject.overall_time);
  remainingTimeCell.innerHTML = formatTime(remainingTime);

  setInterval(function () {
  remainingTime--;
  remainingTimeCell.innerHTML = formatTime(remainingTime);
  setTimerColor(remainingTimeCell, remainingTime);
  if (remainingTime <= 0) {
    clearInterval(this);
    remainingTimeCell.innerHTML = "00:00";
    newRow.classList.add("past-inject");
    newRow.classList.add("red");
  }
  }, 1000);

  //CREATE MOVE BUTTON
  var moveButton = document.createElement("button");
  moveButton.innerText = "Move";
  moveButton.addEventListener("click", moveInject);
  moveButtonCell.appendChild(moveButton);

  var audio = new Audio('static/addedInject.wav');
  audio.play();

  document.getElementById("flashcontrol").classList.add("flash");
  document.getElementById("flashcontrol").addEventListener("animationend", () => document.getElementById("flashcontrol").classList.remove("flash"), {once: true});
}


function moveInject(event) {
    var row = event.target.parentNode.parentNode;
    row.classList.remove("red");
    row.classList.remove("yellow");
    row.classList.add("past-inject");

    var pastInjectsTable = document.getElementById("pastInjectsTable");
    var newRow = pastInjectsTable.insertRow();
    var nameCell = newRow.insertCell();
    nameCell.innerHTML = row.cells[0].innerHTML;
    nameCell.classList.add("past-inject-lilac");
    row.remove();
}

function convertTimeToSeconds(time) {
    var splitTime = time.split(":");
    var minutes = parseInt(splitTime[0]);
    var seconds = parseInt(splitTime[1]);
    return minutes * 60 + seconds;
}

function setTimerColor(cell, remainingTime) 
{
    if (remainingTime <= 300) {
        cell.classList.add("timer-red");
    } else if (remainingTime <= 600) {
        cell.classList.remove("timer-red");
        cell.classList.add("timer-yellow");
    } else {
        cell.classList.remove("timer-yellow");
        cell.classList.add("timer-green");
    }
}

function startTimer() {
  timerInterval = setInterval(updateTimer, 1000);
}

function updateTimer() {
  remainingTime--;
  timerElement.innerHTML = formatTime(remainingTime);

  if (remainingTime < 0) {
      resetTimer();
      var audio = new Audio('static/timerReset.wav');
      audio.play();
  }
}

function resetTimerButtonClick() {
  socket.emit("reset_main_timer");
  resetTimer();
}
function resetTimer() {
  clearInterval(timerInterval);
  remainingTime = 5 * 60;
  timerElement.innerHTML = formatTime(remainingTime);
  startTimer();
}

function formatTime(time) {
  var minutes = Math.floor(time / 60);
  var seconds = time % 60;
  return minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");
}
//BEGIN SCRIPTED ACTIONS

socket.on("add_new_inject", function(data) {
  addInject(data);
})

socket.on("main_timer_sync", function(){
  resetTimer();
})

//LOAD CSV FILE HERE

//END CSV FILE LOAD

startTimer();