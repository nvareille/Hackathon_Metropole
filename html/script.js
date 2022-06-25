

// var form = new FormData(document.getElementById('form'));
// fetch("/login", {
//   method: "POST",
//   body: form
// })


function sendData () {
    
    var data = new FormData();
    data.append("Username", document.getElementById("Username").value);
    data.append("Siret", document.getElementById("Siret").value);
    data.append("Password", document.getElementById("Password").value);
   
    // (B) INIT FETCH POST
    fetch("https://voxworld.thelair.fr/api/Authentication", {
      method: "POST",
      body: data
    })
   
    // (C) RETURN SERVER RESPONSE AS TEXT
    .then((result) => {
      if (result.status != 200) { throw new Error("Bad Server Response"); }
      return result.text();
    })
   
    // (D) SERVER RESPONSE
    .then((response) => {
      console.log(response);
    })
   
    // (E) HANDLE ERRORS - OPTIONAL
    .catch((error) => { console.log(error); });
   
    // (F) PREVENT FORM SUBMIT
    return false;
  }
